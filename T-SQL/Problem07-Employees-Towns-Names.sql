CREATE FUNCTION fn_ContainsAllCharactersFromString(@letters nvarchar(MAX), @inputString nvarchar(MAX)) 
RETURNS bit
AS
BEGIN
	DECLARE @index int,
			@length int
	SET @index = 1
	SET @length = LEN(@inputString)

	WHILE @index <= @length
	BEGIN
		IF(CHARINDEX(SUBSTRING(@inputString, @index, 1), @letters) = 0)
			RETURN 0
		ELSE
			SET @index = @index + 1
	END
	RETURN 1
END 
GO

CREATE FUNCTION fn_EmployeesTownsByGivenSetOfLetters(@letters nvarchar(MAX)) 
RETURNS TABLE 
AS
	RETURN (
		SELECT FirstName AS Name
		FROM Employees
		WHERE 
			dbo.fn_ContainsAllCharactersFromString(@letters, FirstName) = 1
		UNION ALL
		SELECT MiddleName AS Name
		FROM Employees
		WHERE 
			MiddleName IS NOT NULL AND
			dbo.fn_ContainsAllCharactersFromString(@letters, MiddleName) = 1
		UNION ALL
		SELECT LastName AS Name
		FROM Employees
		WHERE 
			dbo.fn_ContainsAllCharactersFromString(@letters, LastName) = 1
		UNION ALL
		SELECT Name 
		FROM Towns
		WHERE
			dbo.fn_ContainsAllCharactersFromString(@letters, Name) = 1
	)
GO

SELECT * FROM fn_EmployeesTownsByGivenSetOfLetters('mdonred')
