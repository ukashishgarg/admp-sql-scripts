USE [LondonCrime]
GO

/****** Object:  Table [dbo].[MetropolitanStopAndSearch]    Script Date: 24/03/2020 00:27:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MetropolitanStopAndSearch](
	[Type] [nvarchar](100) NULL,
	[Date] [nvarchar](50) NULL,
	[Part_of_a_policing_operation] [nvarchar](50) NULL,
	[Policing_operation] [nvarchar](50) NULL,
	[Latitude] [nvarchar](50) NULL,
	[Longitude] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NULL,
	[Age_range] [nvarchar](50) NULL,
	[Self_defined_ethnicity] [nvarchar](500) NULL,
	[Officer_defined_ethnicity] [nvarchar](500) NULL,
	[Legislation] [nvarchar](500) NULL,
	[Object_of_search] [nvarchar](100) NULL,
	[Outcome] [nvarchar](500) NULL,
	[Outcome_linked_to_object_of_search] [nvarchar](10) NULL,
	[Removal_of_more_than_just_outer_clothing] [nvarchar](10) NULL
) ON [PRIMARY]
GO

USE [LondonCrime]
GO

/****** Object:  Table [dbo].[MetropolitanOutcomes]    Script Date: 24/03/2020 18:09:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--DELETE FROM [MetropolitanOutcomes]
--DROP TABLE [MetropolitanOutcomes]
IF OBJECT_ID('[MetropolitanOutcomes]') IS NOT NULL
	BEGIN
		PRINT 'Table MetropolitanOutcomes exist! Hence, deleting it...'
		DELETE FROM [MetropolitanOutcomes]
		DROP TABLE [MetropolitanOutcomes]
		PRINT 'Table MetropolitanOutcomes deleted!'
	END;
ELSE 
	BEGIN
		PRINT 'No table with name MetropolitanOutcomes exist in database!'
	END;

CREATE TABLE [dbo].[MetropolitanOutcomes](
	[Crime_ID] [nvarchar](100) NULL,
	[Month] [nvarchar](50) NULL,
	[Reported_by] [nvarchar](50) NULL,
	[Falls_within] [nvarchar](50) NULL,
	[Longitude] [float] NULL,
	[Latitude] [float] NULL,
	[Location] [nvarchar](500) NULL,
	[LSOA_code] [nvarchar](50) NULL,
	[LSOA_name] [nvarchar](50) NULL,
	[Outcome_type] [nvarchar](1000) NULL
) ON [PRIMARY]
GO

USE [LondonCrime]
GO

/****** Object:  Table [dbo].[MetropolitanStreet]    Script Date: 24/03/2020 18:09:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[MetropolitanStreet]') IS NOT NULL
	BEGIN
		PRINT 'Table [MetropolitanStreet] exist! Hence, deleting it...'
		DELETE FROM [MetropolitanStreet]
		DROP TABLE [MetropolitanStreet]
		PRINT 'Table [MetropolitanStreet] deleted!'
	END;
ELSE 
	BEGIN
		PRINT 'No table with name [MetropolitanStreet] exist in database!'
	END;

CREATE TABLE [dbo].[MetropolitanStreet](
	[Crime_ID] [nvarchar](100) NULL,
	[Month] [nvarchar](50) NULL,
	[Reported_by] [nvarchar](50) NULL,
	[Falls_within] [nvarchar](50) NULL,
	[Longitude] [float] NULL,
	[Latitude] [float] NULL,
	[Location] [nvarchar](100) NULL,
	[LSOA_code] [nvarchar](50) NULL,
	[LSOA_name] [nvarchar](100) NULL,
	[Crime_type] [nvarchar](100) NULL,
	[Last_outcome_category] [nvarchar](500) NULL,
	[Context] [nvarchar](500) NULL
) ON [PRIMARY]
GO


