
-- select top 100 * from LondonOutcomes
-- select distinct Location from LondonOutcomes

IF OBJECT_ID('[sp_perform_bulkcopy]') IS NOT NULL
	BEGIN
		PRINT 'Object sp_perform_bulkcopy exist! Hence, deleting it...'
		DROP PROCEDURE sp_perform_bulkcopy
		PRINT 'Object sp_perform_bulkcopy deleted!'
	END;
ELSE 
	BEGIN
		PRINT 'No SP with name ''sp_perform_bulkcopy'' exist in database!'
	END;

CREATE PROCEDURE dbo.sp_perform_bulkcopy @year varchar(10), @name2 VARCHAR(100), @tblname VARCHAR(30)
AS
BEGIN
	DECLARE @i INT 
	DECLARE @monthcnt INT
	DECLARE @path VARCHAR(500)
	DECLARE @name1 VARCHAR(10)
	--DECLARE @name2 VARCHAR(50)

	SET @path = 's:\'+@year+'\'
	SET @name1 = @year+'-0' --'2017-0'
	--SET @name2 ='-metropolitan-outcomes.csv'
	SET @i = 1
	SET @monthcnt = 13
	DECLARE @filename VARCHAR(500) 
	declare @sql nvarchar(Max)

	WHILE (@i<>@monthcnt)
		BEGIN 	
			if @i > 9
				 set @name1 = @year+'-'
		
			SET @filename = @path+@name1+CAST(@i AS varchar)+@name2

			Set @sql = 'BULK INSERT "'+@tblname+'"
			FROM "'+@filename+'"
			WITH
			(
				FIRSTROW = 2,
				FIELDTERMINATOR = '','',  
				ROWTERMINATOR = ''\n'',   
				TABLOCK
			)';

			exec sp_executesql @sql
			PRINT 'Month '+CAST(@i AS varchar)+' Copied!!'
			SET @i = @i+1;
		END
END

select COUNT(*) from LondonOutcomes
select COUNT(*) from LondonStopAndSearch
select COUNT(*) from LondonStreet

-- Perform bulk copy of London of Police data 
EXECUTE dbo.sp_perform_bulkcopy @year = '2017', @name2 = '-city-of-london-outcomes.csv', @tblname='LondonOutcomes';  
EXECUTE dbo.sp_perform_bulkcopy @year = '2018', @name2 = '-city-of-london-outcomes.csv', @tblname='LondonOutcomes';
EXECUTE dbo.sp_perform_bulkcopy @year = '2019', @name2 = '-city-of-london-outcomes.csv', @tblname='LondonOutcomes';

EXECUTE dbo.sp_perform_bulkcopy @year = '2017', @name2 = '-city-of-london-stop-and-search.csv', @tblname='LondonStopAndSearch';  
EXECUTE dbo.sp_perform_bulkcopy @year = '2018', @name2 = '-city-of-london-stop-and-search.csv', @tblname='LondonStopAndSearch';
EXECUTE dbo.sp_perform_bulkcopy @year = '2019', @name2 = '-city-of-london-stop-and-search.csv', @tblname='LondonStopAndSearch';

EXECUTE dbo.sp_perform_bulkcopy @year = '2017', @name2 = '-city-of-london-street.csv', @tblname='LondonStreet';  
EXECUTE dbo.sp_perform_bulkcopy @year = '2018', @name2 = '-city-of-london-street.csv', @tblname='LondonStreet';
EXECUTE dbo.sp_perform_bulkcopy @year = '2019', @name2 = '-city-of-london-street.csv', @tblname='LondonStreet';


-- Perform bulk copy of metropolitan data 
EXECUTE dbo.sp_perform_bulkcopy @year = '2017', @name2 = '-metropolitan-outcomes.csv', @tblname='LondonOutcomes';  
EXECUTE dbo.sp_perform_bulkcopy @year = '2018', @name2 = '-metropolitan-outcomes.csv', @tblname='LondonOutcomes';
EXECUTE dbo.sp_perform_bulkcopy @year = '2019', @name2 = '-metropolitan-outcomes.csv', @tblname='LondonOutcomes';

EXECUTE dbo.sp_perform_bulkcopy @year = '2017', @name2 = '-metropolitan-stop-and-search.csv', @tblname='LondonStopAndSearch';  
EXECUTE dbo.sp_perform_bulkcopy @year = '2018', @name2 = '-metropolitan-stop-and-search.csv', @tblname='LondonStopAndSearch';
EXECUTE dbo.sp_perform_bulkcopy @year = '2019', @name2 = '-metropolitan-stop-and-search.csv', @tblname='LondonStopAndSearch';

EXECUTE dbo.sp_perform_bulkcopy @year = '2017', @name2 = '-metropolitan-street.csv', @tblname='LondonStreet';  
EXECUTE dbo.sp_perform_bulkcopy @year = '2018', @name2 = '-metropolitan-street.csv', @tblname='LondonStreet';
EXECUTE dbo.sp_perform_bulkcopy @year = '2019', @name2 = '-metropolitan-street.csv', @tblname='LondonStreet';

