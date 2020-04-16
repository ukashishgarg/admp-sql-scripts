GO LondonCrime

-- Get total records in LondonStreet
select count(*) from LondonStreet -- Return 3229932 (3.2 Million of crime records from Jan 2017 to Dec 2019)

-- Get total records in LondonOutcomes
select count(*) from LondonOutcomes -- Return 1236024 (1.2 Million of crime records from Jan 2017 to Dec 2019)

-- Get total records in LondonStopAndSearch
select count(*) from LondonStopAndSearch -- Return 547319 (0.5 Million of crime records from Jan 2017 to Dec 2019)

-- Get unique LSOA appeared as the area of crime
select distinct LSOA_name from LondonStreet -- Return 7511 records

-- Get unique reported by values 
-- **************** 1. City of London Police
-- **************** 2. Metropolitan Police Service
select distinct Reported_by from LondonStreet 
select distinct Falls_within from LondonStreet 

-- What all unique locations appeared in the database?
select distinct Location from LondonStreet -- 37,052 unique locations


-- How many crime do not have the location details? Note: This will have NULL - Latitude, Longitude, LSOA_code and LSOA_name
select Count(*) from LondonStreet where Location = 'No Location' -- 40456

-- How many crime records have exact location? 
select Count(*) from LondonStreet where Location != 'No Location' -- 3189476

select count(*) Last_outcome_category from LondonStreet -- 2540338
where Last_outcome_category != ''

select count(*) from LondonOutcomes -- 1236024
where Outcome_type != ''

-- get all the crimes outcome status on street date and latest outcome date (1352473)
select outc.Crime_ID, outc.Outcome_type, strt.Last_outcome_category, strt.Month as StreetDate, outc.Month as OutcomeDate from LondonStreet as strt
join LondonOutcomes as outc on strt.Crime_ID = outc.Crime_ID

-- get all the crime's outcome status on street date and latest outcome date where two status are not same (323582)
select outc.Crime_ID, strt.Crime_type, outc.Outcome_type, strt.Last_outcome_category, strt.Month as StreetDate, outc.Month as OutcomeDate from LondonStreet as strt
join LondonOutcomes as outc on strt.Crime_ID = outc.Crime_ID
where strt.Last_outcome_category != outc.Outcome_type

select Crime_type, count(*) as Number from 

select distinct Outcome_type  from LondonOutcomes -- 27 records
select distinct Crime_type  from LondonStreet -- 16 records

select Crime_type, count(*) as Total from LondonStreet
group by Crime_type
order by Total DESC







-- What are the different types of outcome category
select Last_outcome_category, count(*) as Numbers 
from LondonStreet 
where Last_outcome_category != 'NULL'
group by Last_outcome_category 
order by Numbers DESC 

select top 10 * from LondonStreet
select top 10 * from LondonOutcomes
select top 10 * from LondonStopAndSearch
