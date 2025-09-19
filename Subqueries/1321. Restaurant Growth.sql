-- Write your MySQL query statement below
WITH Customer_sum as (
    select visited_on, SUM(amount) AS amount
    FROM Customer 
    GROUP BY visited_on
),
main_cte AS (
SELECT visited_on, 
SUM(amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount,
ROUND(AVG(amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW), 2) AS average_amount, 
ROW_NUMBER() OVER (ORDER BY visited_on) AS row_num
FROM Customer_sum
)

SELECT visited_on, amount, average_amount 
FROM main_cte
WHERE row_num > 6;
