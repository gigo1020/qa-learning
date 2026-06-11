-- 511. Game Play Analysis I
-- https://leetcode.com/problems/game-play-analysis-i/description/

SELECT player_id, 
       MIN(event_date) AS first_login
FROM activity
GROUP BY player_id
ORDER BY first_login ASC