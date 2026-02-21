/*
----------------------------------------------------
Create Database and Schemas
----------------------------------------------------

Purpose:
This script creates a database named 'DataWarehouse'.
If it already exists, it will be dropped and created again.
It also creates three schemas: bronze, silver, and gold.

Warning:
Running this script will delete the entire
'DataWarehouse' database if it exists.
All data will be permanently removed.
Make sure you have a backup before running it.
----------------------------------------------------
*/

USE master;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
