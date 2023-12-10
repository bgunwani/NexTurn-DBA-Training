
-- ASCII - Return numeric value of left-most character

	SELECT ASCII('a'), ASCII('A');

-- CHAR() - Return the character for each integer passed

	SELECT CHAR(77,121,83,81,76);
	SELECT CHAR(65);

-- LENGTH() - Return the length of a string in bytes

	SELECT LENGTH('Hello World'), LENGTH('HelloWorld  ');

-- CONCAT() - Return concatenated string

	SELECT CONCAT('Hello', 'World', '!!');
	SELECT CONCAT('Hello', NULL, 'World');

-- LCASE() -Return the argument in lowercase - Synonym for LOWER()

	SELECT LCASE('Hello'), LOWER('World');

-- UCASE() -Return the argument in uppercase - Synonym for UPPER()

	SELECT UCASE('Hello'), UPPER('World');

-- LEFT() - Return the leftmost number of characters as specified

	SELECT LEFT('Hello', 4), LEFT('World', 3);

-- RIGHT()- Return the specified rightmost number of characters
	
	SELECT RIGHT('Hello', 4), RIGHT('World', 3);

-- RTRIM() - Remove trailing spaces

	SELECT RTRIM('   HelloWorld   '), LENGTH(RTRIM('   HelloWorld   '));

-- LTRIM() - Remove leading spaces
	
	SELECT LTRIM('   HelloWorld   '), LENGTH(LTRIM('   HelloWorld   '));

-- TRIM() - Remove leading and trailing spaces

	SELECT TRIM('   HelloWorld   '), LENGTH(TRIM('   HelloWorld   '));

-- STRCMP() returns 0 if the strings are the same
-- -1 if the first argument is smaller than the second according to the current sort order
-- 1 if the first argument is larger than the second according to the current sort order

	SELECT 	STRCMP('HelloWorld', 'Hello'), 
	STRCMP('Hello', 'HelloWorld'), 
	STRCMP('HelloWorld', 'HelloWorld');

-- REVERSE() - Reverse the characters in a string

	SELECT REVERSE('HelloWorld');

-- Table Column
	
	SELECT 	CONCAT(first_name, ' ', last_name) AS Full_Name,
		REVERSE(CONCAT(first_name, ' ', last_name)) AS RFull_Name
	FROM sakila.actor;























