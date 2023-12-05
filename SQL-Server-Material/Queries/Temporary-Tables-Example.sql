
-- Temporary Tables

	Temporary Tables exists Temporarily on the SQL Server.
	They are useful for storing the immediate result sets of SELECT statements.
	There are two types of Temporary Tables:
		- Local Temp Table (Table will be accessible within the same connection)
		- Global Temp Table (Table will be accessible throught all the connections)
	

/* ******************************************************* */	

	SELECT ProductNumber, [Name], ListPrice
	FROM Production.Product
	WHERE ProductID = 316;

-- Creating Temporary Table using SELECT INTO Statement.

	SELECT ProductNumber, [Name], ListPrice
	INTO #ProductInfo
	FROM Production.Product
	WHERE ProductID = 316;

-- Creating Temporary Table using CREATE TABLE Statement.

	CREATE TABLE #WasherProducts
	(Product_Name VARCHAR(MAX),
	List_Price DECIMAL(10,2));

	INSERT INTO #WasherProducts(Product_Name, List_Price)
	SELECT [Name], ListPrice
	FROM Production.Product
	WHERE [Name] LIKE '%Washer%';

-- Query from Temporary Table

	SELECT * FROM #ProductInfo;
	SELECT * FROM #WasherProducts;
	
-- If you open another connection and try the above temp tables, you might get the error:

	SELECT * FROM #ProductInfo;
	-- Invalid object name '#ProductInfo'.
	

-- Creating Global Temporary Table using CREATE TABLE Statement.

	CREATE TABLE ##NutProducts
	(Product_Name VARCHAR(MAX),
	List_Price DECIMAL(10,2));

	INSERT INTO ##NutProducts(Product_Name, List_Price)
	SELECT [Name], ListPrice
	FROM Production.Product
	WHERE [Name] LIKE '%NUT%';

	SELECT * FROM ##NutProducts;

-- Dropping Temporary Tables

	Automatic Table Drop
	
	 SQL Server drops a temp table Automatically when we close the connection.
	 SQL Server drops a global temp table once then connection that created is closed and all the queries againast this table gets completed.
	
	Manual Table Deletion
	
		DROP TABLE ##table_name;

	