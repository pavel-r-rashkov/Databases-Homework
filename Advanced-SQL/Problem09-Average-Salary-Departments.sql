SELECT d.Name, AVG(Salary) 'Average Salary' 
FROM Employees e
JOIN Departments d ON d.DepartmentID = e.DepartmentID
GROUP BY e.DepartmentID, d.Name

