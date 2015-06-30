SELECT e.FirstName, e.LastName, m.FirstName + ' ' + m.LastName AS [Manager name]
FROM Employees e
JOIN Employees m
ON e.ManagerID = m.EmployeeID