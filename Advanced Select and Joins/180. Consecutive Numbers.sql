-- link to problem- https://leetcode.com/problems/consecutive-numbers/description/?envType=study-plan-v2&envId=top-sql-50

--Write your MySQL query statement below
WITH num_three as (
    SELECT *, 
        LEAD(num, 1) OVER (ORDER BY id) AS second_num, 
        LEAD(num, 2) OVER (ORDER BY id) AS third_num
    FROM Logs
)

SELECT DISTINCT(num) AS ConsecutiveNums 
FROM num_three
WHERE num = second_num AND second_num = third_num 
