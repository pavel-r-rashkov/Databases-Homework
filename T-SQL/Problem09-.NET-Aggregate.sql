--Turning on CLR functionality
--By default, CLR is disabled in SQL Server so to turn it on
--we need to run this command against our database
EXEC sp_configure 'clr enabled', 1
GO
RECONFIGURE
GO

-- Creating the SQL assembly and linking it to the C# library DLL we created
CREATE ASSEMBLY SQLAggregateFunctions
AUTHORIZATION dbo
-- ~~~~~~~~~~~~~~~~~~~~ Change the path to the location of the dll ~~~~~~~~~~~~~~~~~~~~~~~
FROM 'C:\Users\ASUS\Desktop\T-SQL\StrConcatAggregate.dll'
WITH PERMISSION_SET = SAFE
GO
 
CREATE AGGREGATE dbo.StrConcat (@value nvarchar(MAX)) RETURNS nvarchar(MAX)
EXTERNAL NAME SQLAggregateFunctions.[StrConcatAggregate.StrConcat]

-- Test the function
SELECT dbo.StrConcat(Name)
FROM Towns