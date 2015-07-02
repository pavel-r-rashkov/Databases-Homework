CREATE FUNCTION ufn_CalculateInterest(@sum money, @interestRate float, @monthsCount int) RETURNS money
AS
BEGIN
	DECLARE @monthlyInterestRate float
	SET @monthlyInterestRate = (@interestRate / 100) / 12
		
	RETURN @sum * POWER(1 + @monthlyInterestRate, @monthsCount)
END
GO

DECLARE @money money
EXEC @money = ufn_CalculateInterest @sum = 1000, @interestRate = 12, @monthsCount = 12
PRINT @money