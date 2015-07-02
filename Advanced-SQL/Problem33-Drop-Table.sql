BEGIN TRANSACTION DeleteSalesDepartmentEmployees
	DROP TABLE EmployeesProjects
	-- You can restore the table by rolling back the transaction
	ROLLBACK TRANSACTION DeleteSalesDepartmentEmployees
GO

-- If the transaction is commited, you can restore the deleted table from backup,
-- or create trigger to log deleted records,
-- or use the transaction log