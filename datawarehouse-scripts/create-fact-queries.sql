-- ******************** SQL QUERIES TO ANSWER 5 BUSINESS QUESTIONS ************************

-- Question 01: What was the total count of crimes in each month between 2017 to 2019 per borough, sub-borough and location?
select dimTime.Year, dimTime.Month, dimBorough.Borough_name, dimSubBorough.LSOA_name, dimLocation.Location,
       sum(factCrimeLondon1.Crime_count) AS SumOfValue 
from FactLondonCrime01 as factCrimeLondon1
join DimTime as dimTime on dimTime.Time_ID = factCrimeLondon1.Time_ID
join DimBorough as dimBorough on dimBorough.Borough_ID = factCrimeLondon1.Borough_ID  
join DimSubBorough as dimSubBorough on dimSubBorough.Sub_borough_ID = factCrimeLondon1.Sub_borough_ID  
join DimLocation as dimLocation on dimLocation.Location_ID = factCrimeLondon1.Location_ID
GROUP BY dimTime.Year, dimTime.Month, dimBorough.Borough_name, dimSubBorough.LSOA_name, dimLocation.Location
ORDER BY dimTime.Year, dimTime.Month

-- Question 02a: What were the counts of different crime outcomes for the crimes committed in the month of January 2017? 
select dimTime.Year, dimTime.Month_name, dimOutcomeType.Outcome_type, sum(factCrimeLondon2.Crime_count) AS SumOfValue
from FactLondonCrime02 as factCrimeLondon2
join DimTime as dimTime on dimTime.Time_ID = factCrimeLondon2.Time_ID
join DimOutcomeType as dimOutcomeType on dimOutcomeType.Outcome_type_ID = factCrimeLondon2.Outcome_type_ID   
where dimTime.Time_ID = 201701 
GROUP BY dimTime.Year, dimTime.Month_name,  dimOutcomeType.Outcome_type
ORDER BY SumOfValue DESC

-- Question 02b: What were the counts of different crime outcomes for the crimes committed in the month of January 2017? 
select dimTime.Year, dimTime.Month_name, dimCrimeStatus.Crime_status as 'Crime Outcome Status', 
       sum(factCrimeLondon2.Crime_count) AS SumOfValue 
from FactLondonCrime02 as factCrimeLondon2
join DimTime as dimTime on dimTime.Time_ID = factCrimeLondon2.Time_ID
join DimCrimeStatus as dimCrimeStatus on dimCrimeStatus.Crime_status_ID = factCrimeLondon2.Crime_status_ID  
where dimTime.Month = 1 
GROUP BY dimTime.Year, dimTime.Month_name,  dimCrimeStatus.Crime_status
ORDER BY SumOfValue DESC

-- Question  03: Which month had the maximum crimes in three consecutive years from 2017 to 2019?select top 10 dimTime.Month_name, sum(factCrimeLondon3.Crime_count) AS SumOfValue 
select top 10 dimTime.Month_name, sum(factCrimeLondon3.Crime_count) AS SumOfValue 
from FactLondonCrime03 as factCrimeLondon3
join DimTime as dimTime on dimTime.Time_ID = factCrimeLondon3.Time_ID
GROUP BY dimTime.Month_name
ORDER BY SumOfValue DESC

-- Question 04:  Which were the top 10 crime types for the crimes committed during 2017 to 2019 in the month of October? select top 10 dimCrimeType.Crime_type, sum(factCrimeLondon3.Crime_count) AS SumOfValue 
select top 10 dimCrimeType.Crime_type, sum(factCrimeLondon4.Crime_count) AS SumOfValue 
from FactLondonCrime04 as factCrimeLondon4
join DimTime as dimTime on dimTime.Time_ID = factCrimeLondon4.Time_ID
join DimCrimeType as dimCrimeType on dimCrimeType.Crime_type_ID = factCrimeLondon4.Crime_type_ID
where dimTime.Month = 10
GROUP BY dimCrimeType.Crime_type
ORDER BY SumOfValue DESC

-- Question 05: Which borough and location had a maximum crimes during October month from 2017 to 2019 for crime type 'Violence and sexual offences'?
select dimBorough.Borough_name, dimLocation.Location, sum(factCrimeLondon5.Crime_count) AS CrimeCount
from FactLondonCrime05 as factCrimeLondon5
join DimTime as dimTime on dimTime.Time_ID = factCrimeLondon5.Time_ID
join DimBorough as dimBorough on dimBorough.Borough_ID = factCrimeLondon5.Borough_ID  
join DimLocation as dimLocation on dimLocation.Location_ID = factCrimeLondon5.Location_ID
join DimCrimeType as dimCrimeType on dimCrimeType.Crime_type_ID = factCrimeLondon5.Crime_type_ID
where dimTime.Month=10 and dimCrimeType.Crime_type_ID = 26
GROUP BY dimBorough.Borough_name,  dimLocation.Location
ORDER BY CrimeCount DESC




