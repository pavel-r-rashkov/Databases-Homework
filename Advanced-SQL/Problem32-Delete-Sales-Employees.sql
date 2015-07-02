BEGIN TRANSACTION DeleteSalesDepartmentEmployees	
	ALTER TABLE Departments
	ALTER COLUMN ManagerId int NULL

	ALTER TABLE Departments
	DROP CONSTRAINT FK_Departments_Employees

	ALTER TABLE Departments	
	ADD CONSTRAINT FK_Departments_Employees
	FOREIGN KEY (ManagerId)
	REFERENCES Employees(EmployeeId)
	ON DELETE SET NULL

	DELETE e FROM Employees e
		JOIN Departments d ON e.DepartmentId = d.DepartmentId
		WHERE d.Name = 'Sales'
	
	ROLLBACK TRANSACTION DeleteSalesDepartmentEmployees
GO