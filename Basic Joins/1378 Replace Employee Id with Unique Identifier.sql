SELECT Employees.name, EmployeeUNI.unique_id 
FROM Employees
LEFT JOIN EmployeeUNI
On Employees.id = EmployeeUNI.id;
