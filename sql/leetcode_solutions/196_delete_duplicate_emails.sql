-- 196. Delete Duplicate Emails
-- https://leetcode.com/problems/delete-duplicate-emails/description/

WITH duplicates AS (
    SELECT id
    FROM person
    WHERE id IN (SELECT MIN(id) FROM person GROUP BY email)
)

DELETE FROM person
WHERE id NOT IN (SELECT id FROM duplicates)