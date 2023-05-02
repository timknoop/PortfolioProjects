/*
Cleaning Data in SQL Queries
*/


Select *
FROM cars.car_info

--------------------------------------------------------------------------------------------------------------------------
--Inspect fuel type column

SELECT
  DISTINCT fuel_type
FROM
  cars.car_info;

--Inspect length column
  
SELECT
  MIN(length) AS min_length,
  MAX(length) AS max_length
FROM
  cars.car_info;
  
  
--Fill in missing data

SELECT
  *
FROM
  cars.car_info 
WHERE 
  num_of_doors IS NULL;
  
  
UPDATE
  cars.car_info
SET
  num_of_doors = "four"
WHERE
  make = "dodge"
  AND fuel_type = "gas"
  AND body_style = "sedan";
  
  
--Identify potential errors

SELECT
  DISTINCT num_of_cylinders
FROM
  cars.car_info;
  
  
UPDATE
  cars.car_info
SET
  num_of_cylinders = "two"
WHERE
  num_of_cylinders = "tow";
  
  
SELECT
  MIN(compression_ratio) AS min_compression_ratio,
  MAX(compression_ratio) AS max_compression_ratio
FROM
  cars.car_info;
  
 
SELECT
  MIN(compression_ratio) AS min_compression_ratio,
  MAX(compression_ratio) AS max_compression_ratio
FROM
  cars.car_info
WHERE
  compression_ratio <> 70;
  
 
SELECT
   COUNT(*) AS num_of_rows_to_delete
FROM
   cars.car_info
WHERE
   compression_ratio = 70;
   
  
DELETE cars.car_info
WHERE compression_ratio = 70;


--Ensure consistency

SELECT
  DISTINCT drive_wheels
FROM
  cars.car_info;
  
 
SELECT
  DISTINCT drive_wheels,
  LENGTH(drive_wheels) AS string_length
FROM
  cars.car_info;
  
  
UPDATE
  cars.car_info
SET
  drive_wheels = TRIM(drive_wheels)
WHERE TRUE;
