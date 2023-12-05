
USE Sampledb;

SELECT * FROM Employee;
SELECT * FROM Department;

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

	SELECT SUM(EmpSalary), DeptId
	FROM Employee
	GROUP BY DeptId;

	SELECT DeptId, ManagerId, SUM(EmpSalary)
	FROM Employee
	GROUP BY DeptId, ManagerId;

	SELECT DeptId, SUM(EmpSalary)
	FROM Employee
	WHERE DeptId IS NOT NULL
	GROUP BY DeptId;

	SELECT DeptId, SUM(EmpSalary)
	FROM Employee
	GROUP BY DeptId
	HAVING SUM(EmpSalary) < 70000;

	SELECT * FROM Employee


USE SalesOrdersDB;

SELECT * FROM Customer;
SELECT * FROM [Order];

SELECT FirstName, LastName, OrderNumber, TotalAmount, Quantity
FROM Customer C LEFT OUTER JOIN [Order] O 
ON C.Id = O.CustomerId
LEFT OUTER JOIN [OrderItem] OI
ON O.Id = OI.OrderId
ORDER BY TotalAmount;

SELECT DISTINCT(C.ID), FirstName, LastName, I.ProductId
FROM [Order] O JOIN [OrderItem] I 
ON O.Id = I.OrderId AND I.ProductId = 13
RIGHT JOIN Customer C
ON C.Id = O.CustomerId

SELECT S1.CompanyName AS SupplierName1, S2.CompanyName AS SupplierName2, S1.Country
FROM Supplier S1 JOIN Supplier S2
ON S1.Country = S2.Country AND S1.Id <> S2.Id
ORDER BY S1.Country

SELECT C1.FirstName as FirstName1, C2.FirstName as FirstName2, C1.City, c1.Country
FROM Customer C1 JOIN Customer C2
ON C1.Country = C2.Country 
AND C1.City = c2.City
AND C1.Id <> C2.Id
ORDER BY C1.Country

DELETE OrderItem
FROM [OrderItem] JOIN [Order]
ON [OrderItem].OrderId = [Order].Id 
JOIN Product ON Product.Id = OrderItem.ProductId
WHERE OrderNumber = '542379' AND ProductName = 'Tofu'

-- List the number of products for each supplier, sorted high to low.

	SELECT COUNT(P.Id) AS Products, S.CompanyName
	FROM Supplier S JOIN Product P
	ON S.Id = P.SupplierId
	GROUP BY S.CompanyName
	ORDER BY COUNT(P.Id) DESC

-- List the number of customers in each country. Only include countries with more than 10 customers.

	SELECT Country, Count(Id) as Customers
	FROM Customer
	GROUP BY Country
	HAVING COUNT(Id) > 10

-- TOP Statement in SQL - returns the first n rows

	SELECT TOP 10 * 
	FROM Customer
	ORDER BY FirstName;

	SELECT TOP 10 FirstName, LastName
	FROM Customer
	ORDER BY FirstName;

	SELECT *
	FROM Customer C JOIN [Order] O
	ON C.Id = O.CustomerId

	SELECT TOP 5 C.*, O.TotalAmount
	FROM Customer C JOIN [Order] O
	ON C.Id = O.CustomerId

-- OFFSET-FETCH - excludes the first set of rows from a result set.

	SELECT *
	FROM [Order]
	ORDER BY TotalAmount DESC
	OFFSET 10 ROWS

	SELECT *
	FROM [Order]
	ORDER BY TotalAmount DESC
	OFFSET 10 ROWS
	FETCH NEXT 5 ROWS ONLY

-- Select INTO - copies data from one table into a new table

	SELECT * INTO cust FROM Customer
	WHERE Country = 'Germany'

	SELECT Id, FirstName, Country INTO cust1 FROM Customer
	WHERE Country = 'Germany'

	SELECT * FROM customer
	SELECT * FROM cust;
	SELECT * FROM cust1;

-- INSERT INTO - copies data from one table to another table

	CREATE TABLE cust3
	(Id INT,
	Name VARCHAR(200),
	COUNTRY VARCHAR(200))

	INSERT INTO cust3(Id, Name, Country)
	SELECT Id, FirstName, Country
	FROM Customer
	WHERE Country = 'UK';


	

