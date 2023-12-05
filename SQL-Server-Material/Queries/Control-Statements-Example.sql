
Control-Of-Flow Statements:

	BEGIN..END
	IF..ELSE
	WHILE
	BREAK
	CONTINUE
	
/* *********************************************** */

BEGIN..END Statement:

	- To define a statement of block.
	- It consists a set of SQL Statements that execute together.
	

Use AdventureWorks2022

SELECT * FROM Production.Product;

-- BEGIN..END Statement

BEGIN
	SELECT ProductID, [Name]
	FROM Production.Product
	WHERE ListPrice > 10000;
	IF @@ROWCOUNT = 0
	PRINT 'No product with price greater than 10000 found.'
END;

-- Nested BEGIN..END Statement

BEGIN
	DECLARE @name VARCHAR(200);
	SELECT TOP 1 @name = [Name]
	FROM Production.Product
	ORDER BY ListPrice DESC;
	IF @@ROWCOUNT <> 0
	BEGIN
		PRINT '**Important Message**'
		PRINT 'The most expensive product is ' + @name;
	END
	ELSE
	BEGIN
		PRINT '**Important Message**'
		PRINT 'No Product Found.'
	END
END;

/* *********************************************** */

IF..ELSE Statement

	- Allows us to execute or skip a statement based on a specific condition.
	- Yo can write condition with:
		- Simple IF Statement
		- IF..ELSE Statement
		- Nested IF..Else Statement
		
	SELECT * FROM Sales.SalesOrderDetail;
	SELECT * FROM Sales.SalesOrderHeader;

-- Simple IF Statement;

	BEGIN
		DECLARE @sales FLOAT;
		SELECT @sales = SUM(I.UnitPrice*I.OrderQty)
		FROM Sales.SalesOrderDetail I JOIN Sales.SalesOrderHeader O
		ON O.SalesOrderID = I.SalesOrderID
		WHERE YEAR(O.OrderDate) = 2014;
		SELECT @sales;
		IF @sales > 1000000
		BEGIN
			PRINT 'Awesome!! You have done a great job!!';
		END
	END

-- IF.. ELSE Statement

BEGIN
	DECLARE @sales FLOAT;
	SELECT @sales = SUM(I.UnitPrice*I.OrderQty)
	FROM Sales.SalesOrderDetail I JOIN Sales.SalesOrderHeader O
	ON O.SalesOrderID = I.SalesOrderID
	WHERE YEAR(O.OrderDate) = 2014;
	SELECT @sales;
	IF @sales > 100000000
	BEGIN
		PRINT 'Awesome!! You have done a great job!!';
	END
	ELSE
	BEGIN
		PRINT 'Sorry!! You didnt reach the expected target.'
	END;
END

/* *********************************************** */

WHILE Statement:

	- Allows you to execute a block of statement repeatedly as long as a specific condition is true.
	
-- WHILE Statement

	-- Initialization of Counter Variable
	DECLARE @counter INT = 1;	
	-- Condition
	WHILE @counter <= 5
	BEGIN
		PRINT @counter;
		SET @counter = @counter + 1
	END;
	
-- WHILE Statement

	SELECT * FROM HumanResources.Employee;

	DECLARE @counter INT = 1, 
			@MaxEmps INT = 3,
			@JobTitle VARCHAR(MAX)
	WHILE(@counter <= @MaxEmps)
	BEGIN
		SELECT @JobTitle = [JobTitle]
		FROM HumanResources.Employee
		WHERE BusinessEntityID = @counter;
		PRINT @JobTitle;
		SET @counter = @counter + 1;
	END;

/* *********************************************** */

BREAK Statement: 

	- To exit the current iteration of a loop and execution of a condition.
	
-- BREAK Statement

	DECLARE @counter INT = 1;	
	WHILE @counter <= 5
	BEGIN
		IF @counter = 4
			BREAK;
		PRINT @counter;
		SET @counter = @counter + 1
	END;

/* *********************************************** */

CONTINUE Statement:

	- This stops the current iteration of the loop and starts the new one.

-- CONTINUE Statement

	DECLARE @counter INT = 0;	
	WHILE @counter < 5
	BEGIN
		SET @counter = @counter + 1
		IF @counter = 4
			CONTINUE;
		PRINT @counter;
	END;
	
/* *********************************************** */
