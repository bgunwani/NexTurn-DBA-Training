
	SHOW DATABASES;
	
	DROP DATABASE sakila;
	
	SOURCE D:\MySQL\salesdb\salesdb.sql
	
	SHOW DATABASES;
	
	USE salesdb;
	
	SELECT DATABASE();
	
	SHOW TABLES;
	
	DESC customers;
	
	SELECT customerName, phone from customers;
	
/* ************************************************** */

	SELECT *
	FROM employees;
	
	SELECT firstName, lastName, email
	FROM employees;
	
/* ************************************************** */
	
	SELECT firstName, lastName, email
	FROM employees
	ORDER BY firstName;
	
	SELECT firstName, lastName, email
	FROM employees
	ORDER BY firstName ASC;
	
	SELECT firstName, lastName, email
	FROM employees
	ORDER BY firstName DESC;
	
	SELECT firstName, lastName, email
	FROM employees
	ORDER BY firstName DESC, lastName ASC;
	
	SELECT orderNumber, quantityOrdered, priceEach, quantityOrdered*priceEach subTotal
	FROM orderdetails
	WHERE orderNumber = 10425
	ORDER BY quantityOrdered*priceEach DESC;
	
	SELECT orderNumber, quantityOrdered, priceEach, quantityOrdered*priceEach subTotal
	FROM orderdetails
	WHERE orderNumber = 10425
	ORDER BY subTotal DESC;
	
	SELECT orderNumber, quantityOrdered, priceEach, quantityOrdered*priceEach subTotal
	FROM orderdetails
	WHERE orderNumber = 10425
	ORDER BY 4 DESC;
	
	SELECT orderNumber, status
	FROM orders
	WHERE orderNumber > 10300
	ORDER BY FIELD(status, 'In Progress', 'On Hold', 'Cancelled', 'Resolved', 'Disputed', 'Shipped');
	
	SELECT firstName, lastName, reportsTo
    FROM employees
	ORDER BY reportsTo DESC;
	
/* ************************************************** */


	SELECT firstName, lastName, jobTitle 
	FROM employees
	WHERE jobTitle = 'Sales Rep';
	
	SELECT firstName, lastName, jobTitle, officeCode 
	FROM employees
	WHERE jobTitle = 'Sales Rep' AND officeCode = 2;
	
	SELECT firstName, lastName, jobTitle, officeCode 
	FROM employees
	WHERE jobTitle = 'Sales Rep' OR officeCode = 2;
	
	SELECT firstName, lastName, jobTitle, officeCode 
	FROM employees
	WHERE officeCode >= 1 AND officeCode < 3;

	SELECT firstName, lastName, jobTitle, officeCode 
	FROM employees
	WHERE officeCode BETWEEN 1 AND 3;
	
	SELECT firstName, lastName, jobTitle, officeCode 
	FROM employees
	WHERE firstName LIKE 'M%';
	
	SELECT firstName, lastName, jobTitle, officeCode 
	FROM employees
	WHERE firstName LIKE '%i';
	
	SELECT firstName, lastName, jobTitle, officeCode 
	FROM employees
	WHERE firstName LIKE '%i%';
	
	SELECT firstName, lastName, jobTitle, officeCode 
	FROM employees
	WHERE firstName LIKE '_a%';
	
	SELECT firstName, lastName, jobTitle, officeCode 
	FROM employees
	WHERE officeCode = 1 OR officeCode = 2;
	
	SELECT firstName, lastName, jobTitle, officeCode 
	FROM employees
	WHERE officeCode NOT IN (1,2);
	
	SELECT firstName, lastName, jobTitle, officeCode, reportsTo 
	FROM employees
	WHERE reportsTo IS NULL;
	
	SELECT firstName, lastName, jobTitle, officeCode, reportsTo 
	FROM employees
	WHERE reportsTo IS NOT NULL;
	
	SELECT customerNumber, customerName, creditLimit
	FROM customers
	ORDER BY creditLimit DESC;
	
	-- To get the top five customers who have the highest credit.
	SELECT customerNumber, customerName, creditLimit
	FROM customers
	ORDER BY creditLimit DESC
	LIMIT 5;
	
	-- To get the five customers who have the lowest credit.
	SELECT customerNumber, customerName, creditLimit
	FROM customers
	ORDER BY creditLimit ASC
	LIMIT 5;

	-- To find the customer who hs second-highest and third-highest credit.
	SELECT customerNumber, customerName, creditLimit
	FROM customers
	ORDER BY creditLimit DESC
	LIMIT 1,2; 
	
	-- Syntax: LIMIT [offset], [row_count]
	
	SELECT DISTINCT state
	FROM customers
	WHERE state IS NOT NULL
	ORDER BY state DESC;
	
	
	
	










	
	
	SELECT orderNumber, quantityOrdered, priceEach, quantityOrdered*priceEach subTotal
	FROM orderdetails
	WHERE quantityOrdered*priceEach > 3000;
	
	-- ERROR 1054 (42S22): Unknown column 'subTotal' in 'where clause'
	SELECT orderNumber, quantityOrdered, priceEach, quantityOrdered*priceEach subTotal
	FROM orderdetails
	WHERE subTotal > 3000;
	
	
	
	
