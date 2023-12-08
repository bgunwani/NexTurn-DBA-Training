
-- Managing Tables (DDL Commands) - CREATE, ALTER, DROP

	CREATE TABLE Users
	(UserId INT PRIMARY KEY AUTO_INCREMENT,		// Column Level Constraint
	Name VARCHAR(200) NOT NULL,
	DateOfBirth DATETIME DEFAULT CURRENT_TIMESTAMP);
	
	CREATE TABLE Product
	(ProductId INT PRIMARY KEY AUTO_INCREMENT,
	Name VARCHAR(200) NOT NULL,
	Price DEC(5,2),
	Quantity INT,
	CHECK (Price > 10000));						// Table Level Constraint
	
	