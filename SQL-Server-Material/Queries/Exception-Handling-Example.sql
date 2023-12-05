

EXCEPTION Handling:

	TRY..CATCH Block
	RAISEERROR Statement
	THROW Statement 

/* *********************************************** */

TRY..CATCH Block:

	- Allows you to handle run-time errors or exceptions in SQL Server.
	- In TRY block we write the piece of code in which chances of getting exceptions are high
	- Whereas CATCH block handle those exceptions.

-- Syntax:
	
	BEGIN TRY
		-- statements that may cause exceptions
	END TRY
	BEGIN CATCH 
		-- Statement that handles the exception
	END CATCH

-- Procedure that raises the exception:
	
	CREATE PROCEDURE usp_Division
	@num1 DECIMAL,
	@num2 DECIMAL,
	@num3 DECIMAL OUTPUT
	AS
	BEGIN
		SET @num3 = @num1 / @num2;
	END;

	DECLARE @result DECIMAL
	EXEC usp_Division 100, 0, @result OUTPUT
	PRINT @result

-- Procedure that handles the exception:

	ALTER PROCEDURE usp_Division
	@num1 DECIMAL,
	@num2 DECIMAL,
	@num3 DECIMAL OUTPUT
	AS
	BEGIN
		BEGIN TRY
			SET @num3 = @num1 / @num2;
		END TRY
		BEGIN CATCH
			SELECT 
				ERROR_NUMBER() AS ErrorNumber,
				ERROR_SEVERITY() AS ErrorServerity,
				ERROR_STATE() AS ErrorState,
				ERROR_PROCEDURE() AS ErrorProcedure,
				ERROR_LINE() AS ErrorLine,
				ERROR_MESSAGE() AS ErrorMessage
		END CATCH
	END;

	DECLARE @result DECIMAL
	EXEC usp_Division 100, 0, @result OUTPUT
	PRINT @result
	
-- RAISERROR

	DECLARE
		@ErrorMessage VARCHAR(MAX),
		@ErrorSeverity INT,
		@ErrorState INT
	BEGIN TRY
		--....
		RAISERROR('Error Occurred.', 17, 1)
	END TRY
	BEGIN CATCH
		SELECT @ErrorMessage = ERROR_MESSAGE(),
		@ErrorSeverity = ERROR_SEVERITY(),
		@ErrorState = ERROR_STATE();
		RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
	
-- Throw Statement: Throw or re-throw the exception manually
	
	CREATE TABLE dummy (
	ID INT PRIMARY KEY,
	Msg VARCHAR(200))

	BEGIN TRY
		INSERT INTO dummy VALUES(3, 'Hello World');
		INSERT INTO dummy VALUES(3, 'Hello Everyone');
	END TRY
	BEGIN CATCH
		PRINT('Raise the Caught Error Again');
		THROW;
	END CATCH

	SELECT * FROM dummy;