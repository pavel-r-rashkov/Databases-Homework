SELECT e.FirstName, e.LastName, m.FirstName + ' ' + m.LastName AS [Manager name] 
FROM Employees e
LEFT OUTER JOIN Employees m 
ON e.ManagerID = m.EmployeeID

--SELECT e.FirstName, e.LastName, m.FirstName + ' ' + m.LastName AS [Manager name] 
--FROM Employees m
--RIGHT OUTER JOIN Employees e 
--ON e.ManagerID = m.EmployeeID