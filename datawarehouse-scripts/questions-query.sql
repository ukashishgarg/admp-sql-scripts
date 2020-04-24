-- qryQuestion1
-- What was the total number of street crimes per borough per subborough of London region in each month between Jan 2017 to Dec 2019?
select dimTime.Crime_year, dimTime.Crime_month, dimTime.Month_name, dimBorough.Borough_name, dimSubBorough.LSOA_code,  SUM(fact.Total_crime_count) as TotalCrimes
from FactLondonCrime as fact
join DimTime as dimTime on dimTime.Time_ID =  fact.Time_ID
join DimBorough as dimBorough on dimBorough.Borough_ID = fact.Borough_ID
join DimSubBorough as dimSubBorough on dimSubBorough.Sub_borough_ID = fact.Sub_borough_ID
group by dimTime.Year, dimTime.Month, dimTime.Month_name, dimBorough.Borough_name, dimSubBorough.LSOA_code
order by dimTime.Year, dimTime.Month, dimBorough.Borough_name, TotalCrimes DESC
-- order by dimTime.Year, dimTime.Month

-- qryQuestion2
-- What were the top 5 boroughs in the London region which is having the highest crime rate from the year 2017 to 2019?
select TOP 5 dimBorough.Borough_name, SUM(fact.Total_crime_count) as TotalCrimes
from FactLondonCrime as fact
join DimBorough as dimBorough on dimBorough.Borough_ID = fact.Borough_ID
group by dimBorough.Borough_name
order by TotalCrimes DESC

-- qryQuestion3
-- Which month, year and season have the highest crimes between 2017 to 2019 in London Region?
SELECT dimTime.Month, dimTime.Year, dimTime.Month_name, dimTime.Season_name, SUM(fact.Total_crime_count) as TotalCrimes
from FactLondonCrime as fact
join DimTime as dimTime on dimTime.Time_ID = fact.Time_ID
group by dimTime.Month, dimTime.Year, dimTime.Month_name, dimTime.Season_name
order by TotalCrimes DESC
-- season observation
SELECT dimTime.Season_name, SUM(fact.Total_crime_count) as TotalCrimes
from FactLondonCrime as fact
join DimTime as dimTime on dimTime.Time_ID = fact.Time_ID
group by dimTime.Season_name
order by TotalCrimes DESC
-- every year seasonal data
SELECT dimTime.Season_name, dimTime.Year, SUM(fact.Total_crime_count) as TotalCrimes, MAX(dimTime.Month_name) as MaxMonth
from FactLondonCrime as fact
join DimTime as dimTime on dimTime.Time_ID = fact.Time_ID
group by dimTime.Season_name, dimTime.Year
order by TotalCrimes DESC, dimTime.Year, dimTime.Season_name 
--order by dimTime.Year, dimTime.Month, TotalCrimes

--qryQuestion4
--Which street saw the most crimes in the borough that has observed the maximum number of crimes between 2017 to 2019?
--Answer: Westminster 013E (4779)
select dimSubBorough.Sub_borough_ID, dimSubBorough.LSOA_code, dimSubBorough.LSOA_name, SUM(fact.Total_crime_count) as TotalCrimes 
from FactLondonCrime as fact
join DimSubBorough as dimSubBorough on dimSubBorough.Sub_borough_ID = fact.Sub_borough_ID
join DimBorough as dimBorough on dimBorough.Borough_ID = fact.Borough_ID
where dimBorough.Borough_name = 'Westminster'	
group by dimSubBorough.Sub_borough_ID, dimSubBorough.LSOA_code, dimSubBorough.LSOA_name
order by TotalCrimes DESC

-- Check which Location is highly effected by the crimes inside the 'Westminster 013E' sub-borough
--     Location						Latitude			Longitude		TotalCrimes		Location_ID
-- On or near Shopping Area		51.5153312683105	-0.140385001897812	   1263				31807
select dimLocation.Location, dimLocation.Latitude, dimLocation.Longitude, dimLocation.Location_ID, SUM(fact.Total_crime_count) as TotalCrimes 
from FactLondonCrime as fact
join DimSubBorough as dimSubBorough on dimSubBorough.Sub_borough_ID = fact.Sub_borough_ID
join DimLocation as dimLocation on dimLocation.Location_ID = fact.Location_ID
where dimSubBorough.LSOA_name = 'Westminster 013E'	
group by dimLocation.Location, dimLocation.Latitude, dimLocation.Longitude, dimLocation.Location_ID
order by TotalCrimes DESC

-- qryQuestion5
-- Which crime type tops the list for the street that is having the most crimes in the borough with maximum crime rate 
-- from 2017 to 2019?
select dimCrimeType.Crime_type_ID, dimCrimeType.Crime_type, SUM(fact.Total_crime_count) as TotalCrimes 
from FactLondonCrime as fact
join DimSubBorough as dimSubBorough on dimSubBorough.Sub_borough_ID = fact.Sub_borough_ID
join DimLocation as dimLocation on dimLocation.Location_ID = fact.Location_ID
join DimCrimeType as dimCrimeType on dimCrimeType.Crime_type_ID = fact.Crime_type_ID
where (fact.Sub_borough_ID = 4779) and (fact.Location_ID = 31807)
group by dimCrimeType.Crime_type_ID,dimCrimeType.Crime_type
order by TotalCrimes DESC

select * from DimSubBorough where Sub_borough_ID = 22325

-- qryQuestion5a
-- Which crime type tops the list for the street that is having the most crimes in the borough with maximum crime rate 
-- from 2017 to 2019? What is the latest outcome of the same?
-- Crime_type_ID	Crime_type					
--   11				Theft from the person		  
 

select * from DimSubBorough where Sub_borough_ID = 22325

