SELECT t.Name, COUNT(DISTINCT m.EmployeeId) FROM Employees e 
JOIN Employees m ON e.ManagerId = m.EmployeeId
JOIN Addresses a ON e.AddressID = a.AddressID
JOIN Towns t ON a.TownID = t.TownID
GROUP BY t.Name

