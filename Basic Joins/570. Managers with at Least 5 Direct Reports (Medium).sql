SELECT e.name 
FROM Employee e
INNER JOIN (SELECT managerId, COUNT(*)
FROM Employee e 
GROUP BY managerId
HAVING COUNT(*) >= 5) m
-- the query above has filtered for the manager's id we need. Now find in employee table 
ON e.id = m.managerID;
