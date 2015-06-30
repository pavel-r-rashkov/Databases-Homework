CREATE TABLE Users (
	UserId int IDENTITY,
	Username nvarchar(50) NOT NULL,
	Password nvarchar(50),
	FullName nvarchar(50),
	LastLogin datetime,
	CONSTRAINT PK_Users PRIMARY KEY(UserId),
	CONSTRAINT UK_Users_Username UNIQUE(Username),
	CHECK (LEN(Password) >= 5))