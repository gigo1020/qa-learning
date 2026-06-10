-- LeetCode 181. Employees Earning More Than Their Managers
-- https://leetcode.com/problems/employees-earning-more-than-their-managers/description/
-- Self-join is used to compare the salary of an employee and his manager

SELECT e1.name AS Employee
FROM Employee e1
JOIN employee e2 ON e1.managerid = e2.id
WHERE e1.salary > e2.salary