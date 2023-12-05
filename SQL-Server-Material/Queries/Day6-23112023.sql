
	USE SalesOrdersDB;

	UPDATE I
	SET I.UnitPrice = 25
	FROM Customer C JOIN [Order] O ON C.Id = O.CustomerId
	JOIN OrderItem I ON I.OrderId = O.Id
	JOIN Product P ON P.Id = I.ProductId
	WHERE C.FirstName = 'Paul' AND C.LastName = 'Henriot' AND
	P.ProductName = 'Queso Cabrales';

-- List all customers with their total number of orders.

	SELECT * FROM Customer;
	SELECT * FROM [Order];

	SELECT FirstName, LastName, 
	OrderCount = (SELECT COUNT(O.Id) FROM [Order] O WHERE O.CustomerId = C.Id)
	FROM Customer C;

/* This is called a Correlated SubQuery because the subquery refrences the enclosed query. */

 -- To retrieve all customers that are from same countries as where the suppliers are.

	SELECT FirstName, LastName, Country
	FROM Customer
	WHERE Country IN (SELECT DISTINCT(Country) FROM Supplier)

-- ANY - returns true if any of the subquery value meets the condition.

-- To retrieve products that have sold for UNDER USD 5.

	SELECT * FROM Product;
	SELECT * FROM OrderItem;

	SELECT Id, ProductName
	FROM Product
	WHERE Id > ANY (SELECT ProductId FROM OrderItem WHERE UnitPrice <5)

-- ALL - returns true if any of the subquery value meets the condition.

	SELECT Id, ProductName
	FROM Product
	WHERE Id > ALL (SELECT ProductId FROM OrderItem WHERE UnitPrice <5)
	
-- (1,2,3,4,5,6,7,8,9,10) >= ANY (3,5) => 4,5,6,7,8,9, 10
-- (1,2,3,4,5,6,7,8,9,10) >= ALL (3,5) => 6,7,8,9, 10


USE Sampledb;

SELECT * FROM Employee;
SELECT * FROM Department;

-- SubQuery 
	-- Query within a query.
	-- The result of inner query becomes the input for outer query.
	-- We always get result set from the outer query.

-- Update the salary of King Kochhar as that of the salary of John Smith.

	SELECT EmpSalary
	FROM Employee
	WHERE EmpName = 'John Smith';

	UPDATE Employee
	SET EmpSalary = 43000
	WHERE EmpName = 'King Kochhar';

	UPDATE Employee
	SET EmpSalary = (SELECT EmpSalary 
					FROM Employee 
					WHERE EmpName = 'John Smith')
	WHERE EmpName = 'King Kochhar';

-- List all the employees working in Sales Department.

	SELECT EmpName, EmpSalary, DeptId
	FROM Employee
	WHERE DeptId = (SELECT DeptId FROM Department WHERE DeptName = 'Sales');

-- Single Row SubQueries - When your subquery returns single row.
-- Single Row SubQuery Operators - (Relational Operators) - >, <, >=, <=, =, <>

	SELECT EmpName, EmpSalary, DeptId
	FROM Employee
	WHERE DeptId = (SELECT DeptId FROM Department WHERE DeptName = 'Sales');

-- Multi Row SubQueries - WHen your subquery returns more than one rows.
-- Multi Row Subquery Operators - IN, ANY or ALL

	SELECT EmpName, EmpSalary, DeptId
	FROM Employee
	WHERE DeptId IN (SELECT DeptId FROM Department WHERE DeptLocation = 'Delhi');

/* ------------------------------------------------------------------------- */

	USE Sampledb;

	SELECT * FROM Employee;

	CREATE TABLE EmployeeAudit
	(EmpAuditId INT IDENTITY(1,1),
	EmpId INT,
	EmpName VARCHAR(100),
	Operation VARCHAR(100),
	OperationDate DATE DEFAULT GETDATE())

-- FOR INSERT TRIGGER 

	CREATE TRIGGER trgEmployeeInsert
	ON Employee
	FOR INSERT
	AS 
	INSERT INTO EmployeeAudit(EmpId, EmpName, Operation)
	SELECT EmpId, EmpName, 'INSERT' FROM INSERTED;

	CREATE TRIGGER trgEmployeeDelete
	ON Employee
	FOR DELETE
	AS 
	INSERT INTO EmployeeAudit(EmpId, EmpName, Operation)
	SELECT EmpId, EmpName, 'DELETE' FROM DELETED;

	CREATE TRIGGER trgEmployeeUpdate
	ON Employee
	FOR UPDATE
	AS 
	INSERT INTO EmployeeAudit(EmpId, EmpName, Operation)
	SELECT EmpId, EmpName, 'UPDATE' FROM INSERTED;
	PRINT 'Employee Detail Updated.'

-- INSTEAD OF TRIGGER

	CREATE TRIGGER trgInsteadOfEmployeeDelete
	ON Employee
	INSTEAD OF DELETE
	AS
	PRINT 'You are not permitted to delete employee record.';

-- Verify with Operations:

	INSERT INTO Employee VALUES(513, 'Aakash Singh', 12000, 'as@gmail.com', DEFAULT, NULL, NULL);
	DELETE FROM Employee WHERE EmpId = 513;
	UPDATE Employee SET EmpName = 'Bhawna Gunwani' WHERE EmpId = 101;
	DELETE FROM Employee WHERE EmpId = 101;

	SELECT * FROM Employee;
	SELECT * FROM EmployeeAudit;

	DROP TRIGGER trgEmployeeUpdate

	DISABLE TRIGGER trgEmployeeUpdate
	ON Employee
	