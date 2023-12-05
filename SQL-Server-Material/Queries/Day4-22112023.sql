
USE SalesOrdersDB;

SELECT * FROM [dbo].[Customer];
SELECT * FROM [dbo].[Order];
SELECT * FROM [dbo].[OrderItem];
SELECT * FROM [dbo].[Product];
SELECT * FROM [dbo].[Supplier];

-- List all suppliers with their products

	SELECT S.CompanyName, P.ProductName
	FROM  [dbo].[Supplier] S JOIN [dbo].[Product] P
	ON S.Id = P.SupplierId

-- List all orders with Product Name, Quantity and Price, arrange by order number.

	SELECT P.ProductName, I.Quantity, I.UnitPrice, O.OrderNumber
	FROM  [dbo].[Order] O JOIN [dbo].[OrderItem] I
	ON O.Id = I.OrderId JOIN [dbo].[Product] P
	ON P.Id = I.ProductId
	ORDER BY O.OrderNumber

	SELECT P.ProductName, I.Quantity, I.UnitPrice, O.OrderNumber, CONVERT(date, O.OrderDate) AS DATE
	FROM  [dbo].[Order] O JOIN [dbo].[OrderItem] I
	ON O.Id = I.OrderId JOIN [dbo].[Product] P
	ON P.Id = I.ProductId
	ORDER BY O.OrderNumber

-- To retrieve all suppliers and their products including suppliers with no products.

-- Match all customers and suppliers by country.

	SELECT C.FirstName, C.Country, S.Country
	FROM [dbo].[Customer] C FULL JOIN [dbo].[Supplier] S
	ON C.Country = S.Country
	ORDER BY C.Country, S.Country

-- To retrieve customers that have not placed orders yet.

	SELECT FirstName, City, Country, TotalAmount
	FROM [dbo].[Customer] C JOIN [dbo].[Order] O 
	ON C.Id = O.CustomerId
	WHERE TotalAmount IS NULL;


