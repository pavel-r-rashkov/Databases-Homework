UPDATE Users 
SET Password = NULL
WHERE LastLogin > '3/10/2010'