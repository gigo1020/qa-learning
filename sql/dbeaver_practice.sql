/*
* SQL Practice on the Northwind Training Database (PostgreSQL)
* Author: Daria Koroleva
*
* Contains 10 queries:
* 1-5: Basic JOINs, subqueries, aggregation 
* 6-10: Additional practice tasks (LIMIT, GROUP BY, SUM, EXTRACT, discount accounting)
*
* Tool: DBeaver (PostgreSQL)
* Database: Northwind (https://github.com/pthom/northwind_psql)
*/


-- 1. Customers with a total order amount exceeding 1000
SELECT
	c.company_name,
	ROUND(SUM(od.unit_price * od.quantity)::numeric, 2) AS total_spent
FROM
	customers c
JOIN orders o ON
	c.customer_id = o.customer_id
JOIN order_details od ON
	o.order_id = od.order_id
GROUP BY
	c.customer_id
HAVING
	SUM(od.unit_price * od.quantity) > 1000;

-- 2. Items that are not included in any order
SELECT
	p.product_name
FROM
	products p
LEFT JOIN order_details od ON
	p.product_id = od.product_id
WHERE
	od.order_id IS NULL;
	
-- 3. Number of orders and total amount for each client
SELECT
	c.company_name,
	COUNT(DISTINCT o.order_id) AS number_of_orders,
	ROUND(SUM(od.unit_price * od.quantity)::NUMERIC, 2) AS total_sum
FROM
	customers c
JOIN orders o ON
	c.customer_id = o.customer_id
JOIN order_details od ON
	o.order_id = od.order_id
GROUP BY
	c.customer_id;
	
-- 4. Orders in the same month as the very first order
SELECT
	c.company_name,
	o.order_id,
	(SELECT MIN(order_date) FROM orders) AS first_order_date,
	o.order_date
FROM
	orders o
JOIN customers c ON
o.customer_id = c.customer_id
WHERE 
	EXTRACT(MONTH FROM order_date) = (SELECT EXTRACT(MONTH FROM MIN(order_date)) FROM orders)
  AND 
  	EXTRACT(YEAR FROM order_date) = (SELECT EXTRACT(YEAR FROM MIN(order_date)) FROM orders)
ORDER BY c.customer_id,
		 o.order_id;

-- 5. Product with the highest price
SELECT
	product_name,
	unit_price
FROM
	products
WHERE
	unit_price = (
	SELECT
		MAX(unit_price)
	FROM
		products);

-- 6. Five products with the highest price
SELECT
	product_name,
	unit_price
FROM
	products
ORDER BY
	unit_price DESC
LIMIT 5;

-- 7. Five products with the highest price, excluding those discontinued
SELECT
	product_name,
	unit_price
FROM
	products
WHERE discontinued = 0
ORDER BY
	unit_price DESC
LIMIT 5;

-- 8. 10 orders with the largest total quantity of goods
SELECT
	order_id,
	SUM(quantity) AS total_quantity
FROM
	order_details od
GROUP BY
	od.order_id
ORDER BY
	total_quantity DESC
LIMIT 10;

-- 9. Total revenue for orders placed in 1997
SELECT
	o.order_id,
	ROUND(SUM(od.unit_price * od.quantity)::NUMERIC, 2) AS total_revenue
FROM
	orders o
JOIN order_details od ON
	o.order_id = od.order_id
WHERE
	EXTRACT(YEAR FROM o.order_date) = 1997
GROUP BY
	o.order_id
ORDER BY
	total_revenue DESC;


/*  10. Find the top 5 customers who spent the most money over time. 
Output customer_id, company_name, and total spent. 
Sort the results by total spent in descending order and display the top 5.
*/

SELECT
	c.customer_id,
	c.company_name,
	ROUND(SUM(od.unit_price * od.quantity * (1 - od.discount))::NUMERIC, 2) AS total_spent
FROM
	customers c
JOIN orders o ON
	c.customer_id = o.customer_id
JOIN order_details od ON
	o.order_id = od.order_id
GROUP BY
	c.customer_id,
	c.company_name
ORDER BY
	total_spent DESC
LIMIT 5;