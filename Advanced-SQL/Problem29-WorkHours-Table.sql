CREATE TABLE WorkHours(
	Id int IDENTITY,
	Date date,
	Task nvarchar(50),
	Hours int,
	Comments nvarchar(200),
	EmployeeId int,
	CONSTRAINT PK_WorkHours_Id PRIMARY KEY(Id),
	CONSTRAINT FK_WorkHours_Employees
		FOREIGN KEY (EmployeeId) REFERENCES Employees(EmployeeId)
		ON DELETE SET NULL)