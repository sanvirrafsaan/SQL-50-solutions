-- Write your MySQL query statement below
WITH units_table AS (SELECT product_id, SUM(unit) AS unit FROM Orders 
WHERE order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY product_id) 

SELECT product_name, u.unit
FROM Products p
LEFT JOIN units_table u
ON p.product_id = u.product_id
WHERE u.unit >= 100
