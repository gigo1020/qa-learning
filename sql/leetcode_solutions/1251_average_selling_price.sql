-- LeetCode 1251. Average Selling Price
-- https://leetcode.com/problems/average-selling-price/description/
-- Practicing division by zero. JOIN query with multiple conditions

SELECT 
    p.product_id,
    IFNULL(
            ROUND(
            IFNULL(SUM(p.price * u.units), 0) / 
            NULLIF(SUM(u.units), 0), 
            2
        ),
    0)
    AS average_price
FROM Prices p
LEFT JOIN UnitsSold u
    ON p.product_id = u.product_id 
    AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id;