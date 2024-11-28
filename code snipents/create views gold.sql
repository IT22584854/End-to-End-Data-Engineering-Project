-------------------------
--CREATE VIEW CALENDER--
-------------------------
CREATE VIEW gold.calender
AS
SELECT
     *
FROM 
    OPENROWSET(
                BULK 'https://awstoragedatalakesh.dfs.core.windows.net/silver/AdventureWorks_Calendar',
                FORMAT = 'PARQUET'

    ) AS QUERY1

-------------------------
--CREATE VIEW CUSTOMERS--
-------------------------
CREATE VIEW gold.customers
AS
SELECT
    *
FROM
    OPENROWSET(
                BULK 'https://awstoragedatalakesh.dfs.core.windows.net/silver/AdventureWorks_Customers',
                FORMAT = 'PARQUET'
    )AS QUERY1

-------------------------
--CREATE VIEW Product SubCat--
-------------------------
CREATE VIEW gold.subcat
AS
SELECT
    *
FROM
    OPENROWSET(
                BULK 'https://awstoragedatalakesh.dfs.core.windows.net/silver/AdventureWorks_Product_Subcategories',
                FORMAT = 'PARQUET'
    )AS QUERY1

-------------------------
--CREATE VIEW Product--
-------------------------
CREATE VIEW gold.products
AS 
SELECT
    *
FROM
    OPENROWSET(
        BULK 'https://awstoragedatalakesh.dfs.core.windows.net/silver/AdventureWorks_Products',
        FORMAT = 'PARQUET'
    )AS QUERY1

-------------------------
--CREATE VIEW Returns--
-------------------------
CREATE VIEW gold.returns
AS 
SELECT
    *
FROM
    OPENROWSET(
        BULK 'https://awstoragedatalakesh.dfs.core.windows.net/silver/AdventureWorks_Returns',
        FORMAT = 'PARQUET'
    )AS QUERY1

-------------------------
--CREATE VIEW Sales--
-------------------------
CREATE VIEW gold.sales
AS 
SELECT
    *
FROM
    OPENROWSET(
        BULK 'https://awstoragedatalakesh.dfs.core.windows.net/silver/AdventureWorks_Sales',
        FORMAT = 'PARQUET'
    )AS QUERY1

-------------------------
--CREATE VIEW Territories--
-------------------------
CREATE VIEW gold.territories
AS 
SELECT
    *
FROM
    OPENROWSET(
        BULK 'https://awstoragedatalakesh.dfs.core.windows.net/silver/AdventureWorks_Territories',
        FORMAT = 'PARQUET'
    )AS QUERY1