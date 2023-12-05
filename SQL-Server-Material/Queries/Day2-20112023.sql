
USE Sampledb;

SELECT * FROM Department;
SELECT * FROM Employee;

-- Add New Column to `employee` table

	ALTER TABLE Employee
	ADD City VARCHAR(50);

	UPDATE Employee
	SET City = 'New Delhi';

	ALTER TABLE Employee
	ADD City VARCHAR(50) DEFAULT 'New Delhi';

	ALTER TABLE Employee
	ADD ManagerId INT references Employee(EmpId)

-- Drop existing column from `employee` table

	ALTER TABLE Employee
	DROP CONSTRAINT DF__Employee__City__47DBAE45

	ALTER TABLE Employee
	DROP COLUMN City;

-- Modify the existing column

	ALTER TABLE Employee
	ALTER COLUMN EmpName VARCHAR(30);

-- To view the table definition

	EXEC sp_help 'Employee'

-- Joins: To extract data from two or more tables:

	SELECT * FROM Employee;
	SELECT * FROM Department;


-- Inner Join

	SELECT EmpName, DeptName
	FROM Employee JOIN Department
	ON Employee.DeptId = Department.DeptId

	SELECT Employee.EmpName, Department.DeptName
	FROM Employee JOIN Department
	ON Employee.DeptId = Department.DeptId

	SELECT e.EmpName, d.DeptName, 
	e.EmpSalary, d.DeptLocation, d.DeptId
	FROM Employee e JOIN Department d
	ON e.DeptId = d.DeptId

-- Outer Join

	SELECT e.EmpName, d.DeptName, 
	e.EmpSalary, d.DeptLocation, d.DeptId
	FROM Employee e LEFT OUTER JOIN Department d
	ON e.DeptId = d.DeptId
	
	SELECT e.EmpName, d.DeptName, 
	e.EmpSalary, d.DeptLocation, d.DeptId
	FROM Employee e RIGHT OUTER JOIN Department d
	ON e.DeptId = d.DeptId

	SELECT e.EmpName, d.DeptName, 
	e.EmpSalary, d.DeptLocation, d.DeptId
	FROM Employee e FULL OUTER JOIN Department d
	ON e.DeptId = d.DeptId

-- Self Join

	SELECT * FROM Employee;

-- To retrieve employee and their manager names

	SELECT emp.EmpName EmployeeName, emp.ManagerId, 
	mgr.EmpName ManagerName, mgr.EmpId
	FROM Employee emp JOIN Employee mgr
	ON emp.ManagerId = mgr.EmpId;

	SELECT emp.EmpName EmployeeName, emp.ManagerId, 
	mgr.EmpName ManagerName, mgr.EmpId
	FROM Employee emp JOIN Employee mgr
	ON emp.ManagerId = mgr.EmpId
	AND emp.DeptId IN(10,20);

-- Cross Join:

	SELECT e.EmpName, d.DeptName
	FROM Employee e CROSS JOIN Department d

	SELECT emp.EmpName EmployeeName, mgr.EmpName ManagerName
	FROM Employee emp JOIN Employee mgr
	ON emp.ManagerId = mgr.ManagerId;
	
-- Sorting and Arranging the records
	
	SELECT EmpName, EmpSalary, EmpEmail
	FROM Employee
	ORDER BY EmpName

	SELECT EmpName, EmpSalary, EmpEmail
	FROM Employee
	ORDER BY EmpName ASC

	SELECT EmpName, EmpSalary, EmpEmail
	FROM Employee
	ORDER BY EmpName DESC

	SELECT EmpName, EmpSalary, EmpEmail
	FROM Employee
	ORDER BY EmpName DESC, EmpSalary ASC

	SELECT EmpName, EmpSalary, EmpSalary*12 AnnualSalary
	FROM Employee
	WHERE (EmpSalary*12) > 300000
	ORDER BY AnnualSalary

	SELECT EmpName, EmpSalary, EmpSalary*12 AnnualSalary
	FROM Employee
	WHERE (EmpSalary*12) > 300000
	ORDER BY EmpName ASC, EmpSalary ASC

-- Functions: Built-In Functions and User Defined Functions

-- Single Row Functions: The result will given for each row

	SELECT UPPER(EmpName), EmpSalary
	FROM Employee

	SELECT EmpName, EmpSalary
	FROM Employee
	WHERE EmpName = UPPER('KING KOCHHAR');

-- Multi Row Functions: The result will be given for multiple rows

-- Group Functions/Aggregate Functions

	SELECT SUM(EmpSalary) TotalSalary
	FROM Employee;

	SELECT MIN(EmpSalary) MinimumSalary
	FROM Employee;

	SELECT MAX(EmpSalary) MaximumSalary
	FROM Employee;

	SELECT AVG(EmpSalary) AverageSalary
	FROM Employee;

	SELECT COUNT(EmpSalary) NoOfEmployees
	FROM Employee;

	SELECT COUNT(EmpSalary) NoOfEmployees,
	SUM(EmpSalary) TotalSalary,
	MIN(EmpSalary) MinimumSalary,
	MAX(EmpSalary) MaximumSalary,
	AVG(EmpSalary) AverageSalary
	FROM Employee;

	SELECT COUNT(DeptId) NoOfEmployees
	FROM Employee;

	SELECT SUM(EmpSalary) TotalSalary, DeptId
	FROM Employee;

