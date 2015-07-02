CREATE TRIGGER tr_LogAccountBalanceChanges ON Accounts FOR UPDATE
AS
	INSERT INTO Logs(AccountId, OldSum, NewSum)
		SELECT i.AccountId, d.Balance, i.Balance
		FROM INSERTED i
		JOIN DELETED d ON i.AccountId = d.AccountId
GO