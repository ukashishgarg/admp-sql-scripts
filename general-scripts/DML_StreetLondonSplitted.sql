select COUNT(*) from StreetLondonSplitted
select top 10 * from StreetLondonSplitted
select distinct LSOA_name from StreetLondonSplitted

DECLARE @LondonBorough varchar
SET @LondonBorough = ('Camden',
'Greenwich',
'Hackney',
'Hammersmith and Fulham',
'Islington',
'Kensington and Chelsea',
'Lambeth',
'Lewisham',
'Southwark',
'Tower Hamlets',
'Wandsworth',
'City of Westminster',
'Barking and Dagenham',
'Barnet',
'Bexley',
'Brent',
'Bromley',
'Croydon',
'Ealing',
'Enfield',
'Haringey',
'Harrow',
'Havering',
'Hillingdon',
'Hounslow',
'Royal Borough of Kingston upon Thames',
'Merton',
'Newham',
'Redbridge',
'Richmond upon Thames',
'Sutton',
'Waltham Forest',
'City of London')

-- Get the number of crime in three years across streets (3229932)
select count(*) LSOA_name 
from StreetLondonSplitted as strt

-- Get the number of crime in three years across streets in London Boroughs (2902470)
select count(*) LSOA_name 
from StreetLondonSplitted as strt
join dimLondonBoroughs as brgh on strt.LSOA_name = brgh.Name

-- Get the number of crime in three years across streets in London Boroughs that have the valid crime id (2266158)
select count(*) LSOA_name 
from StreetLondonSplitted as strt
join dimLondonBoroughs as brgh on strt.LSOA_name = brgh.Name
where strt.Crime_ID != ''

-- Get the number of crime in three years across streets in London Boroughs that have the valid Location name (2902470) 
-- All records have location KHOOL
select count(*) LSOA_name 
from StreetLondonSplitted as strt
join dimLondonBoroughs as brgh on strt.LSOA_name = brgh.Name
where strt.Location != 'No Location'

-- Get the number of crime committed in three years across different London Boroughs in a descending order 
-- Maximum number of crime got reported in 'Westminster' i.e. 236676
select LSOA_name, count(*) as Numbers  
from StreetLondonSplitted  as strt
join dimLondonBoroughs as brgh on strt.LSOA_name = brgh.Name
group by strt.LSOA_name
order by Numbers DESC

-- Get the area details with the number of crimes in 'WestMinster' 
-- Maximum cases are reported 'On or near Nightclub' i.e. 18841
select Location, count(*) as Numbers  
from StreetLondonSplitted  as strt
join dimLondonBoroughs as brgh on strt.LSOA_name = brgh.Name
where strt.LSOA_name = 'Westminster'
group by strt.Location
order by Numbers DESC

-- Get the individual place (code) where crime is maximum in 'WestMinster' inside location 'On or near Nightclub' 
-- Maximum cases are reported in Code '018A' i.e. 6932
select Code, count(*) as Numbers  
from StreetLondonSplitted  as strt
join dimLondonBoroughs as brgh on strt.LSOA_name = brgh.Name
where strt.LSOA_name = 'Westminster' and strt.Location = 'On or near Nightclub'
group by strt.Code
order by Numbers DESC

-- Get all crimes happened in 'WestMinster' inside location 'On or near Nightclub' and code = '018A'
-- Maximum cases are reported in Code '018A' i.e. 6932
select Crime_type, count(*) as Numbers  
from StreetLondonSplitted  as strt
join dimLondonBoroughs as brgh on strt.LSOA_name = brgh.Name
where strt.LSOA_name = 'Westminster' and strt.Location = 'On or near Nightclub' and Code = '018A'
group by strt.Crime_type
order by Numbers DESC

-- MONTH WISE DATA FOR MOST AFFECTED LOCATION OF CRIME IN THREE YEARS
select Month, count(*) as Numbers
from StreetLondonSplitted  as strt
join dimLondonBoroughs as brgh on strt.LSOA_name = brgh.Name
where strt.LSOA_name = 'Westminster' and strt.Location = 'On or near Nightclub' and Code = '018A'
group by strt.Month
order by Month 

-- YEAR WISE DATA FOR MOST AFFECTED LOCATION OF CRIME IN THREE YEARS
select t.Year, count(*) as Numbers
from StreetLondonSplitted  as strt
join dimLondonBoroughs as brgh on strt.LSOA_name = brgh.Name
join dimTime as t on strt.Month = t.MonthCode
where strt.LSOA_name = 'Westminster' and strt.Location = 'On or near Nightclub' and Code = '018A'
group by t.Year
order by t.Year 





select top 10 * from StreetLondonSplitted where Location like 'No%'


select distinct LSOA_name from StreetLondonSplitted --where LSOA_name like '%Royal%'
where LSOA_name in
('Camden',
'Greenwich',
'Hackney',
'Hammersmith and Fulham',
'Islington',
'Kensington and Chelsea',
'Lambeth',
'Lewisham',
'Southwark',
'Tower Hamlets',
'Wandsworth',
'City of Westminster',
'Barking and Dagenham',
'Barnet',
'Bexley',
'Brent',
'Bromley',
'Croydon',
'Ealing',
'Enfield',
'Haringey',
'Harrow',
'Havering',
'Hillingdon',
'Hounslow',
'Royal Borough of Kingston upon Thames',
'Merton',
'Newham',
'Redbridge',
'Richmond upon Thames',
'Sutton',
'Waltham Forest',
'City of London')

select * from dimLondonBoroughs