SELECT FirstName, LastName, Salary 
FROM Employees
WHERE Salary < (SELECT 1.1 * MIN(Salary) FROM Employees)