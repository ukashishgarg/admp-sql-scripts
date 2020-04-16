select TOP 10 * from MetropolitanStreet
select distinct LSOA_name from MetropolitanStreet

select LSOA_name 
from MetropolitanStreet
where LSOA_name like 'Southwark%'


-- Get unique locations with the number of cases reported in descending order
select Location, Count(*) as Cases  
from MetropolitanStreet
group by Location
order by Cases DESC

-- Get all crime types that happened in "On or near Supermarket"
select Crime_type, Count(*) as Incidents 
from MetropolitanStreet
where Location = 'On or near Supermarket'
group by Crime_type
order by Incidents DESC

-- Just get all unique crime_type in London region
select distinct Crime_type 
from MetropolitanStreet

-- Get total number of each crime types in an ascending order for london region
select Crime_type, Count(*) as Incidents 
from MetropolitanStreet
group by Crime_type
order by Incidents DESC

-- Location data
select distinct Crime_type as Number from MetropolitanStreet

-- Get the number of crimes happens based on the crime type in the descending order
select Crime_type, COUNT(*) as NumberOfTimes from MetropolitanStreet
group by Crime_type
order by NumberOfTimes DESC

-- Once you know top 3 crimes, drill down to identify the area that is severely affected by top crime type
select LSOA_name, count(*) as Numbers from MetropolitanStreet
where Crime_type = 'Anti-social behaviour'
group by LSOA_name 
order by Numbers DESC

select LSOA_name, count(*) as Numbers from MetropolitanStreet
where Crime_type = 'Violence and sexual offences'
group by LSOA_name 
order by Numbers DESC

select LSOA_name, count(*) as Numbers from MetropolitanStreet
where Crime_type = 'Other theft'
group by LSOA_name 
order by Numbers DESC

--select count(*) as Numbers from MetropolitanStreet
--where Crime_type = 'Anti-social behaviour' and LSOA_name like 'Westminster%'
--group by LSOA_name 
--order by Numbers DESC


select Latitude, Longitude, LSOA_code, LSOA_name from MetropolitanStreet
where Location = 'On or near Supermarket'

-- Criminal analysis (StopAndSearch)
select TOP 10 * from MetropolitanStopAndSearch
select distinct Type from MetropolitanStopAndSearch
select distinct Age_range from MetropolitanStopAndSearch
select distinct Gender from MetropolitanStopAndSearch
select distinct Self_defined_ethnicity from MetropolitanStopAndSearch order by Self_defined_ethnicity
select distinct Officer_defined_ethnicity from MetropolitanStopAndSearch order by Officer_defined_ethnicity
select distinct Legislation from MetropolitanStopAndSearch order by Legislation
select distinct Object_of_search from MetropolitanStopAndSearch order by Object_of_search
select distinct Outcome from MetropolitanStopAndSearch order by Outcome
select distinct Outcome_linked_to_object_of_search from MetropolitanStopAndSearch order by Outcome_linked_to_object_of_search
select distinct Removal_of_more_than_just_outer_clothing from MetropolitanStopAndSearch order by Removal_of_more_than_just_outer_clothing


