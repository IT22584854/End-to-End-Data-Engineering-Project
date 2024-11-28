CREATE MASTER KEY ENCRYPTION BY PASSWORD ='1541247157aA#' 

-- create databse scoped credental--
CREATE DATABASE SCOPED CREDENTIAL cred_rash
WITH    
    IDENTITY = 'Managed Identity'. 

-- creating external data source (eds)
-- we create EDS for url that we use for containers. we have to use 2 EDS. 
--one for Silver container (where we get the data). one for Gold layer (where we put the data)

CREATE EXTERNAL DATA SOURCE source_silver
WITH 
(
    LOCATION = 'https://awstoragedatalakesh.blob.core.windows.net/silver',
    CREDENTIAL = cred_rash
)
-- we have pointed the data source named 'source_silver' to the silver container. now we dont want to use the link again & again
-- to access the data lake , data source has to use credentials .

CREATE EXTERNAL DATA SOURCE source_gold
WITH
(
    LOCATION = 'https://awstoragedatalakesh.blob.core.windows.net/gold',
    CREDENTIAL = cred_rash 
)

--externel file format - defines the structure of the data in an external file
    
CREATE EXTERNAL FILE FORMAT format_parquet
WITH
(
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
)


-- Create external table EXTSALES

CREATE EXTERNAL TABLE gold.extsales
WITH
(
    LOCATION = 'extsales',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)AS
SELECT * FROM gold.sales



SELECT * FROM gold.extsales








