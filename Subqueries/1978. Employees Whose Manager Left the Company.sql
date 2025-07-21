-- link to problem: https://leetcode.com/problems/employees-whose-manager-left-the-company/description/?envType=study-plan-v2&envId=top-sql-50

SELECT employee_id FROM Employees e 
WHERE manager_id NOT IN (
    SELECT employee_id FROM Employees
) AND salary < 30000
ORDER BY e.employee_id ASC;
