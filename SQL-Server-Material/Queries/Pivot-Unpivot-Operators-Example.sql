

USE [SalesOrdersDB]

CREATE TABLE Sales
(SalesPerson VARCHAR(200),
SalesAmount DECIMAL(10,2),
SalesYear INT);

INSERT INTO Sales (SalesPerson, SalesAmount, SalesYear)
VALUES
	('King Kochhar', 50000, 2021),
	('King Kochhar', 40000, 2022),
	('Gautam Bhalla', 35000, 2021),
	('King Kochhar', 60000, 2021),
	('Gautam Bhalla', 55000, 2022),
	('Gautam Bhalla', 52000, 2022)

SELECT * FROM [Sales];

-- PIVOT: allows you to rotate rows into columns by creating 
-- a cross-tabulation of data.

SELECT SalesPerson, [2021], [2022]
FROM (SELECT SalesPerson, SalesYear, SalesAmount FROM Sales) AS SourceTable
PIVOT
(SUM(SalesAmount) FOR SalesYear IN ([2021], [2022])) AS PivotTable


-- Unpivot : performs the opposite operation to Pivot i.e. turing columns into rows

SELECT SalesPerson, SalesYear, SalesAmount
FROM
( SELECT SalesPerson, [2021], [2022] FROM Sales
  PIVOT (SUM(SalesAmount) FOR SalesYear IN ([2021], [2022])) AS PivotTable
) as SourceTable
UNPIVOT (SalesAmount FOR SalesYear IN ([2021], [2022])) AS UnpivotTable

-- Group By Clause:

SELECT SalesYear, SUM(SalesAmount) as TotalSales
FROM Sales
GROUP BY SalesYear
