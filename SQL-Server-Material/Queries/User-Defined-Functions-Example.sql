
-- User Defined Functions

	- Functions help us to work with DRY(Dont Repeat Yourself) Principle.
	- We create functions to simplify our development by encapsulating complex business logic and make it available for reuse in other queries.
	- There are two types of User Defined Functions:
		- Scalar Function
		- Table-Valued Function and Multi Table-Valued Function
	
/* ************************************************************************* */
	
-- Scalar Function

	Scalar function takes one more parameters and returns a single value.
	
	
	USE [AdventureWorks2022]

	SELECT * FROM [Sales].[SalesOrderDetail];

-- Creating a Scalar Function

	CREATE FUNCTION [Sales].[CalculateNetSales](
	@quantity INT, 
	@unit_price DECIMAL(10,2),
	@discount DECIMAL(10,2))
	RETURNS DECIMAL(10,2)
	AS
	BEGIN
		RETURN @quantity * @unit_price * (1 - @discount);
	END;

-- Calling a Scalar Function

	SELECT [Sales].[CalculateNetSales](2, 100, 0.1);

	SELECT SalesOrderID, ProductID, OrderQty, UnitPrice, UnitPriceDiscount,
	[Sales].[CalculateNetSales](OrderQty, UnitPrice, UnitPriceDiscount) NetSales
	FROM [Sales].[SalesOrderDetail]
	WHERE ProductID = 710

	SELECT ProductID,
	SUM([Sales].[CalculateNetSales](OrderQty, UnitPrice, UnitPriceDiscount)) NetSales
	FROM [Sales].[SalesOrderDetail]
	WHERE ProductID IN (710, 711)
	GROUP BY ProductID
	
	-- Modify the Scalar Function

	ALTER FUNCTION [Sales].[CalculateNetSales](
	@quantity INT, 
	@unit_price DECIMAL(10,2),
	@discount DECIMAL(10,2))
	RETURNS DECIMAL(10,2)
	AS
	BEGIN
		RETURN @quantity * @unit_price * (1 - @discount);
	END;

-- Drop the Scalar Function

	DROP FUNCTION [Sales].[CalculateNetSales];
	
/* ************************************************************************* */

-- Inline Table-Valued Function:

	- A TVF returns data of a table type.
	- We return a table that looks like a regular table.
	
	USE [AdventureWorks2022]

	SELECT *
	FROM Production.Product
	WHERE Color = 'Black';

	CREATE FUNCTION udf_ProductByColor(@Color VARCHAR(50))
	RETURNS TABLE
	AS 
	RETURN SELECT ProductID, [Name], ProductNumber, Color
	FROM Production.Product
	WHERE Color = @Color;

-- Executing

	SELECT * FROM udf_ProductByColor('Black');
	
/* ************************************************************************* */

-- Multi-Statement Inline Table-Valued Function:

	 A MSTVF is a table-valued function that returns the result of multiple statements.
	 In this type, we need to define the table structure with RETURN type, not only TABLE.
	 
	 
	 
	USE [AdventureWorks2022]

	SELECT * FROM 
	[Sales].[Customer]

-- Inline Table-Valued Function

	CREATE FUNCTION ITVF_CustomerDetails()
	RETURNS TABLE
	AS
	RETURN SELECT CustomerID, AccountNumber, ModifiedDate
	FROM [Sales].[Customer];

	SELECT * FROM ITVF_CustomerDetails();

-- Multi-Statement Table-Valued Function

	CREATE FUNCTION MSTVF_CustomerDetails()
	RETURNS @CustInfo TABLE(
	CustomerID INT,
	AccountNumber VARCHAR(200),
	ModifiedDate DATETIME)
	AS
	BEGIN
		INSERT INTO @CustInfo
		SELECT CustomerID, AccountNumber, ModifiedDate
		FROM [Sales].[Customer];
		RETURN;
	END;

	SELECT * FROM MSTVF_CustomerDetails();

	 


	
	
	
	
	
	
	