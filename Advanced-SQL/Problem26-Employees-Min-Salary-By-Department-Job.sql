SELECT d.Name, e.JobTitle, MIN(e.Salary), e.FirstName FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
GROUP BY d.Name, e.JobTitle, e.FirstName