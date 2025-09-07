--link to problem- https://leetcode.com/problems/movie-rating/description/?envType=study-plan-v2&envId=top-sql-50
-- Write your MySQL query statement below

SELECT results FROM 
(SELECT u.name AS results
FROM MovieRating m
LEFT JOIN Users u 
ON m.user_id = u.user_id -- joining names 
GROUP BY m.user_id
ORDER BY COUNT(*) DESC, u.name ASC
LIMIT 1) t1

UNION ALL

SELECT results FROM
(SELECT m2.title AS results
FROM MovieRating m1
LEFT JOIN Movies m2
ON m1.movie_id = m2.movie_id
WHERE created_at BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY m1.movie_id
ORDER BY AVG(rating) DESC, m2.title ASC
LIMIT 1) t2
