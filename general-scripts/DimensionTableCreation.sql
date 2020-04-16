-- CREATE TIME DIMENSION TABLE
USE [LondonCrime]
GO

/****** Object:  Table [dbo].[dimTime]    Script Date: 28/03/2020 12:50:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[dimTime]') IS NOT NULL
	BEGIN
		PRINT 'Table [dimTime] exist! Hence, deleting it...'
		DELETE FROM [dimTime]
		DROP TABLE [dimTime]
		PRINT 'Table [dimTime] deleted!'
	END;
ELSE 
	BEGIN
		PRINT 'No table with name [dimTime] exist in database!'
	END;

CREATE TABLE [dbo].[dimTime](
	[Id] [int] NULL,
	[MonthCode] [nvarchar](50) NULL,
	[Month] [nvarchar](15) NULL,
	[Year] [nvarchar](5) NULL
) 
GO



select * from dimTime
