SELECT d.DepartmentID, d.Name, d.ManagerID, e.FirstName + ' ' + e.LastName AS [Manager name] 
FROM Departments d
JOIN Employees e 
ON e.EmployeeID = d.ManagerID