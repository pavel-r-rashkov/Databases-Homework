CREATE PROC usp_PersonsWithMoreMoneyThanNumber(@money money = 0)
AS
	SELECT p.PersonId, p.FirstName, p.LastName, SUM(a.Balance) 
	FROM Persons p
	JOIN Accounts a ON a.PersonId = p.PersonId
	GROUP BY p.PersonId, p.FirstName, p.LastName
	HAVING SUM(a.Balance) >= @money
GO

EXEC usp_PersonsWithMoreMoneyThanNumber 21