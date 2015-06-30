SELECT e.FirstName + ' ' + e.LastName Name, ISNULL(m.FirstName + m.LastName, '(no manager)') Manager 
FROM Employees e
LEFT OUTER JOIN Employees m 
ON e.ManagerID = m.EmployeeID