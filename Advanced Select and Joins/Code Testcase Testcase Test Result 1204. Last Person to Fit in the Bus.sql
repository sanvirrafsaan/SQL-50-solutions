-- link to problem- https://leetcode.com/problems/last-person-to-fit-in-the-bus/description/?envType=study-plan-v2&envId=top-sql-50

WITH running_sum AS (
SELECT *, 
SUM(weight) OVER (
    ORDER BY turn
)
FROM Queue)

SELECT person_name
FROM running_sum
WHERE sum <= 1000 
ORDER BY turn DESC 
LIMIT 1
