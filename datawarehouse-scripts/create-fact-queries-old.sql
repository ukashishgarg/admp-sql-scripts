-- qryQuestion1: What was the total count of crimes in each month between 2017 to 2019 per borough, sub-borough and location?
select dimTime.Year, dimTime.Month, dimBorough.Borough_name, dimSubBorough.Sub_borough_name, dimLocation.Location,
       sum(factCrimeLondon1.Crime_count) AS SumOfValue 
from FactLondonCrime01 as factCrimeLondon1
join DimTime as dimTime on dimTime.Time_ID = factCrimeLondon1.Time_ID
join DimBorough as dimBorough on dimBorough.Borough_ID = factCrimeLondon1.Borough_ID  
join DimSubBorough as dimSubBorough on dimSubBorough.Sub_borough_ID = factCrimeLondon1.Sub_borough_ID  
join DimLocation as dimLocation on dimLocation.Location_ID = factCrimeLondon1.Location_ID
GROUP BY dimTime.Year, dimTime.Month, dimBorough.Borough_name, dimSubBorough.Sub_borough_name, dimLocation.Location
ORDER BY dimTime.Year, dimTime.Month

-- qryQuestion2
-- What is the outcome status of crimes in each month between 2017 to 2019?
-- query to fill FactTable3
--select dimTime.Month, dimTime.Month_name, dimCrimeStatus.Crime_status, sum(factCrimeLondon2.Crime_count) AS SumOfValue
--from FactLondonCrime02 as factCrimeLondon2
--join DimTime as dimTime on dimTime.Time_ID = factCrimeLondon2.Time_ID
--join DimOutcomeType as dimOutcomeType on dimOutcomeType.Outcome_type_ID = factCrimeLondon2.Outcome_type_ID  
--join DimCrimeStatus as dimCrimeStatus on dimCrimeStatus.Crime_status_ID = factCrimeLondon2.Crime_status_ID  
--GROUP BY dimTime.Month, dimTime.Month_name, dimCrimeStatus.Crime_status
--ORDER BY dimTime.Month

-- qryQuestion2
-- What are the counts of different crime outcomes committed in the month of January 2017?
select dimTime.Year, dimTime.Month_name, dimOutcomeType.Outcome_type, sum(factCrimeLondon2.Crime_count) AS SumOfValue
from FactLondonCrime02 as factCrimeLondon2
join DimTime as dimTime on dimTime.Time_ID = factCrimeLondon2.Time_ID
join DimOutcomeType as dimOutcomeType on dimOutcomeType.Outcome_type_ID = factCrimeLondon2.Outcome_type_ID  
--join DimCrimeStatus as dimCrimeStatus on dimCrimeStatus.Crime_status_ID = factCrimeLondon2.Crime_status_ID  
where dimTime.Time_ID = 201701 
GROUP BY dimTime.Year, dimTime.Month_name,  dimOutcomeType.Outcome_type
ORDER BY SumOfValue DESC

-- What is the outcome status as of today of the crimes committed during January 2017
select dimTime.Year, dimTime.Month_name, dimCrimeStatus.Crime_status as 'Crime Outcome Status', 
       sum(factCrimeLondon2.Crime_count) AS SumOfValue 
from FactLondonCrime02 as factCrimeLondon2
join DimTime as dimTime on dimTime.Time_ID = factCrimeLondon2.Time_ID
--join DimOutcomeType as dimOutcomeType on dimOutcomeType.Outcome_type_ID = factCrimeLondon2.Outcome_type_ID  
join DimCrimeStatus as dimCrimeStatus on dimCrimeStatus.Crime_status_ID = factCrimeLondon2.Crime_status_ID  
--where dimTime.Time_ID = 201701 
where dimTime.Month = 1 
GROUP BY dimTime.Year, dimTime.Month_name,  dimCrimeStatus.Crime_status
ORDER BY dimTime.Year,  SumOfValue DESC


---- What are the top 10 outcome type status in past three years that crimes have?
--select dimTime.Month, dimTime.Month_name, dimCrimeStatus.Outcome_type, sum(factCrimeLondon2.Crime_count) AS SumOfValue
--from FactLondonCrime02 as factCrimeLondon2
--join DimTime as dimTime on dimTime.Time_ID = factCrimeLondon2.Time_ID
--join DimOutcomeType as dimOutcomeType on dimOutcomeType.Outcome_type_ID = factCrimeLondon2.Outcome_type_ID  
--join DimCrimeStatus as dimCrimeStatus on dimCrimeStatus.Crime_status_ID = factCrimeLondon2.Crime_status_ID  
--GROUP BY dimTime.Month, dimTime.Month_name, dimCrimeStatus.Crime_status
--ORDER BY dimTime.Month

--select dimTime.Month, dimTime.Month_name, dimCrimeStatus.Crime_status, sum(factCrimeLondon2.Crime_count) AS SumOfValue
--from FactLondonCrime02 as factCrimeLondon2
--join DimTime as dimTime on dimTime.Time_ID = factCrimeLondon2.Time_ID
--join DimOutcomeType as dimOutcomeType on dimOutcomeType.Outcome_type_ID = factCrimeLondon2.Outcome_type_ID  
--join DimCrimeStatus as dimCrimeStatus on dimCrimeStatus.Crime_status_ID = factCrimeLondon2.Crime_status_ID  
--GROUP BY dimTime.Month, dimTime.Month_name, dimCrimeStatus.Crime_status
--ORDER BY dimTime.Month

--select dimTime.Year, dimTime.Month, dimBorough.Borough_name, sum(factCrimeLondon2.Total_crime_count) AS SumOfValue 
--from FactLondonCrime02 as factCrimeLondon2
--join DimTime as dimTime on dimTime.Time_ID = factCrimeLondon2.Time_ID
--join DimBorough as dimBorough on dimBorough.Borough_ID = factCrimeLondon2.Borough_ID  
--GROUP BY dimBorough.Borough_name
--ORDER BY SumOfValue DESC

-- Question03:  Which month saw the top 10 crimes between 2017 t0 2019 and which are the top 10 crime types in that month?
-- query question 2a 
select top 10 dimTime.Month_name, sum(factCrimeLondon3.Crime_count) AS SumOfValue 
from FactLondonCrime03 as factCrimeLondon3
join DimTime as dimTime on dimTime.Time_ID = factCrimeLondon3.Time_ID
--join DimCrimeType as dimCrimeType on dimCrimeType.Crime_type_ID = factCrimeLondon3.Crime_type_ID
GROUP BY dimTime.Month_name
ORDER BY SumOfValue DESC

--select top 10 dimTime.Year, dimTime.Month_name, sum(factCrimeLondon3.Crime_count) AS SumOfValue 
--from FactLondonCrime03 as factCrimeLondon3
--join DimTime as dimTime on dimTime.Time_ID = factCrimeLondon3.Time_ID
--join DimCrimeType as dimCrimeType on dimCrimeType.Crime_type_ID = factCrimeLondon3.Crime_type_ID
--GROUP BY dimTime.Year, dimTime.Month_name
--ORDER BY SumOfValue DESC

-- query question 3b
-- top 10 crime types in October month in all three years 
select top 10 dimCrimeType.Crime_type, sum(factCrimeLondon3.Crime_count) AS SumOfValue 
from FactLondonCrime03 as factCrimeLondon3
join DimTime as dimTime on dimTime.Time_ID = factCrimeLondon3.Time_ID
join DimCrimeType as dimCrimeType on dimCrimeType.Crime_type_ID = factCrimeLondon3.Crime_type_ID
where dimTime.Month = 10
GROUP BY dimCrimeType.Crime_type
ORDER BY SumOfValue DESC








--dimTime.Year, dimTime.Month, dimCrimeType.Crime_type


select TOP 10 * from qryQuestion2
group by Borough_name
order by SumOfValue DESC
