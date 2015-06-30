CREATE TABLE WorkHoursLogs(
	Id int IDENTITY,
	OldDate date,
	OldTask nvarchar(50),
	OldHours int,
	OldComments nvarchar(200),
	OldEmployeeId int,
	NewDate date,
	NewTask nvarchar(50),
	NewHours int,
	NewComments nvarchar(200),
	NewEmployeeId int,
	Command nvarchar(30),
	CONSTRAINT PK_WorkHoursLogs_Id PRIMARY KEY(Id))
GO

CREATE TRIGGER tr_LogWorkHoursInsert ON WorkHours FOR INSERT
AS
	INSERT INTO WorkHoursLogs(NewDate, NewTask, NewHours, NewComments, NewEmployeeId, Command)
		SELECT Date, Task, Hours, Comments, EmployeeId, 'INSERT' FROM INSERTED
GO

CREATE TRIGGER tr_LogWorkHoursDelete ON WorkHours FOR DELETE
AS
	INSERT INTO WorkHoursLogs(OldDate, OldTask, OldHours, OldComments, OldEmployeeId, Command)
		SELECT Date, Task, Hours, Comments, EmployeeId, 'DELETE' FROM DELETED
GO

CREATE TRIGGER tr_LogWorkHoursUpdate ON WorkHours FOR UPDATE
AS
	INSERT INTO WorkHoursLogs(OldDate, OldTask, OldHours, OldComments, OldEmployeeId,
							  NewDate, NewTask, NewHours, NewComments, NewEmployeeId, Command)
		SELECT d.Date, d.Task, d.Hours, d.Comments, d.EmployeeId,
			   i.Date, i.Task, i.Hours, i.Comments, i.EmployeeId,'UPDATE' 
		FROM INSERTED i
		JOIN DELETED d ON i.Id = d.Id
GO


