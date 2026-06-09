-- LeetCode 175. Combine Two Tables
-- https://leetcode.com/problems/combine-two-tables/description/
-- Used JOIN to join two tables as a result of a query

SELECT firstname, lastname, city, state
FROM person AS p
LEFT JOIN address AS a ON p.personid = a.personid