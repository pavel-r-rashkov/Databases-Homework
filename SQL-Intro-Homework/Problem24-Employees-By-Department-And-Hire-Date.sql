SELECT e.FirstName, e.LastName, d.Name, e.HireDate
FROM Employees e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE d.Name IN ('Sales', 'Finance') AND 
e.HireDate BETWEEN '1-1-1995' AND '12-31-2005'