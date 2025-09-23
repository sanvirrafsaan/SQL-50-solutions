-- Write your PostgreSQL query statement below
DELETE FROM Person
WHERE id NOT IN (
    SELECT min(id) AS id FROM Person 
    GROUP BY email
)
