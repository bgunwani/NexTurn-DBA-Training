


/* *************************************************************************************** */
/* Base Tables to be Used: */
/* *************************************************************************************** */

-- Create table 1

	CREATE TABLE table1
	(ID INT, Value VARCHAR(10));
	INSERT INTO Table1 (ID, Value)
	SELECT 1,'First'
	UNION ALL
	SELECT 2,'Second'
	UNION ALL
	SELECT 3,'Third'
	UNION ALL
	SELECT 4,'Fourth'
	UNION ALL
	SELECT 5,'Fifth';

-- Create table 2

	CREATE TABLE table2
	(ID INT, Value VARCHAR(10));
	INSERT INTO Table2 (ID, Value)
	SELECT 1,'First'
	UNION ALL
	SELECT 2,'Second'
	UNION ALL
	SELECT 3,'Third'
	UNION ALL
	SELECT 6,'Sixth'
	UNION ALL
	SELECT 7,'Seventh'
	UNION ALL
	SELECT 8,'Eighth';

	SELECT * FROM Table1;
	SELECT * FROM Table2;

-- Clean up

	DROP TABLE table1;
	DROP TABLE table2;
	
/* *************************************************************************************** */
/* INNER JOIN Example: */
/* *************************************************************************************** */

/* INNER JOIN */

	SELECT t1.*,t2.*
	FROM Table1 t1
	INNER JOIN Table2 t2 ON t1.ID = t2.ID;

/* INNER JOIN */

	SELECT 	t1.ID AS T1ID, t1.Value AS T1Value, 
			t2.ID T2ID, t2.Value AS T2Value
	FROM Table1 t1
	INNER JOIN Table2 t2 ON t1.ID = t2.ID;
	
/* *************************************************************************************** */
/* OUTER JOIN Example: */
/* *************************************************************************************** */

/* LEFT JOIN */

	SELECT 	t1.ID AS T1ID, t1.Value AS T1Value, 
			t2.ID T2ID, t2.Value AS T2Value
	FROM Table1 t1
	LEFT JOIN Table2 t2 ON t1.ID = t2.ID;

/* RIGHT JOIN */

	SELECT 	t1.ID AS T1ID, t1.Value AS T1Value, 
			t2.ID T2ID, t2.Value AS T2Value
	FROM Table1 t1
	RIGHT OUTER JOIN Table2 t2 ON t1.ID = t2.ID;

/* FULL OUTER JOIN */

	SELECT 	t1.ID AS T1ID, t1.Value AS T1Value, 
			t2.ID T2ID, t2.Value AS T2Value
	FROM Table1 t1
	LEFT JOIN Table2 t2 ON t1.ID = t2.ID
	UNION 
	SELECT 	t1.ID AS T1ID, t1.Value AS T1Value, 
			t2.ID T2ID, t2.Value AS T2Value
	FROM Table1 t1
	RIGHT OUTER JOIN Table2 t2 ON t1.ID = t2.ID;

/* FULL OUTER JOIN */

	-- Following will throw an error
	SELECT 	t1.ID AS T1ID, t1.Value AS T1Value, 
			t2.ID T2ID, t2.Value AS T2Value
	FROM Table1 t1
	FULL OUTER JOIN Table2 t2 ON t1.ID = t2.ID;

/* *************************************************************************************** */
/* CROSS JOIN Example: */
/* *************************************************************************************** */

/* CROSS JOIN */

	SELECT 	t1.ID AS T1ID, t1.Value AS T1Value, 
			t2.ID T2ID, t2.Value AS T2Value
	FROM Table1 t1
	CROSS JOIN Table2 t2;
	
/* *************************************************************************************** */
/* NATURAL JOIN Example: */
/* *************************************************************************************** */

/* INNER JOIN */

	SELECT 	t1.ID AS T1ID, t1.Value1 AS T1Value, 
			t2.ID T2ID, t2.Value2 AS T2Value
	FROM Table1 t1
	INNER JOIN Table2 t2 ON t1.ID = t2.ID;

/* INNER JOIN */

	SELECT 	t1.ID AS T1ID, t1.Value1 AS T1Value, 
			t2.ID T2ID, t2.Value2 AS T2Value
	FROM Table1 t1
	NATURAL JOIN Table2 t2;

/* LEFT JOIN */

	SELECT 	t1.ID AS T1ID, t1.Value1 AS T1Value, 
			t2.ID T2ID, t2.Value2 AS T2Value
	FROM Table1 t1
	LEFT JOIN Table2 t2 ON t1.ID = t2.ID;

/* LEFT JOIN */

	SELECT 	t1.ID AS T1ID, t1.Value1 AS T1Value, 
			t2.ID T2ID, t2.Value2 AS T2Value
	FROM Table1 t1
	NATURAL LEFT JOIN Table2 t2;
	
/* *************************************************************************************** */
/* NATURAL JOIN Example: */
/* *************************************************************************************** */

/* INNER JOIN */

	SELECT 	t1.ID AS T1ID, t1.Value AS T1Value, 
			t2.ID T2ID, t2.Value AS T2Value
	FROM Table1 t1
	INNER JOIN Table2 t2 ON t1.ID = t2.ID;

/* INNER JOIN - USING*/

	SELECT 	t1.ID AS T1ID, t1.Value AS T1Value, 
			t2.ID T2ID, t2.Value AS T2Value
	FROM Table1 t1
	INNER JOIN Table2 t2 USING (ID);

/* INNER JOIN */

	SELECT 	t1.ID AS T1ID, t1.Value AS T1Value, 
			t2.ID T2ID, t2.Value AS T2Value
	FROM Table1 t1
	INNER JOIN Table2 t2 ON t1.ID = t2.ID AND t1.Value = t2.Value;

/* INNER JOIN - USING*/

	SELECT 	t1.ID AS T1ID, t1.Value AS T1Value, 
			t2.ID T2ID, t2.Value AS T2Value
	FROM Table1 t1
	INNER JOIN Table2 t2 USING (ID, Value);

/* LEFT JOIN */

	SELECT 	t1.ID AS T1ID, t1.Value AS T1Value, 
			t2.ID T2ID, t2.Value AS T2Value
	FROM Table1 t1
	LEFT JOIN Table2 t2 ON t1.ID = t2.ID;

/* LEFT JOIN - USING */

	SELECT 	t1.ID AS T1ID, t1.Value AS T1Value, 
			t2.ID T2ID, t2.Value AS T2Value
	FROM Table1 t1
	LEFT JOIN Table2 t2 USING (ID);

/* *************************************************************************************** */
/* Union All: */
/* *************************************************************************************** */

/* UNION ALL */

	SELECT t1.ID T1ID, t1.Value AS T1Value
	FROM Table1 t1
	UNION ALL
	SELECT  t2.ID AS T2ID, t2.Value AS T2Value
	FROM Table2 t2;

/* UNION ALL */
-- Error
/* UNION ALL */

	SELECT t1.ID T1ID
	FROM Table1 t1
	UNION ALL
	SELECT  t2.ID AS T2ID, t2.Value AS T2Value
	FROM Table2 t2;

/* UNION */

	SELECT t1.ID T1ID, t1.Value AS T1Value
	FROM Table1 t1
	UNION
	SELECT  t2.ID AS T2ID, t2.Value AS T2Value
	FROM Table2 t2;

/* *************************************************************************************** */
/* Self Join: */
/* *************************************************************************************** */

-- Create a Table

	CREATE TABLE Employee(
	EmployeeID INT PRIMARY KEY,
	Name NVARCHAR(50),
	ManagerID INT);

-- Insert Sample Data

	INSERT INTO Employee
	SELECT 1, 'Mike', 3
	UNION ALL
	SELECT 2, 'David', 3
	UNION ALL
	SELECT 3, 'Roger', NULL
	UNION ALL
	SELECT 4, 'Marry',2
	UNION ALL
	SELECT 5, 'Joseph',2
	UNION ALL
	SELECT 7, 'Ben',2;

-- Check the data
	
	SELECT * FROM Employee;

-- Inner Join

	SELECT e1.Name EmployeeName, e2.name AS ManagerName
	FROM Employee e1
	INNER JOIN Employee e2
	ON e1.ManagerID = e2.EmployeeID;

-- Outer Join

	SELECT e1.Name EmployeeName, IFNULL(e2.name, 'Top Manager') AS ManagerName
	FROM Employee e1
	LEFT JOIN Employee e2
	ON e1.ManagerID = e2.EmployeeID;

-- Clean up

	DROP TABLE Employee;

/* *************************************************************************************** */
/* POP Quiz: */
/* *************************************************************************************** */

-- Students Table

	CREATE TABLE Students
	(StudentId INT, StudentName VARCHAR(10));
	INSERT INTO Students (StudentId, StudentName)
	SELECT 1,'John'
	UNION ALL
	SELECT 2,'Matt'
	UNION ALL
	SELECT 3,'James';

-- Classes Table

	CREATE TABLE Classes
	(ClassId INT, ClassName VARCHAR(10));
	INSERT INTO Classes (ClassId, ClassName)
	SELECT 1,'Maths'
	UNION ALL
	SELECT 2,'Arts'
	UNION ALL
	SELECT 3,'History';

-- StudentClass Table

	CREATE TABLE StudentClass
	(StudentId INT, ClassId INT);
	INSERT INTO StudentClass (StudentId, ClassId)
	SELECT 1,1
	UNION ALL
	SELECT 1,2
	UNION ALL
	SELECT 3,1
	UNION ALL
	SELECT 3,2
	UNION ALL
	SELECT 3,3;

-- Select data

	SELECT * FROM Students;
	SELECT * FROM Classes;
	SELECT * FROM StudentClass;

-- Q1 - What will be the best possible join if we want to retrieve all the students who have signed up for the classes in the summer? 

	SELECT st.StudentName, cl.ClassName
	FROM StudentClass sc
	INNER JOIN Classes cl ON cl.ClassID = sc.ClassID
	INNER JOIN Students st ON st.StudentID = sc.StudentID;

-- Q2 - 2:  What will be the best possible join if we want to retrieve all the students who have signed up for no classes in summer?

	SELECT st.StudentName, cl.ClassName
	FROM Students st
	LEFT JOIN StudentClass sc ON st.StudentID = sc.StudentID
	LEFT JOIN Classes cl ON cl.ClassID = sc.ClassID
	WHERE cl.ClassName IS NULL;

	SELECT st.StudentName
	FROM Students st
	LEFT JOIN StudentClass sc ON st.StudentID = sc.StudentID
	WHERE sc.ClassID IS NULL;

-- Clean up
	
	DROP TABLE Students;
	DROP TABLE Classes;
	DROP TABLE StudentClass;
	
/* *************************************************************************************** */
/* Puzzle SubQuery v/s Joins: */
/* *************************************************************************************** */

	SELECT * FROM Table1;
	SELECT * FROM Table2;

/* Subquery */

	SELECT 	t1.ID AS T1ID, t1.Value AS T1Value
	FROM Table1 t1
	WHERE t1.ID NOT IN (SELECT t2.ID FROM Table2 t2);


/* LEFT JOIN */

	SELECT 	t1.ID AS T1ID, t1.Value AS T1Value, t2.Value
	FROM Table1 t1
	LEFT OUTER JOIN Table2 t2 ON t1.ID = t2.ID
	WHERE t2.Value IS NULL;
	
/* *************************************************************************************** */
/* Problem Statement: Find customers who like to watch action movies? */
/* *************************************************************************************** */

	USE sakila;

-- Using Subquery

	SELECT cust.customer_id, cust.first_name, cust.last_name
	FROM customer cust
	WHERE cust.customer_id IN
	(
	SELECT ren.customer_id
	FROM rental ren
	WHERE ren.inventory_id IN
	(
	SELECT inv.inventory_id
	FROM inventory inv
	WHERE inv.film_id IN
	(
	SELECT fl.film_id
	FROM film fl
	WHERE fl.film_id IN 
	(
	SELECT fc.film_id
	FROM film_category fc
	WHERE fc.category_id IN 
	(
	SELECT cat.category_id 
	FROM category cat
	WHERE cat.name = 'Action'
	)))))
	ORDER BY cust.customer_id, cust.first_name, cust.last_name;

-- Using Joins

	SELECT DISTINCT cust.customer_id, cust.first_name, cust.last_name
	FROM customer cust
	INNER JOIN rental ren ON ren.customer_id = cust.customer_id
	INNER JOIN inventory inv ON inv.inventory_id = ren.inventory_id
	INNER JOIN film fl ON fl.film_id = inv.film_id
	INNER JOIN film_category fc ON fc.film_id = fl.film_id
	INNER JOIN category cat ON cat.category_id = fc.category_id
	WHERE cat.name = 'Action'
	ORDER BY cust.customer_id, cust.first_name, cust.last_name;
	
/* *************************************************************************************** */
/* SubQuery Aggregation */
/* *************************************************************************************** */

	USE sakila;
	
	SELECT fm.title, cat.name, dt.CountofCategory
	FROM film fm 
	INNER JOIN film_category fc ON fc.film_id = fm.film_id
	INNER JOIN category cat ON cat.category_id = fc.category_id
	INNER JOIN 
		(	SELECT COUNT(*) AS CountofCategory, fc.category_id
			FROM film_category fc
			GROUP BY fc.category_id) dt ON dt.category_id = fc.category_id;

/* *************************************************************************************** */
/* (SubQuery Correlated) Problem Statement: Find all the customer's payments which are over their average payment*/
/* *************************************************************************************** */

	SELECT  payment_id, cust.first_name, cust.last_name, amount
	FROM payment pt INNER JOIN customer cust ON cust.customer_id = pt.customer_id
	WHERE amount < (SELECT AVG(amount)
					FROM payment pt1
					WHERE pt1.customer_id = pt.customer_id)
	ORDER BY cust.customer_id;
















