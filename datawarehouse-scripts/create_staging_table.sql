USE [CrimeInLondon_DataWareHouse]
GO


/****** Object:  Table [dbo].[london_crime_staging]    Script Date: 09/04/2020 17:21:43 ******/

/* Uniqueness of the value - Uniqueness must be enforced by using a PRIMARY KEY or UNIQUE constraint or UNIQUE index. */
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[StageLondonCrime](
	[Staging_ID] [int] NOT NULL IDENTITY(1,1), -- using the IDENTITY property for an automatically incrementing identification number
	[Crime_ID] [nvarchar](300) NULL,
	[Crime_month] [int] NULL,
	[Police_force] [nvarchar](200) NULL,
	[Longitude] [float] NULL,
	[Latitude] [float] NULL,
	[Location] [nvarchar](200) NULL,
	[LSOA_code] [nvarchar](400) NULL,
	[LSOA_name] [nvarchar](200) NULL,
	[Crime_type] [nvarchar](500) NULL,
	[Crime_status] [nvarchar](20) NULL,
	[Borough_name] [nvarchar](500) NULL,
	[Crime_year] [int] NULL,
	[Crime_outcome] [nvarchar](500) NULL,	
	-- Declare variables to store the keys of different dimensions
	[Location_ID] [int] NULL,
	[Borough_ID] [int] NULL,
	[Sub_borough_ID] [int] NULL,
	[Police_force_ID] [int] NULL,
	[Crime_type_ID] [int] NULL,
	[Outcome_type_ID] [int] NULL,
	[Time_ID] [int] NULL,
	[Crime_status_ID] [int] NULL,
	CONSTRAINT [PK_StageLondonCrime] PRIMARY KEY CLUSTERED 
(
	[Staging_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/* ****************************************** Address Dimension table creation************************************ */
USE [CrimeInLondon_DataWareHouse]
GO

/****** Object:  Table [dbo].[DimAddress]    Script Date: 14/04/2020 10:53:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimAddress](
	[Address_ID] [int] IDENTITY(1,1) NOT NULL,
	[LSOA_code] [nvarchar](400) NULL,
	[LSOA_name] [nvarchar](200) NULL,
	[Borough_name] [nvarchar](500) NULL,
 CONSTRAINT [PK_DimAddress] PRIMARY KEY CLUSTERED 
(
	[Address_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/* ****************************************** Crime Dimension table creation************************************ */
USE [CrimeInLondon_DataWareHouse]
GO

/****** Object:  Table [dbo].[DimCrimeDetails]    Script Date: 14/04/2020 10:56:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimCrime](
	[Crime_ID] [int] IDENTITY(1,1) NOT NULL,
	[Crime_hashcode] [nvarchar](300) NULL,
	[Crime_type] [nvarchar](500) NULL,
	[Latest_outcome] [nvarchar](500) NULL,
 CONSTRAINT [PK_DimCrime] PRIMARY KEY CLUSTERED 
(
	[Crime_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/* ****************************************** Location Dimension table creation************************************ */
USE [CrimeInLondon_DataWareHouse]
GO

/****** Object:  Table [dbo].[DimLocation]    Script Date: 14/04/2020 10:59:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimLocation](
	[Location_ID] [int] IDENTITY(1,1) NOT NULL,
	[Longitude] [float] NULL,
	[Latitude] [float] NULL,
	[Location] [nvarchar](200) NULL,
 CONSTRAINT [PK_DimLocation] PRIMARY KEY CLUSTERED 
(
	[Location_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/* ****************************************** Police Force Dimension table creation************************************ */
USE [CrimeInLondon_DataWareHouse]
GO

/****** Object:  Table [dbo].[DimPoliceForce]    Script Date: 14/04/2020 11:02:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimPoliceForce](
	[Police_force_ID] [int] IDENTITY(1,1) NOT NULL,
	[Police_force] [nvarchar](200) NULL,
 CONSTRAINT [PK_DimPoliceForce] PRIMARY KEY CLUSTERED 
(
	[Police_force_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[DimCourtTimeframe](
	[Court_timeframe_ID] [int] IDENTITY(1,1) NOT NULL,
	[Court_timeframe] [nvarchar](200) NULL,
 CONSTRAINT [PK_DimCourtTimeframe] PRIMARY KEY CLUSTERED 
(
	[Court_timeframe_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/* ****************************************** Time Dimension table creation************************************ */
USE [CrimeInLondon_DataWareHouse]
GO

/****** Object:  Table [dbo].[DimTime]    Script Date: 14/04/2020 11:02:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimTime](
	[Time_ID] [int] IDENTITY(1,1) NOT NULL,
	[Crime_month] [int] NULL,
	[Crime_year] [int] NULL,
	[Month_name] [varchar](20) NULL,
	[Season_name] [varchar](20) NULL,
 CONSTRAINT [PK_DimTime] PRIMARY KEY CLUSTERED 
(
	[Time_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

 /* ****************************************** FactLondonCrime table creation************************************ */
USE [CrimeInLondon_DataWareHouse]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/* ****************************************** Sub Borough Dimension table creation************************************ */
USE [CrimeInLondon_DataWareHouse]
GO

CREATE TABLE [dbo].[DimSubBorough](
	[Sub_borough_ID] [int] IDENTITY(1,1) NOT NULL,
	[LSOA_code] [nvarchar](400) NULL,
	[LSOA_name] [nvarchar](200) NULL
 CONSTRAINT [PK_DimSubBorough] PRIMARY KEY CLUSTERED 
(
	[Sub_borough_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DimBorough]   ******/
CREATE TABLE [dbo].[DimBorough](
	[Borough_ID] [int] IDENTITY(1,1) NOT NULL,
	[Borough_name] [nvarchar](500) NULL,
 CONSTRAINT [PK_DimBorough] PRIMARY KEY CLUSTERED 
(
	[Borough_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DimCrimeStatus]   ******/
CREATE TABLE [dbo].[DimCrimeStatus](
	[Crime_status_ID] [int] IDENTITY(1,1) NOT NULL,
	[Crime_status] [nvarchar](20) NULL,
 CONSTRAINT [PK_DimCrimeStatus] PRIMARY KEY CLUSTERED 
(
	[Crime_status_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[DimCrimeType]   ******/
CREATE TABLE [dbo].[DimCrimeType](
	[Crime_type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Crime_type] [nvarchar](500) NULL,
 CONSTRAINT [PK_DimCrimeType] PRIMARY KEY CLUSTERED 
(
	[Crime_type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DimOutcomeType]   ******/
CREATE TABLE [dbo].[DimOutcomeType](
	[Outcome_type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Outcome_type] [nvarchar](500) NULL,
 CONSTRAINT [PK_DimOutcomeType] PRIMARY KEY CLUSTERED 
(
	[Outcome_type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/********************** FACT TABLE *****************************/
CREATE TABLE [dbo].[FactLondonCrime](
	[Borough_ID] [int] NULL,
	[Sub_borough_ID] [int] NULL,
	[Location_ID] [int] NULL,
	[Time_ID] [int] NULL,
	[Season_ID] [int] NULL,
	[Police_force_ID] [int] NULL,
	[Crime_type_ID] [int] NULL,
	[Outcome_type_ID] [int] NULL,
	[Total_crime_count] [int] NULL
) 
GO
