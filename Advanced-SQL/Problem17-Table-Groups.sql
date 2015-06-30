CREATE TABLE Groups(
	GroupId int IDENTITY,
	Name nvarchar(50) NOT NULL,
	CONSTRAINT PK_Groups_GroupId PRIMARY KEY(GroupId),
	CONSTRAINT UK_Groups_Name UNIQUE(Name))