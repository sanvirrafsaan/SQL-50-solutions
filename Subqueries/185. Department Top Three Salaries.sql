--Write your MySQL query statement below
WITH ranked_table AS (SELECT *, 
DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS rank_num
FROM Employee e)


SELECT d.name AS Department, r.name AS Employee, r.salary AS Salary
FROM ranked_table r
LEFT JOIN Department d 
ON r.departmentID = d.id
WHERE r.rank_num <=3
