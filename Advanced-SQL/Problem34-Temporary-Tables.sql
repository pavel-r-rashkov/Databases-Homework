-- Create the temporary table
SELECT * INTO #EmployeesProjectsBackup FROM EmployeesProjects WHERE 0 = 1;

-- Redirect the deleted rows to the temp table using OUTPUT
DELETE EmployeesProjects OUTPUT DELETED.* INTO #EmployeesProjectsBackup

-- Restore the records
INSERT INTO EmployeesProjects
SELECT EmployeeId, ProjectId FROM #EmployeesProjectsBackup

