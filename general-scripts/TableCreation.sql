USE [LondonCrime]
GO

/****** Object:  Table [dbo].[CityOfLondonStopAndSearch]    Script Date: 24/03/2020 00:27:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CityOfLondonStopAndSearch](
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

/****** Object:  Table [dbo].[CityOfLondonOutcomes]    Script Date: 24/03/2020 18:09:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CityOfLondonOutcomes](
	[Crime_ID] [nvarchar](100) NULL,
	[Month] [nvarchar](50) NULL,
	[Reported_by] [nvarchar](50) NULL,
	[Falls_within] [nvarchar](50) NULL,
	[Longitude] [float] NULL,
	[Latitude] [float] NULL,
	[Location] [nvarchar](50) NULL,
	[LSOA_code] [nvarchar](50) NULL,
	[LSOA_name] [nvarchar](50) NULL,
	[Outcome_type] [nvarchar](1000) NULL
) ON [PRIMARY]
GO

USE [LondonCrime]
GO

/****** Object:  Table [dbo].[CityOfLondonStreet]    Script Date: 24/03/2020 18:09:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CityOfLondonStreet](
	[Crime_ID] [nvarchar](100) NULL,
	[Month] [nvarchar](50) NULL,
	[Reported_by] [nvarchar](50) NULL,
	[Falls_within] [nvarchar](50) NULL,
	[Longitude] [float] NULL,
	[Latitude] [float] NULL,
	[Location] [nvarchar](50) NULL,
	[LSOA_code] [nvarchar](50) NULL,
	[LSOA_name] [nvarchar](50) NULL,
	[Crime_type] [nvarchar](100) NULL,
	[Last_outcome_category] [nvarchar](500) NULL,
	[Context] [nvarchar](500) NULL
) ON [PRIMARY]
GO


