-- Pairs are printed in format {town}: {first employee names} {second employee names}

DECLARE employeePairs CURSOR READ_ONLY FOR
	SELECT t.Name, e.FirstName + ' ' + e.LastName, s.FirstName + ' ' + s.LastName 
	FROM Employees e
	JOIN Addresses a ON a.AddressID = e.AddressID
	JOIN Towns t ON a.TownID = t.TownID
	CROSS JOIN Employees s
	WHERE (SELECT j.TownID FROM Employees q
		JOIN Addresses l ON l.AddressID = q.AddressID
		JOIN Towns j ON l.TownID = j.TownID 
		WHERE q.EmployeeID = e.EmployeeID) 
		= 
		(SELECT b.TownID FROM Employees v
		JOIN Addresses x ON x.AddressID = v.AddressID
		JOIN Towns b ON x.TownID = b.TownID 
		WHERE v.EmployeeID = s.EmployeeID)

OPEN employeePairs
DECLARE @town nvarchar(100), @firstEmployee nvarchar(100), @secondEmployee nvarchar(100)
FETCH NEXT FROM employeePairs INTO @town, @firstEmployee, @secondEmployee

WHILE @@FETCH_STATUS = 0
	BEGIN
		PRINT @town + ': ' + @firstEmployee + ' ' + @secondEmployee
		FETCH NEXT FROM employeePairs INTO @town, @firstEmployee, @secondEmployee
	END

CLOSE employeePairs
DEALLOCATE employeePairs
