
-- select top 100 * from LondonOutcomes
-- select distinct Location from LondonOutcomes
select COUNT(*) from StreetLondonSplitted
BULK INSERT StreetLondonSplitted
FROM 'C://SHU/ADMP/Assessment 02/DataSet/csv_files/street_london_splitted.csv'
WITH
(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',  
	ROWTERMINATOR = '\n',   
	TABLOCK
)

select COUNT(*) from StreetLondonSplitted

