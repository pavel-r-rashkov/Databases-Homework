SELECT AVG(Salary) AverageSalarySales FROM Employees
WHERE DepartmentID = 
	(SELECT DepartmentID 
	FROM Departments
	WHERE Name = 'Sales')