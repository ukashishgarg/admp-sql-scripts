delete from DimLocation
select * from DimLocation
select top 5 Crime_ID, Location_ID from StageLondonCrime

delete from DimBorough
select * from DimBorough
select top 5 Crime_ID, Borough_ID from StageLondonCrime

delete from DimSubBorough
select * from DimSubBorough
select top 5 Crime_ID, Sub_borough_ID from StageLondonCrime

delete from DimTime
select * from DimTime
select top 5 Crime_ID, Time_ID from StageLondonCrime

delete from DimPoliceForce
select * from DimPoliceForce
select top 5 Crime_ID, Police_force_ID from StageLondonCrime

delete from DimCrimeType
select * from DimCrimeType
select top 5 Crime_ID, Crime_type_ID from StageLondonCrime

delete from DimOutcomeType
select * from DimOutcomeType
select top 5 Crime_ID, Outcome_type_ID from StageLondonCrime

delete from DimCrimeStatus
select * from DimCrimeStatus
select top 5 Crime_ID, Crime_status_ID from StageLondonCrime

delete from StageLondonCrime
drop table StageLondonCrime
select * from StageLondonCrime