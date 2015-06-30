CREATE VIEW V_TodayLogedInUsers
AS
SELECT Username, FullName, LastLogin FROM Users
WHERE LastLogin = CONVERT(date, GETDATE())