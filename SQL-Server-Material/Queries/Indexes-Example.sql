
Indexes in SQL Server

	- The main objective of using Indexes is to make the search operation faster.
	- Indexes using B-Tree Structure (Balanced Tree Structure) internally.
	- When we create Primary Key on any column in the table, automatically Index is generated for the same.
	
/* ******************************************************** */
	
Hoe will the database engine retrieves the data from a table in SQL Server?

	- It will retrieve data with two different techniques:
		
	1. Table Scan
		
	In Table Scan, the SQL Server engine will search for the information sequentially i.e. One by One from the start to the last record of the table.
	
	2. Index Scan/Seek Scan
	
	In Index Scan, the SQL Server engine uses a B-Tree structure to search the required data. Thus, it helps in improving the performance of your search query as it reduces the number of scans.

/* ******************************************************** */	
	
	USE [HumanResourceDB]

	CREATE TABLE Employee
	(EmpId INT,
	EmpName VARCHAR(50),
	EmpSalary FLOAT,
	City VARCHAR(50))

	INSERT INTO Employee VALUES(5, 'King', 12000, 'New York');
	INSERT INTO Employee VALUES(1, 'Kochhar', 32000, 'Toronto');
	INSERT INTO Employee VALUES(3, 'Smith', 22000, 'Tokiyo');
	INSERT INTO Employee VALUES(4, 'Sarah', 40000, 'Delhi');
	INSERT INTO Employee VALUES(2, 'John', 14000, 'London');

	SELECT * FROM Employee
	WHERE EmpId = 4;

	CREATE CLUSTERED INDEX IX_Employee_EmpId 
	ON Employee(EmpId ASC)

	DROP TABLE Employee;
	
/* ******************************************************** */

More About Indexes in SQL Server:

	- Index is an database object.
	- It helps in improving the performance of search operation.
	- When we create an index on any column of a table, then SQL Server internally maintains the index table.
	- In a table, we can use a maximum of 1000 indexes.
	(1 Clustered Index and 999 Non-Clustered Index)
	
When does SQL Server uses indexes?

	- When your SQL statement contains WHERE clause and 
	- In the Where Clause we use Indexed column.
	- If the SELECT statement contains an ORDER BY clause.
	
Can we create multiple clustered indexes in a table?

	Big NO!!
	
/* ******************************************************** */

-- To see the indexes on specific table:

	EXEC sp_helpindex Employee
	
-- To drop an index from specific table or column:

	DROP INDEX Employee.IX_Employee_EmpId
	
/* ******************************************************** */

Types of Indexes in SQL Server:

	- Clustered Index
	- Non-Clustered Index

/* ******************************************************** */

- Clustered Index 

	- This defines the order in which the data is physically stored in a table.
	- It uses the B-Tree Structure where the data is segregated into Root Node, Non-Leaf Node and Leaf Node. The Leaf Node store the actual data.
	- A table can have only one clustered index. 
	- This can be created by default when we create the primary key constraint for table
	- When a table has a clustered index then table is called a clustered table.
	
-- Working with Clustered Index 

	CREATE TABLE EmployeeDetails
	(EmpId INT PRIMARY KEY,
	EmpName VARCHAR(50),
	EmpSalary FLOAT,
	City VARCHAR(50))

	SELECT * FROM EmployeeDetails;

	INSERT INTO EmployeeDetails VALUES(5, 'King', 12000, 'New York');
	INSERT INTO EmployeeDetails VALUES(1, 'Kochhar', 32000, 'Toronto');
	INSERT INTO EmployeeDetails VALUES(3, 'Smith', 22000, 'Tokiyo');
	INSERT INTO EmployeeDetails VALUES(4, 'Sarah', 40000, 'Delhi');
	INSERT INTO EmployeeDetails VALUES(2, 'John', 14000, 'London');

	EXEC sp_helpindex Employee

	EXEC sp_helpindex EmployeeDetails

	-- Error: Cannot create more than one clustered index on table 'EmployeeDetails'. Drop the existing clustered index 'PK__Employee__AF2DBB99DECBD047' before creating another.
	CREATE CLUSTERED INDEX IX_Employee_EmpSalary
	ON EmployeeDetails(EmpSalary ASC)

	-- Error: An explicit DROP INDEX is not allowed on index 'EmployeeDetails.PK__Employee__AF2DBB99DECBD047'. It is being used for PRIMARY KEY constraint enforcement.
	DROP INDEX EmployeeDetails.PK__Employee__AF2DBB99DECBD047

	ALTER TABLE EmployeeDetails
	DROP CONSTRAINT PK__Employee__AF2DBB99DECBD047

/* ******************************************************** */

- Non-Clustered Index

	- The actual data is stored in one place and index table is stored in another place.
	- The index table will have pointers to the storage location of actual data.
	
- Difference between Clustered and Non-Clustered Index

	- Both uses the B-Tree structure i.e. Having the Root Node, Non-Leaf Node and Leaf Node.
	- In clustered Index, the leaf node holds the actual data.
	- In Non-Clustered Index, the leaf node has a ROW IDENTIFIER (RID) and this RID points to the actual data.
	
-- Working with Non-Clustered Index:

	CREATE TABLE OrderDetail
	(Id INT,
	CustomerId INT, 
	ProductId VARCHAR(50),
	ProductName VARCHAR(50))

	DECLARE @i INT = 0;
	WHILE @i < 5000
	BEGIN
		SET @i = @i + 1;
		IF(@i < 1000)
		BEGIN
			INSERT INTO OrderDetail VALUES(@i, 1003, 'P101', 'Mobile');
		END
		ELSE IF(@i < 2000)
		BEGIN
			INSERT INTO OrderDetail VALUES(@i, 1003, 'P107', 'HardDisk');
		END
		ELSE IF(@i < 3000)
		BEGIN
			INSERT INTO OrderDetail VALUES(@i, 1004, 'P102', 'Mouse');
		END
		ELSE IF(@i < 4000)
		BEGIN
			INSERT INTO OrderDetail VALUES(@i, 1002, 'P100', 'PenDrive');
		END
		ELSE IF(@i < 5000)
		BEGIN
			INSERT INTO OrderDetail VALUES(@i, 1001, 'P111', 'Tablet');
		END
	END;

	SELECT * FROM OrderDetail

	SELECT * FROM OrderDetail
	WHERE ProductId = 'P102'

	CREATE NONCLUSTERED INDEX IX_OrderDetail_ProductId
	ON OrderDetail(ProductId)
	INCLUDE(Id, CustomerId, ProductName)

	SELECT * FROM OrderDetail
	WHERE ProductId = 'P102'

	SELECT * FROM OrderDetail
	WHERE CustomerId=1002 AND ProductName='Pendrive';

	CREATE NONCLUSTERED INDEX IX_OrderDetail_CustomerId_ProductName
	ON OrderDetail(CustomerId ASC, ProductName DESC)
	INCLUDE(Id, ProductId);


