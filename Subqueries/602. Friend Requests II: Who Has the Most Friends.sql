-- Write your MySQL query statement below
-- Case 1: I sent request, request was accepted. +1 friend
-- Case 2: Someone sent me a request, I accepted, +1 friend

WITH group_cte AS (SELECT requester_id AS id, COUNT(*) AS num
FROM RequestAccepted
GROUP BY requester_id

UNION ALL 

SELECT accepter_id AS id, COUNT(*) AS num
FROM RequestAccepted
GROUP BY accepter_id), 

main_cte AS (
SELECT id, SUM(num) AS num
FROM group_cte
GROUP BY id)

SELECT * FROM main_cte
WHERE num = (SELECT MAX(num) FROM main_cte)
