-- 182. Duplicate Emails
-- https://leetcode.com/problems/duplicate-emails/description/

SELECT email
FROM person p1
GROUP BY email
HAVING COUNT(*) > 1;