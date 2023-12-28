---------------------------------------------------------------------------------------
------------------------ DATA CLEANING ------------------------------------------------
---------------------------------------------------------------------------------------

-- 1. Check the table
select * from RealEstate;

-- 2. Check for datatypes and size
EXEC sp_columns 'RealEstate';

-- 3. Check for any missing values      -no missing values
SELECT
    COUNT(CASE WHEN price IS NULL THEN 1 END) AS Missing_date,
	COUNT(CASE WHEN price IS NULL THEN 1 END) AS Missing_price,
    COUNT(CASE WHEN bedrooms IS NULL THEN 1 END) AS Missing_bedrooms, 
    COUNT(CASE WHEN bathrooms IS NULL THEN 1 END) AS Missing_bathrooms,
	COUNT(CASE WHEN sqft_living IS NULL THEN 1 END) AS Missing_sqft_living,
    COUNT(CASE WHEN sqft_lot IS NULL THEN 1 END) AS Missing_sqft_lot,
    COUNT(CASE WHEN floors IS NULL THEN 1 END) AS Missing_floors,
    COUNT(CASE WHEN waterfront IS NULL THEN 1 END) AS Missing_waterfront,
    COUNT(CASE WHEN [view] IS NULL THEN 1 END) AS Missing_view,
    COUNT(CASE WHEN condition IS NULL THEN 1 END) AS Missing_condition,
    COUNT(CASE WHEN sqft_above IS NULL THEN 1 END) AS Missing_sqft_above,
    COUNT(CASE WHEN sqft_basement IS NULL THEN 1 END) AS Missing_sqft_basement,
    COUNT(CASE WHEN yr_built IS NULL THEN 1 END) AS Missing_yr_built,
    COUNT(CASE WHEN yr_renovated IS NULL THEN 1 END) AS Missing_yr_renovated,
    COUNT(CASE WHEN street IS NULL THEN 1 END) AS Missing_street,
    COUNT(CASE WHEN city IS NULL THEN 1 END) AS Missing_city,
    COUNT(CASE WHEN statezip IS NULL THEN 1 END) AS Missing_statezip,
    COUNT(CASE WHEN country IS NULL THEN 1 END) AS Missing_country
FROM RealEstate;

-- 4. Check for anomalies or outliers
SELECT
    MAX(price) AS MaxValue,
	MIN(price) AS MinValue   --we have a zero, we need to check if theres more
FROM RealEstate;

-- 5. Check for more we use TOP  -we found 49 entries with the value "0", however we should delete anything below 100k
SELECT TOP 100 Price 
FROM RealEstate
ORDER BY Price ASC;

-- 6. To delete rows with the price under 100k
Delete from RealEstate
Where price < 100000;

-- lets check 5 again   --deletes anything below 100k

-- 7. Distinct values for country
SELECT country, COUNT(*)
FROM RealEstate
GROUP BY country
ORDER BY COUNT(*) DESC;


------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------EDA-------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------

-- Average values 
SELECT ROUND(AVG(price), 2) AS avg_price,
       ROUND(AVG(bedrooms), 2) AS avg_bedrooms,
       ROUND(AVG(bathrooms), 2) AS avg_bathrooms,
       ROUND(AVG(sqft_living), 2) AS avg_sqft_living,
       ROUND(AVG(sqft_lot), 2) AS avg_sqft_lot
FROM RealEstate;

-- Min and Max values
SELECT MIN(price) AS min_price,
       MAX(price) AS max_price,
       MIN(bedrooms) AS min_bedrooms,
       MAX(bedrooms) AS max_bedrooms,
       MIN(bathrooms) AS min_bathrooms,
       MAX(bathrooms) AS max_bathrooms,
       MIN(sqft_living) AS min_sqft_living,
       MAX(sqft_living) AS max_sqft_living,
       MIN(sqft_lot) AS min_sqft_lot,
       MAX(sqft_lot) AS max_sqft_lot
FROM RealEstate;

-- Average price per city from highest to lowest
Select city, COUNT(*) as NumberOfHouses, Round(AVG(Price), 0) as AveragePricePerCity
from RealEstate
group by city
Order by AVG(Price) DESC;

-- Query counts the frequency of each unique value in the "bedrooms" column
SELECT condition, COUNT(*) AS frequency
FROM RealEstate
GROUP BY condition
ORDER BY condition;

-- Average price for house each month
SELECT
    YEAR(date) AS year,
    MONTH(date) AS month,
    ROUND(AVG(price), 2) AS average_price
FROM RealEstate
GROUP BY YEAR(date), MONTH(date)
ORDER BY year, month;

-- Amount of houses per city
SELECT city, COUNT(*) AS house_count
FROM RealEstate
GROUP BY city
ORDER BY house_count DESC;

-- Amount of houses per statezip
SELECT statezip, COUNT(*) AS house_count
FROM RealEstate
GROUP BY statezip
ORDER BY house_count DESC;

-- Each city with bedrooms
SELECT city, bedrooms, COUNT(*) AS house_count
FROM RealEstate
GROUP BY city, bedrooms
ORDER BY city, bedrooms;


-- check top 10 prices
SELECT TOP 10 Price
FROM RealEstate
ORDER BY Price DESC;


-- Real Estate Price Range and Property Features Analysis
SELECT 
    CASE
        WHEN Price BETWEEN 100000 AND 249999 THEN '100k-249k'
        WHEN Price BETWEEN 250000 AND 499999 THEN '250k-499k'
        WHEN Price BETWEEN 500000 AND 749999 THEN '500k-749k'
        WHEN Price BETWEEN 750000 AND 999999 THEN '750k-999k'
        WHEN Price BETWEEN 1000000 AND 1249999 THEN '1,000k-1,249k'
        WHEN Price BETWEEN 1250000 AND 1499999 THEN '1,250k-1,499k'
        WHEN Price BETWEEN 1500000 AND 1749999 THEN '1,500k-1,749k'
        WHEN Price BETWEEN 1750000 AND 1999999 THEN '1,750k-1,999k'
        WHEN Price BETWEEN 2000000 AND 2249999 THEN '2,000k-2,249k'
        WHEN Price BETWEEN 2250000 AND 2499999 THEN '2,250k-2,499k'
        WHEN Price BETWEEN 2500000 AND 2749999 THEN '2,500k-2,749k'
        WHEN Price BETWEEN 2750000 AND 2999999 THEN '2,750k-2,999k'
        WHEN Price >= 3000000 THEN 'More than 3,000k'
    END AS PriceRange,
	COUNT(*) AS NumberofHomes,
	ROUND(AVG(Condition), 1) AS AvgCondition,
    ROUND(AVG(Bathrooms), 1) AS AvgBathrooms,
    ROUND(AVG(Bedrooms), 1) AS AvgBedrooms,
	ROUND(AVG(sqft_living), 0) AS AvgSqftLiving,
	ROUND(AVG(sqft_lot), 0) AS AvgSqftLot,
	ROUND(AVG(sqft_above), 0) AS AvgSqftBasement,
	ROUND(AVG(sqft_basement), 0) AS AvgSqftBasement,
    MIN(Price) AS MinPrice 
FROM RealEstate
WHERE Price BETWEEN 100000 AND 5000000
GROUP BY 
    CASE
        WHEN Price BETWEEN 100000 AND 249999 THEN '100k-249k'
        WHEN Price BETWEEN 250000 AND 499999 THEN '250k-499k'
        WHEN Price BETWEEN 500000 AND 749999 THEN '500k-749k'
        WHEN Price BETWEEN 750000 AND 999999 THEN '750k-999k'
        WHEN Price BETWEEN 1000000 AND 1249999 THEN '1,000k-1,249k'
        WHEN Price BETWEEN 1250000 AND 1499999 THEN '1,250k-1,499k'
        WHEN Price BETWEEN 1500000 AND 1749999 THEN '1,500k-1,749k'
        WHEN Price BETWEEN 1750000 AND 1999999 THEN '1,750k-1,999k'
        WHEN Price BETWEEN 2000000 AND 2249999 THEN '2,000k-2,249k'
        WHEN Price BETWEEN 2250000 AND 2499999 THEN '2,250k-2,499k'
        WHEN Price BETWEEN 2500000 AND 2749999 THEN '2,500k-2,749k'
        WHEN Price BETWEEN 2750000 AND 2999999 THEN '2,750k-2,999k'
        WHEN Price >= 3000000 THEN 'More than 3,000k'
    END
ORDER BY MIN(Price);

-- Houses built 1950 or earlier
Select COUNT(*) AS HousesBuiltin1950orEarlier
from RealEstate
Where yr_built <= 1950

-- Houses renovated in the last 30 years
Select *
From RealEstate
Where yr_renovated between 1993 and 2023

-- Which houses has a waterfront
select *
from RealEstate
where waterfront >= 1




