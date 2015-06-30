INSERT INTO WorkHours
VALUES('2/10/2011', 'task name', 5, 'comments...', '3')

UPDATE WorkHours
SET Task = 'updated task'
WHERE Task = 'task name'

DELETE WorkHours
WHERE EmployeeId = 3