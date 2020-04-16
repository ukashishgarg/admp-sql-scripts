select COUNT(*) from CityOfLondonStreet
select COUNT(*) from CityOfLondonOutcomes


select COUNT(*)
from CityOfLondonStreet as tblCrimeLocation
join CityOfLondonOutcomes as tblCrimeOutcome
on (tblCrimeLocation.Crime_ID = tblCrimeOutcome.Crime_ID)

select distinct tblCrimeLocation.Last_outcome_category
from CityOfLondonStreet as tblCrimeLocation
join CityOfLondonOutcomes as tblCrimeOutcome
on (tblCrimeLocation.Crime_ID = tblCrimeOutcome.Crime_ID)

select distinct tblCrimeOutcome.Outcome_type
from CityOfLondonStreet as tblCrimeLocation
join CityOfLondonOutcomes as tblCrimeOutcome
on (tblCrimeLocation.Crime_ID = tblCrimeOutcome.Crime_ID)

select *
from CityOfLondonStreet as tblCrimeLocation
join CityOfLondonStopAndSearch as tblStopAndSearch
on  (tblCrimeLocation.Latitude = tblStopAndSearch.Latitude) 
and (tblCrimeLocation.Longitude = tblStopAndSearch.Longitude)

select distinct Crime_ID from CityOfLondonOutcomes

select distinct Crime_ID, Crime_type
from CityOfLondonStreet as tblCrimeLocation
join CityOfLondonStopAndSearch as tblStopAndSearch
on  (tblCrimeLocation.Latitude = tblStopAndSearch.Latitude) 
and (tblCrimeLocation.Longitude = tblStopAndSearch.Longitude)

-- Identify the last outcome categories with their aggregate count  
select tblCrimeLocation.Last_outcome_category, count(*) as Total
from CityOfLondonStreet as tblCrimeLocation
join CityOfLondonOutcomes as tblCrimeOutcome
on (tblCrimeLocation.Crime_ID = tblCrimeOutcome.Crime_ID)
group by tblCrimeLocation.Last_outcome_category
order by Total DESC

select Last_outcome_category, count(*) as Total
from CityOfLondonStreet
group by Last_outcome_category
order by Total DESC

-- Criminal analysis (StopAndSearch)
select TOP 10 * from CityOfLondonStopAndSearch
select distinct Type from CityOfLondonStopAndSearch
select distinct Age_range from CityOfLondonStopAndSearch
select distinct Gender from CityOfLondonStopAndSearch
select distinct Self_defined_ethnicity from CityOfLondonStopAndSearch order by Self_defined_ethnicity
select distinct Officer_defined_ethnicity from CityOfLondonStopAndSearch order by Officer_defined_ethnicity
select distinct Legislation from CityOfLondonStopAndSearch order by Legislation
select distinct Object_of_search from CityOfLondonStopAndSearch order by Object_of_search
select distinct Outcome from CityOfLondonStopAndSearch order by Outcome
select distinct Outcome_linked_to_object_of_search from CityOfLondonStopAndSearch order by Outcome_linked_to_object_of_search
select distinct Removal_of_more_than_just_outer_clothing from CityOfLondonStopAndSearch order by Removal_of_more_than_just_outer_clothing

select Object_of_search, Outcome, Outcome_linked_to_object_of_search 
from CityOfLondonStopAndSearch
where Outcome_linked_to_object_of_search = 'True' and Outcome = 'Nothing found - no further action'

-- Get all unique possible outcomes for criminals with the count
select Outcome, count(*) as count 
from CityOfLondonStopAndSearch
where Outcome_linked_to_object_of_search = 'False'
group by Outcome 
order by count desc

select distinct Outcome_linked_to_object_of_search from CityOfLondonStopAndSearch