BEGIN TRANSACTION DeleteSalesDepartmentEmployees
	DROP TABLE EmployeesProjects
	COMMIT TRANSACTION DeleteSalesDepartmentEmployees
GO

-- You can restore the deleted table from backup, or create trigger to log deleted records 