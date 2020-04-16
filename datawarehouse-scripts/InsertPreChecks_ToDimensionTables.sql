USE CrimeInLondon_DataWareHouse
select top 5 * from StageLondonCrime

-- LOCATION DIMENSION PRE-CHECKS
-- Check location dimension unique values (There are 60,191 unique locations)
SELECT DISTINCT Latitude, Longitude, Location
FROM StageLondonCrime
group by Latitude, Longitude, Location

-- Check if the records got populated to DimLocations 
SELECT * 
FROM DimLocation

SELECT loc.Location_ID, stage.Longitude, stage.Latitude, stage.Location, stage.Crime_ID
from DimLocation as loc
join StageLondonCrime as stage 
on (loc.Longitude = stage.Longitude and
	loc.Latitude = stage.Latitude and
	loc.Location = stage.Location)

UPDATE stage
SET stage.Location_ID = loc.LocationID
FROM StageLondonCrime AS stage 
INNER JOIN  DimLocation AS loc ON (loc.Longitude = stage.Longitude AND loc.Latitude = stage.Latitude AND loc.Location = stage.Location)

select top 5 * from StageLondonCrime
select * from DimLocation

--------------------------------------- ADDRESS DIMENSION PRE-CHECKS -------------------------------------------
---- Check if DimAddress is empty or not. Initially it should be empty
--select * from DimAddress

---- Query to retrieve address data from staging table to populate Address dimension table (DimAddress) (Returns 4831 records)
--SELECT DISTINCT LSOA_code, LSOA_name, Borough_name
--FROM StageLondonCrime
--GROUP BY LSOA_code, LSOA_name, Borough_name

---- Query to update Address_ID in staging table post populating Address dimension table (DimAddress)
--UPDATE stage
--SET stage.Address_ID = addr.Address_ID
--FROM StageLondonCrime AS stage 
--INNER JOIN  DimAddress AS addr 
--ON (stage.LSOA_code = addr.LSOA_code 
--	AND stage.LSOA_name = addr.LSOA_name 
--	AND stage.Borough_name = addr.Borough_name)

---- Check if DimAddress is filled with data or not. Finally it should be filled.
--select * from DimAddress
--select top 5 * from StageLondonCrime

------------------------------------- BOROUGH DIMENSION PRE-CHECKS -------------------------------------------
-- Check if DimBorough is empty or not. Initially it should be empty
select * from DimBorough

-- Query to retrieve address data from staging table to populate Address dimension table (DimBorough) (Returns 33 records)
SELECT DISTINCT Borough_name
FROM StageLondonCrime
ORDER BY Borough_name

-- Query to update Borough_ID in staging table post populating Address dimension table (DimBorough)
UPDATE stage
SET stage.Borough_ID = boroughDim.Borough_ID
FROM StageLondonCrime AS stage 
INNER JOIN DimBorough AS boroughDim 
ON (stage.Borough_name = boroughDim.Borough_name) 

-- Check if DimAddress is filled with data or not. Finally it should be filled.
select * from DimBorough
select top 5 Borough_ID from StageLondonCrime

------------------------------------- SUB BOROUGH DIMENSION PRE-CHECKS -------------------------------------------
-- Check if DimSubBorough is empty or not. Initially it should be empty
select * from DimSubBorough

-- Query to retrieve address data from staging table to populate Address dimension table (DimSubBorough) (Returns 4831 records)
SELECT DISTINCT LSOA_code, LSOA_name
FROM StageLondonCrime
GROUP BY LSOA_code, LSOA_name

-- Query to update Sub_borough_ID in staging table post populating Address dimension table (DimSubBorough)
UPDATE stage
SET stage.Sub_borough_ID = subBoroughDim.Sub_borough_ID
FROM StageLondonCrime AS stage 
INNER JOIN  DimSubBorough AS subBoroughDim 
ON (stage.LSOA_code = subBoroughDim.LSOA_code 
	AND stage.LSOA_name = subBoroughDim.LSOA_name)

-- Check if DimSubBorough is filled with data or not. Finally it should be filled.
select * from DimSubBorough
select top 5 Sub_borough_ID, * from StageLondonCrime

------------------------------------- TIME DIMENSION PRE-CHECKS -------------------------------------------
-- Check if DimTime is empty or not. Initially it should be empty
select * from DimTime

-- Query to retrieve address data from staging table to populate Time dimension table (DimTime) - Should be 36
SELECT DISTINCT Month, Year
FROM StageLondonCrime
GROUP BY Month, Year
ORDER BY Year, Month

-- Query to update Time_ID in staging table post populating Time dimension table (DimTime)
UPDATE stage
SET stage.Time_ID = timeDim.Time_ID
FROM StageLondonCrime AS stage 
INNER JOIN  DimTime AS timeDim 
ON (stage.Month = timeDim.Month 
	AND stage.Year = timeDim.Year)

-- Check if DimAddress is filled with data or not. Finally it should be filled.
select * from DimTime
select top 5 * from StageLondonCrime

UPDATE DimTime
  SET Month_name = CASE 
    WHEN Month=1  THEN 'January'
    WHEN Month=2  THEN 'February' 
	WHEN Month=3  THEN 'March'
	WHEN Month=4  THEN 'April'
	WHEN Month=5  THEN 'May'
	WHEN Month=6  THEN 'June'
	WHEN Month=7  THEN 'July'
	WHEN Month=8  THEN 'August'
	WHEN Month=9  THEN 'September'
	WHEN Month=10  THEN 'October'
	WHEN Month=11  THEN 'November'
	WHEN Month=12  THEN 'December'
END;

UPDATE DimTime
  SET Season_name = CASE 
    WHEN Month in (12, 1, 2)  THEN 'Winter'
    WHEN Month in (3,4,5)  THEN 'Spring'
	WHEN Month in (6,7,8)  THEN 'Summer'
	WHEN Month in (9,10,11)  THEN 'Autumn'
END;

------------------------------------- Crime DIMENSION PRE-CHECKS -------------------------------------------
-- Check if DimCrime is empty or not. Initially it should be empty
select * from DimCrime

-- Query to retrieve address data from staging table to populate Outcome type dimension table (DimCrime) 
SELECT DISTINCT Crime_hashcode, Crime_type, Latest_Outcome_type
FROM StageLondonCrime
GROUP BY Crime_hashcode, Crime_type, Latest_Outcome_type


-- Query to update DimCrime in staging table post populating Time dimension table (DimCrime)
UPDATE stage
SET stage.Crime_ID = crimeDim.Crime_ID
FROM StageLondonCrime AS stage 
INNER JOIN  DimCrime AS crimeDim 
ON (stage.Crime_hashcode = crimeDim.Crime_hashcode)

-- Check if DimAddress is filled with data or not. Finally it should be filled.
select * from DimCrime
select top 5 * from StageLondonCrime

------------------------------------- POLICE FORCE DIMENSION PRE-CHECKS -------------------------------------------
-- Check if DimPoliceForce is empty or not. Initially it should be empty
select * from DimPoliceForce

-- Query to retrieve address data from staging table to populate Police force dimension table (DimPoliceForce) 
SELECT DISTINCT Falls_within
FROM StageLondonCrime
ORDER BY Falls_within

-- Query to update DimPoliceForce in staging table post populating Police force dimension table (DimPoliceForce)
UPDATE stage
SET stage.Police_force_ID = policeForceDim.Police_force_ID
FROM StageLondonCrime AS stage 
INNER JOIN  DimPoliceForce AS policeForceDim 
ON (stage.Falls_within = policeForceDim.Police_force)

-- Check if DimPoliceForce is filled with data or not. Finally it should be filled.
select * from DimPoliceForce

------------------------------------- LONDON CRIME FACT PRE-CHECKS -------------------------------------------
-- Check if FactLondonCrime is empty or not. Initially it should be empty
select * from FactLondonCrime

------------------------------------- Crime DIMENSION PRE-CHECKS -------------------------------------------
-- Check if DimCrime is empty or not. Initially it should be empty
select * from DimCrime

-- Query to retrieve DimCrimeType data from staging table to populate DimCrime type dimension table (DimCrimeType) 
SELECT DISTINCT Crime_type
FROM StageLondonCrime
ORDER BY Crime_type

-- Query to update DimCrimeType in staging table post populating Time dimension table (DimCrimeType)
UPDATE stage
SET stage.Crime_type_ID = crimeTypeDim.Crime_type_ID
FROM StageLondonCrime AS stage 
INNER JOIN  DimCrimeType AS crimeTypeDim 
ON (stage.Crime_type = crimeTypeDim.Crime_type)

-- Check if Crime_type is filled with data or not. Finally it should be filled.
select * from DimCrimeType
select top 5 Crime_type_ID,* from StageLondonCrime

------------------------------------- Crime DIMENSION PRE-CHECKS -------------------------------------------
-- Check if DimOutcomeType is empty or not. Initially it should be empty
select * from DimOutcomeType

-- Query to retrieve DimCrimeType data from staging table to populate DimCrime type dimension table (DimCrimeType) 
SELECT DISTINCT Latest_Outcome_type
FROM StageLondonCrime
ORDER BY Latest_Outcome_type

-- Query to update DimOutcomeType in staging table post populating Outcome dimension table (DimOutcomeType)
UPDATE stage
SET stage.Outcome_type_ID = outcomeTypeDim.Outcome_type_ID
FROM StageLondonCrime AS stage 
INNER JOIN  DimOutcomeType AS outcomeTypeDim 
ON (stage.Latest_Outcome_type = outcomeTypeDim.Outcome_type)

-- Check if Outcome_type_ID is filled with data or not. Finally it should be filled.
select * from DimOutcomeType
select top 5 Outcome_type_ID,* from StageLondonCrime

------------------------------------- Fact London Crime DIMENSION PRE-CHECKS -------------------------------------------
-- Check if FactLondonCrime is empty or not. Initially it should be empty
select * from FactLondonCrime

select DISTINCT dimBorough.Borough_ID, dimSubBorough.Sub_borough_ID, dimLocation.Location_ID,dimTime.Time_ID,
       dimPoliceForce.Police_force_ID, dimOutcomeType.Outcome_type_ID, dimCrimeType.Crime_type_ID,
       COUNT(*) as  Total_crime_count
from StageLondonCrime as stage
join DimBorough as dimBorough on dimBorough.Borough_ID = stage.Borough_ID  
join DimSubBorough as dimSubBorough on dimSubBorough.Sub_borough_ID = stage.Sub_borough_ID  
join DimLocation as dimLocation on dimLocation.Location_ID = stage.Location_ID
join DimTime as dimTime on dimTime.Time_ID = stage.Time_ID
join DimPoliceForce as dimPoliceForce on dimPoliceForce.Police_force_ID = stage.Police_force_ID
join DimOutcomeType as dimOutcomeType on dimOutcomeType.Outcome_type_ID = stage.Outcome_type_ID
join DimCrimeType as dimCrimeType on dimCrimeType.Crime_type_ID = stage.Crime_type_ID
GROUP BY dimBorough.Borough_ID, dimSubBorough.Sub_borough_ID, dimLocation.Location_ID,dimTime.Time_ID,
       dimPoliceForce.Police_force_ID, dimOutcomeType.Outcome_type_ID, dimCrimeType.Crime_type_ID
ORDER BY dimBorough.Borough_ID
