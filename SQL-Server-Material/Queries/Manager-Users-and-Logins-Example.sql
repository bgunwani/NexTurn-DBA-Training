
Manage Users and Logins

	-- Data Control Languages helps in working with GRANT and REVOKE statements.
	
-- Create a login for SQL Server,

	CREATE LOGIN king
	WITH Password='king@123456';
	
-- To view all the logins of an SQL Server Instance,

	
	CREATE LOGIN king
	WITH Password='king@123456';

-- 

	CREATE DATABASE [HumanResourceDB];

	USE [HumanResourceDB]

	CREATE TABLE [Users]
	(Id INT PRIMARY KEY IDENTITY,
	FirstName VARCHAR(200),
	LastName VARCHAR(200))

	INSERT INTO [Users](FirstName, LastName)
	VALUES('King', 'Kochhar'), ('Sarah', 'Bowling'), ('John', 'Smith')

	CREATE USER king
	FOR LOGIN king;
	
	GRANT SELECT, INSERT, UPDATE, DELETE
	ON Users TO king;
	
	REVOKE INSERT, UPDATE, DELETE
	ON Users FROM king;

--

	SELECT sp.name AS Login,
	sp.type_desc AS LoginType,
	sp.is_disabled
	FROM sys.server_principals sp 
	LEFT OUTER JOIN sys.sql_logins sl
	ON sp.principal_id = sl.principal_id;
	
--

	USE [HumanResourceDB];

	SELECT * FROM [Users];