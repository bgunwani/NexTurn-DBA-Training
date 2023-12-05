
-- To create database

	CREATE DATABASE Sampledb

-- To use `sampledb` database

	USE Sampledb

-- Create Table `department` Table

	CREATE TABLE Department
	(DeptId INT PRIMARY KEY,
	DeptName VARCHAR(20) NOT NULL,
	DeptLocation VARCHAR(20) CHECK (DeptLocation IN('Delhi', 'Chennai', 'Hyderabad')),
	DeptAddedDate DATETIME DEFAULT GETDATE());

-- Populate the Data into `Department` Table

	INSERT INTO Department VALUES(10, 'Sales', 'Chennai', GETDATE());
	INSERT INTO Department VALUES(20, 'Advertisment', 'Hyderabad', GETDATE());
	INSERT INTO Department VALUES(30, 'Marketing', 'Delhi', GETDATE());
	INSERT INTO Department(DeptId, DeptName, DeptLocation) VALUES(40, 'Development', 'Delhi');

-- Retrieve the data from `Department` Table

	SELECT * FROM Department;

-- Create Table `Employee` Table

	CREATE TABLE Employee
	(EmpId INT PRIMARY KEY, 
	EmpName VARCHAR(50) NOT NULL,
	EmpSalary FLOAT CHECK (EmpSalary > 5000),
	EmpEmail VARCHAR(50) UNIQUE,
	EmpAddedDate DATETIME DEFAULT GETDATE(),
	DeptId INT FOREIGN KEY REFERENCES Department(DeptId))

-- Insert data into `Employee` Table

	INSERT INTO Employee VALUES(101, 'King Kochhar', 12000, 'kk@gmail.com', DEFAULT, 10);
	INSERT INTO Employee VALUES(102, 'John Smith', 43000, 'js@gmail.com', DEFAULT, 10);
	INSERT INTO Employee VALUES(103, 'Shreya Sharma', 30000, NULL, DEFAULT, 20);
	INSERT INTO Employee VALUES(104, 'Gautam Bhalla', 25000, 'gb@gmail.com', DEFAULT, 20);
	INSERT INTO Employee VALUES(105, 'Sapna Sharma', 32000, 'ss@gmail.com', DEFAULT, 30);
	INSERT INTO Employee VALUES(106, 'Sarah Bowling', 22000, 'sb@gmail.com', DEFAULT, 30);
	INSERT INTO Employee VALUES(107, 'Rohit Sharma', 18000, 'rs@gmail.com', DEFAULT, 10);
	INSERT INTO Employee VALUES(108, 'Sumit Dhawan', 32000, 'sd@gmail.com', DEFAULT, 20);
	INSERT INTO Employee VALUES(109, 'Ankur Varsi', 15000, 'av@gmail.com', DEFAULT, 30);
	INSERT INTO Employee VALUES(110, 'Roger Lee', 30000, 'rg@gmail.com', DEFAULT, NULL);
	INSERT INTO Employee VALUES(111, 'Ruskin Smith', 22000, 'rss@gmail.com', DEFAULT, NULL);

-- To retrieve data from `Employee` Table

	SELECT * FROM Employee;

-- Projection - Restrict the columns

	SELECT EmpId, EmpName, EmpSalary
	FROM Employee;

-- Selection - Restrict the Rows

	SELECT *
	FROM Employee
	WHERE EmpId > 105;

-- Projection and Selection 

	SELECT EmpId, EmpName, EmpSalary
	FROM Employee
	WHERE EmpId > 105;

-- Arithmetic Operators (+, -, *, /)

	SELECT EmpId, EmpName, EmpSalary*12, EmpSalary*0.10
	FROM Employee
	WHERE EmpId > 105;	

-- Alias Names to the Column

	SELECT EmpId, EmpName, EmpSalary*12 AnnualSalary, EmpSalary*0.10 ProvidedFund
	FROM Employee
	WHERE EmpId > 105;	

	SELECT EmpId, EmpName, EmpSalary*12 as AnnualSalary, EmpSalary*0.10 as ProvidedFund
	FROM Employee
	WHERE EmpId > 105;	

	SELECT EmpId, EmpName, EmpSalary*12 'Annual Salary', EmpSalary*0.10 'Provided Fund'
	FROM Employee
	WHERE EmpId > 105;	

-- Comparison/Relational Operators (>, <, >=, <=, =, <> or !=)

	SELECT EmpId, EmpName, EmpSalary
	FROM Employee
	WHERE EmpId > 105;

	SELECT EmpId, EmpName, EmpSalary
	FROM Employee
	WHERE EmpId != 105;

	SELECT EmpId, EmpName, EmpSalary
	FROM Employee
	WHERE EmpName = 'KING KOCHHAR';

	SELECT EmpId, EmpName, EmpSalary, EmpAddedDate
	FROM Employee
	WHERE EmpAddedDate = '2023-11-20 09:46:53.970';

	SELECT EmpId, EmpName, EmpSalary, EmpAddedDate
	FROM Employee
	WHERE EmpSalary >=20000 AND EmpSalary <=40000;

	SELECT EmpId, EmpName, EmpSalary, EmpAddedDate
	FROM Employee
	WHERE EmpAddedDate >= '2023-01-01 09:48:07.677' AND EmpAddedDate <= '2023-12-31 09:48:07.677';

-- Logical Operators (AND, OR, NOT)

	SELECT EmpId, EmpName, EmpSalary, EmpAddedDate
	FROM Employee
	WHERE EmpSalary >=20000 AND EmpSalary <=40000;

	SELECT EmpId, EmpName, EmpSalary, EmpAddedDate
	FROM Employee
	WHERE EmpName='King Kochhar' AND EmpSalary<20000;

	SELECT EmpId, EmpName, EmpSalary, EmpAddedDate
	FROM Employee
	WHERE EmpName='King Kochhar' OR EmpSalary>20000;

	SELECT EmpId, EmpName, EmpSalary, EmpAddedDate
	FROM Employee
	WHERE EmpName='King Kochhar' OR EmpName = 'John Smith' OR EmpName = 'Shreya Sharma';

	SELECT EmpId, EmpName, EmpSalary, EmpAddedDate
	FROM Employee
	WHERE EmpName='King Kochhar' AND NOT EmpSalary>20000;

-- MISC Operators (BETWEEN, LIKE, IN, IS NULL)

	SELECT EmpId, EmpName, EmpSalary, EmpAddedDate
	FROM Employee
	WHERE EmpSalary > 20000 AND EmpSalary < 40000;

	SELECT EmpId, EmpName, EmpSalary, EmpAddedDate
	FROM Employee
	WHERE EmpSalary BETWEEN 22000 AND 30000;

	SELECT EmpId, EmpName, EmpSalary, EmpAddedDate
	FROM Employee
	WHERE EmpSalary NOT BETWEEN 22000 AND 30000;

	SELECT EmpId, EmpName, EmpSalary, EmpAddedDate
	FROM Employee
	WHERE EmpName='King Kochhar' OR EmpName = 'John Smith' OR EmpName = 'Shreya Sharma';

	SELECT EmpId, EmpName, EmpSalary, EmpAddedDate
	FROM Employee
	WHERE EmpName IN ('King Kochhar', 'John Smith', 'Shreya Sharma');

	SELECT EmpId, EmpName, EmpSalary, EmpAddedDate
	FROM Employee
	WHERE EmpName NOT IN ('King Kochhar', 'John Smith', 'Shreya Sharma');

	SELECT EmpId, EmpName, EmpSalary, EmpAddedDate, DeptId
	FROM Employee
	WHERE DeptId IS NULL

	SELECT EmpId, EmpName, EmpSalary, EmpAddedDate, DeptId
	FROM Employee
	WHERE DeptId IS NOT NULL

	SELECT EmpId, EmpName, EmpSalary, EmpAddedDate, DeptId
	FROM Employee
	WHERE EmpName LIKE 'S%'

	SELECT EmpId, EmpName, EmpSalary, EmpAddedDate, DeptId
	FROM Employee
	WHERE EmpName LIKE '%a'

	SELECT EmpId, EmpName, EmpSalary, EmpAddedDate, DeptId
	FROM Employee
	WHERE EmpName LIKE 'S%a'

	SELECT EmpId, EmpName, EmpSalary, EmpAddedDate, DeptId
	FROM Employee
	WHERE EmpName LIKE '_u%'

	SELECT EmpId, EmpName, EmpSalary, EmpAddedDate, DeptId
	FROM Employee
	WHERE EmpName NOT LIKE '_u%'

--

	SELECT * FROM Department;
	SELECT * FROM Employee;