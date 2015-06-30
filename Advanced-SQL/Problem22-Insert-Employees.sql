-- First remove the constraints from Problem 15
ALTER TABLE Users 
DROP CK__Users__Password__24927208,
	 UK_Users_Username

INSERT INTO Users (Username, Password, FullName, LastLogin)
SELECT LOWER(LEFT(FirstName, 1) + LastName), 
	   LOWER(LEFT(FirstName, 1) + LastName),
	   FirstName + ' ' + LastName,
	   NULL  
FROM Employees