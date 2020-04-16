-- 2011 lower layer super output area (LSOA)

-- Provide stop and search information about each crime
select count(*) from CityOfLondonStopAndSearch

-- Provide street-level crime. In another word it contains the co-ordinate data
select count(*) from CityOfLondonStreet

-- Provide crime outcome
select count(*) from CityOfLondonOutcomes

-- GIS Shapefiles


select TOP 10 * from CityOfLondonStopAndSearch
select TOP 10 * from CityOfLondonStreet
select TOP 10 * from CityOfLondonOutcomes

select Longitude, Latitude, Location, Crime_type from CityOfLondonStreet
where Longitude not in ('') AND Latitude not in ('') 

-- Get unique locations with the number of cases reported in descending order
select Location, Count(*) as Cases  
from CityOfLondonStreet
group by Location
order by Cases DESC

-- Get all crime types that happened in "On or near Supermarket"
select Crime_type, Count(*) as Incidents 
from CityOfLondonStreet
where Location = 'On or near Supermarket'
group by Crime_type
order by Incidents DESC

-- Just get all unique crime_type in London region
select distinct Crime_type 
from CityOfLondonStreet

-- Get total number of each crime types in an ascending order for london region
select Crime_type, Count(*) as Incidents 
from CityOfLondonStreet
group by Crime_type
order by Incidents DESC