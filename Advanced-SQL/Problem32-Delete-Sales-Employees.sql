BEGIN TRANSACTION DeleteSalesDepartmentEmployees
	DELETE e FROM Employees e
		JOIN Departments d ON e.DepartmentId = d.DepartmentId
		WHERE d.Name = 'Sales'
	
	ROLLBACK TRANSACTION DeleteSalesDepartmentEmployees
GO