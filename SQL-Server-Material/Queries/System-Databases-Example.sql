
	
SELECT * FROM [INFORMATION_SCHEMA].[TABLES];

SELECT * FROM [sys].[databases]

-- Cannot drop the database 'master' because it is a system database.

	DROP DATABASE [master];

-- Option 'OFFLINE' cannot be set in database 'master'.

	ALTER DATABASE [master]
	SET OFFLINE;

-- Cannot change the name of the system database master.

	ALTER DATABASE [master]
	MODIFY Name = masterdb;

-- Cannot change the owner of the master, model, tempdb or distribution database.

	EXEC sp_changedbowner 'king';

-- System Stored Procedures

	EXEC [sys].[sp_help] '[dbo].[spt_monitor]'

	EXEC [sys].[sp_rename] 'old-name', 'new-name';

	EXEC [sys].[sp_renamedb] 'old-name', 'new-name';
	
/* **************************************************** */

	CREATE DATABASE [ECommerceDB]
	ON PRIMARY
		(NAME=N'ECommerceDB', FILENAME=N'D:\Nexturn-SQL-Server-DBA-Training\ECommercedb.mdf',
		SIZE=65536KB, FILEGROWTH=131072KB)
	LOG ON
		(NAME=N'ECommerceDB_log', FILENAME=N'D:\Nexturn-SQL-Server-DBA-Training\ECommercedb_log.ldf',
		SIZE=65536KB, FILEGROWTH=131072KB)
	GO

/* **************************************************** */

	
-- DMV sys.database_files and sys.master_files fo configure the Size:

	SELECT file_id, name, type_desc, size*8/1024 [TempSizeInMB]
	FROM sys.master_files
	WHERE DB_NAME(database_id) = 'tempdb'
	ORDER BY type_desc DESC;

	SELECT file_id, name, type_desc, size*8/1024 [TempSizeInMB]
	FROM tempdb.sys.database_files
	ORDER BY type_desc DESC;

-- File up the Database

	CREATE TABLE #SampleData
	(Column1 CHAR(3000) DEFAULT 'A',
	Column2 CHAR(3000) DEFAULT 'B')

	SET NOCOUNT ON;
	DECLARE @i INT = 1;
	BEGIN TRAN
		WHILE @i <= 10000000
		BEGIN
			insert into #SampleData DEFAULT VALUES
			SET @i = @i + 1
		END
	COMMIT TRAN

-- 

	SELECT file_id, name, type_desc, size*8/1024 [TempSizeInMB]
	FROM tempdb.sys.database_files
	ORDER BY type_desc DESC;

-- Restart SQL Server Service and Run the below command: 

	SELECT file_id, name, type_desc, size*8/1024 [TempSizeInMB]
	FROM tempdb.sys.database_files
	ORDER BY type_desc DESC;

-- Global Allocation Map (GAM):

		GAM (Global Allocation Map) has a bit for every extent.
		If the bit is 1, means extent is tree.
		If the bit is 0, means extent is in use.
		A GAM can hold information of 64000 extents.
		
-- Shared Global Allocation Map (SGAM)

		If the bit is 1, It has at least one free to allocated.
		If the bit is 0, It doesnt have extent used or page being used.
		

-- To view Page Details:

	USE AdventureWorks2022;

	SELECT page_type, page_type_desc
	FROM sys.dm_db_database_page_allocations
		(
			DB_ID('AdventureWorks2022') , OBJECT_ID('Production.Productphoto'),
			NULL, NULL, 'DETAILED'
		)
		GROUP BY page_type, page_type_desc
	GO

	DBCC IND('AdventureWorks2022', 'Production.Productphoto', -1) WITH NO_INFOMSGS
	GO


		







		