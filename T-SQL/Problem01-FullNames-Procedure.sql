CREATE PROC usp_SelectPersonsFullNames
AS
	SELECT FirstName + ' ' + LastName AS FullName 
	FROM Persons
GO

EXEC usp_SelectPersonsFullNames
