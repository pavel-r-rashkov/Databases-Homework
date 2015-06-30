SELECT m.FirstName, m.LastName, COUNT(e.EmployeeID) 'Employees count' 
FROM Employees e
JOIN Employees m ON e.ManagerID = m.EmployeeID
GROUP BY m.EmployeeID, m.FirstName, m.LastName
HAVING COUNT(e.EmployeeID) = 5
