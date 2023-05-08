/*

Cleaning Data in SQL Queries using BigQuery

*/


SELECT *
FROM sales.sales_info
LIMIT 10;

--------------------------------------------------------------------------------------------------------------------------

**********Identify and remove duplicates**********

-- Count the total number of rows in the table
SELECT COUNT(*) AS total_rows
FROM sales.sales_info;

-- Count the number of distinct rows in the table
SELECT COUNT(*) as num_distinct_rows
FROM (
SELECT DISTINCT *
FROM sales.sales_info
)

—- Remove duplicates

CREATE TABLE
sales.sales_info_clean AS
SELECT DISTINCT *
FROM
sales.sales_info

**********Check for missing values**********

-- Check for missing values
SELECT
COUNT(*) AS num_rows,
COUNTIF(SalesId IS NULL) AS missing_sales_id,
COUNTIF(StoreId IS NULL) AS missing_store_id,
COUNTIF(ProductId IS NULL) AS missing_product_id,
COUNTIF(Date IS NULL) AS missing_date,
COUNTIF(UnitPrice IS NULL) AS missing_unit_price,
COUNTIF(Quantity IS NULL) AS missing_quantity
FROM
sales.sales_info

-- Drop rows with missing values
CREATE OR REPLACE TABLE
sales.sales_info_clean AS
SELECT
*
FROM
sales.sales_info_clean
WHERE
SalesId IS NOT NULL
AND StoreId IS NOT NULL
AND ProductId IS NOT NULL
AND Date IS NOT NULL
AND UnitPrice IS NOT NULL
AND Quantity IS NOT NULL;

**********Check for invalid values**********

-- Check for invalid values
SELECT
COUNT(*) AS num_rows,
COUNTIF(Quantity < 0) AS negative_quantity,
COUNTIF(UnitPrice < 0) AS negative_unit_price,
COUNTIF(UnitPrice > 1000) AS excessive_unit_price
FROM
sales.sales_info_clean;

-- Correct invalid values
CREATE OR REPLACE TABLE
sales.sales_info_clean
AS
SELECT
SalesId,
StoreId,
ProductId,
Date,
CASE WHEN Quantity < 0 THEN 0 ELSE Quantity END AS Quantity,
CASE WHEN UnitPrice < 0 OR THEN 0 ELSE UnitPrice END AS UnitPrice
FROM
sales.sales_info_clean;
