
Transaction Management:

	- A transaction is a set of statements that be executed as one unit.
	- That means, this will ensure either all of the commands succeeds or none of them.
	
Syntax;

	BEGIN TRANSACTION
		-- Statements
	COMMIT/ROLLBACK TRANSACTION
	
	
	BEGIN TRANSACTION
		-- Statements
	IF error occurs
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION
	
	USE [HumanResourceDB];

	SELECT * FROM [Users];

-- 

	BEGIN TRANSACTION
		INSERT INTO Users VALUES('Sumit', 'Dhawan');
		UPDATE Users SET LastName = 'ABC' WHERE Id = 1;
		DELETE FROM Users WHERE Id = 5;
	COMMIT TRANSACTION
	
-- 
	
	BEGIN TRANSACTION
		INSERT INTO Users VALUES('Sumit', 'Dhawan');
		UPDATE Users SET LastName = 'ABC' WHERE Id = 1;
		DELETE FROM Users WHERE Id = 5;
	ROLLBACK TRANSACTION
	
	SELECT * FROM [Users];

--

	BEGIN TRANSACTION
		INSERT INTO Users VALUES(6, 'Sumit', 'Dhawan');
		INSERT INTO Users VALUES(6, 'Rohit', 'Dhawan');
	IF(@@ERROR > 0)
		ROLLBACK TRANSACTION
	ELSE
		COMMIT TRANSACTION
