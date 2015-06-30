SELECT e.FirstName + e.LastName FullName, e.Salary, d.Name
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE e.Salary = 
	(SELECT MIN(Salary) FROM Employees
	WHERE DepartmentID = e.DepartmentID)
 