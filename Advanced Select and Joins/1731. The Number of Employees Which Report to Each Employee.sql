-- link to problem: https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/?envType=study-plan-v2&envId=top-sql-50

SELECT e.employee_id, e.name, m.reports_count, m.average_age
FROM Employees e
INNER JOIN (SELECT COUNT(employee_id) AS reports_count,  ROUND(AVG(age), 0) AS average_age, reports_to AS manager_id
FROM Employees
WHERE reports_to IS NOT NULL
GROUP BY reports_to) m
ON e.employee_id = m.manager_id
ORDER BY e.employee_id ASC;
