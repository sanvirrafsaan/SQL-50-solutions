-- link to problem: https://leetcode.com/problems/not-boring-movies/submissions/1727207192/?envType=study-plan-v2&envId=top-sql-50
# Write your MySQL query statement below
SELECT * FROM Cinema 
WHERE id % 2 != 0 AND description != 'boring'
ORDER BY rating DESC;
