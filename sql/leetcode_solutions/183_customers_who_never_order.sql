-- 183. Customers Who Never Order
-- https://leetcode.com/problems/customers-who-never-order/description/

SELECT c.name AS Customers
FROM customers c
LEFT JOIN orders o ON c.id = o.customerId
WHERE o.id IS NULL;