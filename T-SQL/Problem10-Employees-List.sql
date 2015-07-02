DECLARE employeeCursor CURSOR READ_ONLY FOR 
	SELECT t.Name, e.FirstName, e.LastName
	FROM Employees e
	JOIN Addresses a ON a.AddressID = e.AddressID
	JOIN Towns t ON t.TownID = a.TownID
	GROUP BY t.Name, e.FirstName, e.LastName

OPEN employeeCursor
DECLARE @town nvarchar(MAX), @firstName nvarchar(MAX), @lastName nvarchar(MAX), 
	@lastTown nvarchar(MAX), @result nvarchar(MAX)
FETCH NEXT FROM employeeCursor INTO @town, @firstName, @lastName
SET @lastTown = NULL
SET @result = ''

WHILE @@FETCH_STATUS = 0
	BEGIN
		IF @town = @lastTown
			SET @result = @result + ', ' + @firstName + ' ' + @lastName
		ELSE
			SET @result = @result + CHAR(13) + @town + ' -> ' + @firstName + ' ' + @lastName
				
		SET @lastTown = @town
		FETCH NEXT FROM employeeCursor INTO @town, @firstName, @lastName	
	END
	PRINT @result

CLOSE employeeCursor
DEALLOCATE employeeCursor