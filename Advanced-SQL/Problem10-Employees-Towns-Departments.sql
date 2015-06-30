SELECT t.Name, d.Name, COUNT(*) FROM Employees e
JOIN Addresses a ON a.AddressID = e.AddressID
JOIN Towns t ON t.TownID = a.TownID
JOIN Departments d ON d.DepartmentID = e.DepartmentID
GROUP BY t.Name, d.Name