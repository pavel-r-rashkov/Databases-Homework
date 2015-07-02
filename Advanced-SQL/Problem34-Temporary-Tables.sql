BEGIN TRANSACTION DeleteEmployeesProjects

-- Create the temporary table
SELECT * INTO #EmployeesProjectsBackup FROM EmployeesProjects WHERE 0 = 1;

-- Redirect the deleted rows to the temp table using OUTPUT
DELETE EmployeesProjects OUTPUT DELETED.* INTO #EmployeesProjectsBackup

-- Recreate the table
DROP TABLE EmployeesProjects

CREATE TABLE EmployeesProjects(
	EmployeeId int NOT NULL,
	ProjectId int NOT NULL,
	CONSTRAINT PK_EmployeesProjects PRIMARY KEY(EmployeeId, ProjectId),
	CONSTRAINT FK_EmployeesProjects_Employees
		FOREIGN KEY (EmployeeId) REFERENCES Employees(EmployeeId)
		ON DELETE CASCADE,
	CONSTRAINT FK_EmployeesProjects_Projects
		FOREIGN KEY (ProjectId) REFERENCES Projects(ProjectId)
		ON DELETE CASCADE)

-- Restore the records
INSERT INTO EmployeesProjects
SELECT EmployeeId, ProjectId FROM #EmployeesProjectsBackup
	
ROLLBACK TRANSACTION DeleteEmployeesProjects
GO