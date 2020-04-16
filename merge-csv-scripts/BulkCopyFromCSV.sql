-- Before anything perform below steps while importing data from CSV file for Jan2017CityOfLondonOutcomes
-- 1. Make LSOA_code as type nvarchar(50)
-- 2. Make all fields to allow null values
-- 3. Change Outcome_type to nvarchar(1000)

-- ************************** Jan2017CityOfLondonOutcomes *******************************
select * from CityOfLondonOutcomes

select Outcome_type, LSOA_code, LSOA_name from CityOfLondonOutcomes
--delete from CityOfLondonOutcomes

select COUNT(*) from CityOfLondonOutcomes
where Month like '2017-01'

select COUNT(*) from CityOfLondonOutcomes
where Month like '2017-02'

--COPY CityOfLondonOutcomes 
--FROM 'C:\CloudDrives\OneDrive\SHUBigData\Semester_02\ADMP\Assessment_01\Dataset\UK Police Data\2017\2017-02-city-of-london-outcomes.csv' DELIMITER ',';

--DECLARE @i INT 
--DECLARE @monthcnt INT
--DECLARE @path VARCHAR(100)
--DECLARE @name1 VARCHAR(10)
--DECLARE @name2 VARCHAR(50)

--SET @path = 'C:\CloudDrives\OneDrive\SHUBigData\Semester_02\ADMP\Assessment_01\Dataset\UK Police Data\2017\'
--SET @name1 ='2017-0'
--SET @name2 ='-city-of-london-outcomes.csv'
--SET @i = 1
--SET @monthcnt = 13
--DECLARE @filename VARCHAR(50) 
--SET @filename = @name1+CAST(@i AS varchar)+@name2

--WHILE (@i<>@monthcnt)
--	BEGIN		
--		BULK INSERT CityOfLondonOutcomes
--		FROM (@filename)
--		WITH
--		(
--			FIRSTROW = 2,
--			FIELDTERMINATOR = ',',  --CSV field delimiter
--			ROWTERMINATOR = '\n',   --Use to shift the control to next row
--			TABLOCK
--		)

--		SET @i = @i+1;
--	END

BULK INSERT CityOfLondonOutcomes
FROM 'C:\CloudDrives\OneDrive\SHUBigData\Semester_02\ADMP\Assessment_01\Dataset\UK Police Data\2017\2017-12-city-of-london-outcomes.csv'
WITH
(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',  --CSV field delimiter
	ROWTERMINATOR = '\n',   --Use to shift the control to next row
	TABLOCK
)

-- YEAR 2018
BULK INSERT CityOfLondonOutcomes
FROM 'C:\CloudDrives\OneDrive\SHUBigData\Semester_02\ADMP\Assessment_01\Dataset\UK Police Data\2018\2018-12-city-of-london-outcomes.csv'
WITH
(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',  --CSV field delimiter
	ROWTERMINATOR = '\n',   --Use to shift the control to next row
	TABLOCK
)

-- YEAR 2019
BULK INSERT CityOfLondonOutcomes
FROM 'C:\CloudDrives\OneDrive\SHUBigData\Semester_02\ADMP\Assessment_01\Dataset\UK Police Data\2019\2019-12-city-of-london-outcomes.csv'
WITH
(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',  --CSV field delimiter
	ROWTERMINATOR = '\n',   --Use to shift the control to next row
	TABLOCK
)

-- ************************** CityOfLondonStopAndSearch *******************************
select * from CityOfLondonStopAndSearch
--delete from CityOfLondonStopAndSearch

BULK INSERT CityOfLondonStopAndSearch
FROM 'C:\CloudDrives\OneDrive\SHUBigData\Semester_02\ADMP\Assessment_01\Dataset\UK Police Data\2017\2017-12-city-of-london-stop-and-search.csv'
WITH
(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',  --CSV field delimiter
	ROWTERMINATOR = '\n',   --Use to shift the control to next row
	TABLOCK
)

-- YEAR 2018
BULK INSERT CityOfLondonStopAndSearch
FROM 'C:\CloudDrives\OneDrive\SHUBigData\Semester_02\ADMP\Assessment_01\Dataset\UK Police Data\2018\2018-12-city-of-london-stop-and-search.csv'
WITH
(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',  --CSV field delimiter
	ROWTERMINATOR = '\n',   --Use to shift the control to next row
	TABLOCK
)

-- YEAR 2019
BULK INSERT CityOfLondonStopAndSearch
FROM 'C:\CloudDrives\OneDrive\SHUBigData\Semester_02\ADMP\Assessment_01\Dataset\UK Police Data\2019\2019-12-city-of-london-stop-and-search.csv'
WITH
(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',  --CSV field delimiter
	ROWTERMINATOR = '\n',   --Use to shift the control to next row
	TABLOCK
)

-- ************************** CityOfLondonStreet *******************************
select * from CityOfLondonStreet
--delete from CityOfLondonStreet

BULK INSERT CityOfLondonStreet
FROM 'C:\CloudDrives\OneDrive\SHUBigData\Semester_02\ADMP\Assessment_01\Dataset\UK Police Data\2017\2017-12-city-of-london-street.csv'
WITH
(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',  --CSV field delimiter
	ROWTERMINATOR = '\n',   --Use to shift the control to next row
	TABLOCK
)

-- 2018
BULK INSERT CityOfLondonStreet
FROM 'C:\CloudDrives\OneDrive\SHUBigData\Semester_02\ADMP\Assessment_01\Dataset\UK Police Data\2018\2018-12-city-of-london-street.csv'
WITH
(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',  --CSV field delimiter
	ROWTERMINATOR = '\n',   --Use to shift the control to next row
	TABLOCK
)

-- 2019
BULK INSERT CityOfLondonStreet
FROM 'C:\CloudDrives\OneDrive\SHUBigData\Semester_02\ADMP\Assessment_01\Dataset\UK Police Data\2019\2019-12-city-of-london-street.csv'
WITH
(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',  --CSV field delimiter
	ROWTERMINATOR = '\n',   --Use to shift the control to next row
	TABLOCK
)
