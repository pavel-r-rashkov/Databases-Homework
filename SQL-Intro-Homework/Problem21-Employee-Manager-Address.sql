SELECT e.FirstName, e.LastName, m.FirstName + ' ' + m.LastName AS [Manager name], a.AddressText
FROM Employees e
JOIN Employees m 
ON e.ManagerID = m.EmployeeID
JOIN Addresses a 
ON e.AddressID = a.AddressID