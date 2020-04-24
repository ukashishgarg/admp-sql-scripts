USE [CrimeInLondon_DataWareHouse]
GO

-- Question 01: What was the total count of crimes in each month between 2017 to 2019 per borough, sub-borough and location?
CREATE TABLE [dbo].[FactLondonCrime01](
	[Time_ID] [int] NULL,
	[Borough_ID] [int] NULL,
	[Sub_borough_ID] [int] NULL,
	[Location_ID] [int] NULL,
	[Crime_count] [int] NULL
) ON [PRIMARY]
GO

-- Question 02a: What were the counts of different crime outcomes for the crimes committed in the month of January 2017?
-- Question 02b: What were the outcome status of total crimes registered during the month of January in each years 2017, 2018 and 2019 respectively?
-- drop table [FactLondonCrime02]
CREATE TABLE [dbo].[FactLondonCrime02](
	[Time_ID] [int] NULL,
	[Outcome_type_ID] [int] NULL,
	[Crime_status_ID] [int] NULL,
	[Crime_count] [int] NULL
) ON [PRIMARY]
GO

-- Question  03: Which month had the maximum crimes in three consecutive years from 2017 to 2019?
-- drop table FactLondonCrime03
CREATE TABLE [dbo].[FactLondonCrime03](
	[Time_ID] [int] NULL,
	[Crime_count] [int] NULL
) ON [PRIMARY]
GO

-- Question 04: Which were the top 10 crime types for the crimes committed during 2017 to 2019 in the month of October? 
-- drop table FactLondonCrime04
CREATE TABLE [dbo].[FactLondonCrime04](
	[Time_ID] [int] NULL,
	[Crime_type_ID] [int] NULL,
	[Crime_count] [int] NULL
) ON [PRIMARY]
GO

-- Question 05: Which borough and location had a maximum crimes during October month from 2017 to 2019 for crime type 'Violence and sexual offences'?
-- drop table FactLondonCrime05
CREATE TABLE [dbo].[FactLondonCrime05](
	[Time_ID] [int] NULL,
	[Borough_ID] [int] NULL,
	[Location_ID] [int] NULL,
	[Crime_type_ID] [int] NULL,
	[Crime_count] [int] NULL
) ON [PRIMARY]
GO

-- ***************************** SELECT QUERY TO POPULATE DIFFERENT FACT TABLES *********************
-- Query to fill FactLondonCrime01
select DISTINCT dimTime.Time_ID, dimBorough.Borough_ID, dimSubBorough.Sub_borough_ID, dimLocation.Location_ID, COUNT(*) as  Total_crime_count
from StageLondonCrime as stage
join DimTime as dimTime on dimTime.Time_ID = stage.Time_ID
join DimBorough as dimBorough on dimBorough.Borough_ID = stage.Borough_ID  
join DimSubBorough as dimSubBorough on dimSubBorough.Sub_borough_ID = stage.Sub_borough_ID  
join DimLocation as dimLocation on dimLocation.Location_ID = stage.Location_ID
GROUP BY dimTime.Time_ID, dimBorough.Borough_ID, dimSubBorough.Sub_borough_ID, dimLocation.Location_ID         
ORDER BY dimTime.Time_ID DESC

-- Query to fill FactLondonCrime02
select DISTINCT dimTime.Time_ID, dimOutcomeType.Outcome_type_ID, dimCrimeStatus.Crime_status_ID, COUNT(*) as  Total_crime_count
from StageLondonCrime as stage
join DimTime as dimTime on dimTime.Time_ID = stage.Time_ID
join DimOutcomeType as dimOutcomeType on dimOutcomeType.Outcome_type_ID = stage.Outcome_type_ID  
join DimCrimeStatus as dimCrimeStatus on dimCrimeStatus.Crime_status_ID = stage.Crime_status_ID  
GROUP BY dimTime.Time_ID, dimOutcomeType.Outcome_type_ID, dimCrimeStatus.Crime_status_ID        
ORDER BY dimTime.Time_ID DESC

-- Query to fill FactLondonCrime03
select DISTINCT dimTime.Time_ID, COUNT(*) as  Total_crime_count
from StageLondonCrime as stage
join DimTime as dimTime on dimTime.Time_ID = stage.Time_ID
GROUP BY dimTime.Time_ID
ORDER BY dimTime.Time_ID

-- Query to fill FactLondonCrime04
select DISTINCT dimTime.Time_ID, dimCrimeType.Crime_type_ID, COUNT(*) as  Crime_cnt
from StageLondonCrime as stage
join DimTime as dimTime on dimTime.Time_ID = stage.Time_ID
join DimCrimeType as dimCrimeType on dimCrimeType.Crime_type_ID = stage.Crime_type_ID
GROUP BY dimTime.Time_ID, dimCrimeType.Crime_type_ID
ORDER BY Crime_cnt DESC

-- Query to fill FactLondonCrime05
select DISTINCT dimTime.Time_ID, dimBorough.Borough_ID, dimLocation.Location_ID, dimCrimeType.Crime_type_ID, COUNT(*) as  Total_crime_count
from StageLondonCrime as stage
join DimTime as dimTime on dimTime.Time_ID = stage.Time_ID
join DimBorough as dimBorough on dimBorough.Borough_ID = stage.Borough_ID  
join DimLocation as dimLocation on dimLocation.Location_ID = stage.Location_ID
join DimCrimeType as dimCrimeType on dimCrimeType.Crime_type_ID = stage.Crime_type_ID
GROUP BY dimTime.Time_ID, dimBorough.Borough_ID, dimLocation.Location_ID, dimCrimeType.Crime_type_ID         
ORDER BY dimTime.Time_ID DESC

