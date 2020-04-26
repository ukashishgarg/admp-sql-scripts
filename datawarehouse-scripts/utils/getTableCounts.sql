--Get the count of records of each tables
select count(*) from StageLondonCrime
select count(*) from DimTime
select count(*) from DimBorough
select count(*) from DimSubBorough
select count(*) from DimLocation
select count(*) from DimCrimeType
select count(*) from DimOutcomeType
select count(*) from DimCrimeStatus

--Get each dimension's distinct values
select * from DimTime
select * from DimBorough
select * from DimSubBorough
select * from DimLocation
select * from DimCrimeType
select * from DimOutcomeType
select * from DimCrimeStatus