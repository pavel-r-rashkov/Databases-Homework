CREATE PROC usp_CalculateMonthlyAccountInterest(@accountId int, @yearlyInterest float, @newSum money OUTPUT)
AS
	DECLARE @currentAmount money
	SELECT @currentAmount = Balance 
		FROM Accounts 
		WHERE AccountId = @accountId

	EXEC @newSum = ufn_CalculateInterest @sum = @currentAmount, @interestRate = @yearlyInterest, @monthsCount = 1
	RETURN
GO

DECLARE @newBalance money
EXEC usp_CalculateMonthlyAccountInterest 1, 36, @newBalance OUTPUT
PRINT @newBalance