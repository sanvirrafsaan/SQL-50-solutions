#link to problem- https://leetcode.com/problems/queries-quality-and-percentage/description/?envType=study-plan-v2&envId=top-sql-50
SELECT query_name, 
ROUND(AVG(rating / position), 2) AS quality, 
ROUND((SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 100/ COUNT(*)), 2) AS poor_query_percentage
FROM Queries
GROUP BY query_name 
