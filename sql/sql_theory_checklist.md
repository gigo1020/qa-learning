1. What's the difference between an INNER JOIN and a LEFT JOIN? Give an example where the results are different.
- An INNER JOIN returns only rows where the join condition matches in both tables.
A LEFT JOIN returns all rows from the left table, and for the right table, the values ​​if there is a match, otherwise NULL.
- Example: couriers (left) and orders (right) tables. If a courier has no orders, an INNER JOIN will not show that courier, but a LEFT JOIN will show them, and the order fields will be NULL.


2. When is HAVING used and when is WHERE used? 
- The WHERE clause is used to select results that meet the conditions before grouping, for each individual database record. Aggregate values ​​cannot be used here; only through a subquery.
- HAVING is applied after grouping. It applies to the entire group returned by the GROUP BY clause. Aliases assigned in the SELECT clause can be used, as it is executed after the SELECT clause

3. What is a subquery? Give an example with EXISTS and an example with IN.
- A subquery is a query that is contained within one part of another query

SELECT order_id, customer_name
FROM orders o
WHERE EXISTS (SELECT 1 FROM order_details od WHERE od.order_id = o.order_id AND od.unit_price > 100);

SELECT order_id, customer_name
FROM orders
WHERE customer_id IN (SELECT customer_id FROM orders WHERE price BETWEEN 100 AND 500)

4. Write the order of execution for an SQL query.
FROM (+JOIN) - WHERE - GROUP BY - HAVING - SELECT - ORDER BY - LIMIT - OFFSET

5. What are primary keys and foreign keys? Why are they needed in testing?
- A primary key is a unique row identifier and cannot be NULL. Each table has one primary key.
- A foreign key is a column referencing the primary key of another table, required for data integrity.
- In testing, they help build correct joins and verify referential integrity (for example, no orders without a customer).