--link to problem - https://leetcode.com/problems/exchange-seats/description/?envType=study-plan-v2&envId=top-sql-50

SELECT CASE 
    WHEN mod(id, 2) = 0 THEN id-1
    WHEN id = (SELECT MAX(id) FROM Seat) AND mod(id, 2) = 1 THEN id
    ELSE id+1 END AS id, student
FROM Seat
ORDER BY id
