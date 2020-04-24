select top 5 * from StageLondonCrime


select right(cast(Time_ID) as char),2) from StageLondonCrime

select top 5 Time_ID, substring(CAST(Time_ID as CHAR(6)), 5, 2) as Month1 from StageLondonCrime

Insert into StageLondonCrime[Crime_month]


UPDATE StageLondonCrime
SET Crime_month = substring(CAST(Time_ID as CHAR(6)), 5, 2)

select count(*) from StageLondonCrime