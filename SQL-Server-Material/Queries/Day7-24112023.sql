
- Views (Virtual Tables)
- Stored Procedures
- Triggers
- Indexes
- Temp Tables

/* --------------------------------------------------------------- */

Views:

	- A view is a virtual table.
	- It fetches the data from one or more tables by SQL query.
	- It behaves just like a table.
	- The content in a view is dynamically produced from the referencing tables
	
Benefits:

	- Simplify, Customize and Filter the Data.
	- Provides the security by granting access to specific users on the views.
	- Improves transaction performance.
	

USE Sampledb;

	SELECT * FROM Employee;
	SELECT * FROM Department;

-- All Employees with specific columns

	CREATE VIEW vwAllEmployees
	AS 
	SELECT EmpId, EmpName, EmpSalary, DeptId
	FROM Employee

	ALTER VIEW vwAllEmployees
	AS 
	SELECT EmpId, EmpName, EmpSalary, EmpEmail, DeptId
	FROM Employee

	SELECT * FROM vwAllEmployees;

	INSERT INTO Employee VALUES(501, 'Rohit Sharma', 12000, 'rs1@gmail.com', DEFAULT, NULL, NULL);
	
	-- DML Operations on View

	INSERT INTO vwAllEmployees(EmpId, EmpName, EmpSalary, EmpEmail, DeptId) 
	VALUES(502, 'Shreya Singhal', 12000, 'ss11@gmail.com',40);

	DELETE FROM vwAllEmployees
	WHERE EmpId = 501

	UPDATE vwAllEmployees 
	SET EmpSalary = 20000
	WHERE EmpId = 502

-- View to retrieve the employees who belongs Id 10

	CREATE VIEW vwEmpDept10
	AS 
	SELECT EmpId, EmpName, EmpSalary, EmpEmail, DeptId
	FROM Employee
	WHERE DeptId = 10;

	SELECT * FROM vwEmpDept10;
	SELECT * FROM Employee;

	INSERT INTO vwEmpDept10(EmpId, EmpName, EmpSalary, EmpEmail, DeptId) 
	VALUES(503, 'Amit Bansal', 12000, 'ab1@gmail.com',40);

-- View by joining Employee and Department Tables

	CREATE VIEW vwEmpDeptDetails10
	AS
	SELECT e.EmpName, d.DeptName
	FROM Employee e JOIN Department d
	ON e.DeptId = d.DeptId

	SELECT * FROM vwEmpDeptDetails10;

	sp_helptext 'vwEmpDeptDetails10'

-- Create a view that lists customers from Sweden. (SwedishCustomer)

-- Add the City column to the existing view. (SwedishCustomer)

-- List all SwedishCustomer.

-- Drop the Swedish Customer View.

-- System Views:

	SELECT * FROM [INFORMATION_SCHEMA].[COLUMNS];

	SELECT * FROM [INFORMATION_SCHEMA].[COLUMNS]
	WHERE TABLE_NAME = 'Department';

	IF EXISTS(
		SELECT * FROM [INFORMATION_SCHEMA].[COLUMNS]
		WHERE TABLE_NAME = 'Department'
	) SELECT 'FOUND' AS RESULT 
	ELSE SELECT 'NOT FOUND' AS RESULT;

	SELECT * FROM [INFORMATION_SCHEMA].[VIEWS];

	SELECT * FROM [INFORMATION_SCHEMA].[TABLE_PRIVILEGES];

	SELECT * FROM [sys].[all_views];

	SELECT * FROM [sys].[databases];
	
/* ******************************************************* */

Stored Procedures:

	- Procedures are used to group one or more T-SQL statements.
	- They are called logical units.
	- When we create and then call the procedure for the first time,SQL server parse the query, creates an execution plan and stores in the cache.
	- In the subsequence exections of the stored procedure, SQL Server reuses the plan to execute the procedure.
	

-- Create a Procedure

	CREATE PROCEDURE usp_EmployeeList
	AS
	BEGIN
		SELECT EmpId, EmpName, EmpSalary
		FROM Employee
		ORDER BY EmpName
	END;

-- Call the Procedure

	EXEC usp_EmployeeList;

-- Alter a Procedure

	ALTER PROCEDURE usp_EmployeeList
	AS
	BEGIN
		SELECT EmpId, EmpName, EmpSalary, DeptId
		FROM Employee
		ORDER BY EmpName
	END;

-- Call the Procedure

	EXEC usp_EmployeeList;

-- Create a Procedure with Parameters

	ALTER PROCEDURE usp_EmpByDept
	(@deptId INT, @eSalary FLOAT)
	AS
	BEGIN
		SELECT EmpId, EmpName, EmpSalary, DeptId
		FROM Employee
		WHERE DeptId = @deptId AND EmpSalary > @eSalary
		ORDER BY EmpName
	END;

-- Call the Procedure

	EXEC usp_EmpByDept 10, 40000;

	EXEC usp_EmpByDept @deptId=10, @eSalary=40000;

-- Create a Procedure with Output Parameters

	ALTER PROCEDURE usp_EmpByDeptCount
	(@deptId INT, 
	@eSalary FLOAT,
	@empCount INT OUTPUT)
	AS
	BEGIN
		SELECT EmpId, EmpName, EmpSalary, DeptId
		FROM Employee
		WHERE DeptId = @deptId AND EmpSalary > @eSalary
		ORDER BY EmpName;
		SELECT @empCount = @@ROWCOUNT;
	END;

-- Call the Procedure

	DECLARE @count INT;
	EXEC usp_EmpByDeptCount @deptId=10, @eSalary=40000, @empCount = @count OUTPUT;
	SELECT @count AS 'Number of Employees Found.';






	

















