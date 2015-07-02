CREATE PROC usp_WithdrawMoney(@accountId int, @sum money)
AS
	BEGIN TRANSACTION Withdraw
	DECLARE @currentAmount money
	SELECT @currentAmount = Balance 
		FROM Accounts 
		WHERE AccountId = @accountId

	IF (@currentAmount - @sum) < 0
		BEGIN
			ROLLBACK TRANSACTION Withdraw
		END
	ELSE
		BEGIN
			UPDATE Accounts
			SET Balance = @currentAmount - @sum
			WHERE AccountId = @accountId
			COMMIT TRANSACTION Withdraw
		END
GO

CREATE PROC usp_DepositMoney(@accountId int, @sum money)
AS
	BEGIN TRANSACTION Deposit
	DECLARE @currentAmount money
	SELECT @currentAmount = Balance 
		FROM Accounts 
		WHERE AccountId = @accountId

	IF @sum < 0
		BEGIN
			ROLLBACK TRANSACTION Deposit
		END
	ELSE
		BEGIN
			UPDATE Accounts
			SET Balance = @currentAmount + @sum
			WHERE AccountId = @accountId
			COMMIT TRANSACTION Deposit
		END
GO

--EXEC usp_WithdrawMoney @accountId = 3, @sum = 6
--EXEC usp_DepositMoney @accountId = 3, @sum = 20