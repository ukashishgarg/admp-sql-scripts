USE [CrimeInLondon_DWHDesign]
GO

/****** Object:  Table [dbo].[DimBorough]    Script Date: 25/04/2020 07:33:43 ******/
CREATE TABLE [dbo].[DimBorough](
	[Borough_ID] [int] IDENTITY(1,1) NOT NULL,
	[Borough_name] [nvarchar](500) NULL,
 CONSTRAINT [PK_DimBorough] PRIMARY KEY CLUSTERED 
(
	[Borough_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DimCrimeStatus]    Script Date: 25/04/2020 07:36:04 ******/
CREATE TABLE [dbo].[DimCrimeStatus](
	[Crime_status_ID] [int] IDENTITY(1,1) NOT NULL,
	[Crime_status] [nvarchar](20) NULL,
 CONSTRAINT [PK_DimCrimeStatus] PRIMARY KEY CLUSTERED 
(
	[Crime_status_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DimCrimeType]    Script Date: 25/04/2020 07:36:30 ******/
CREATE TABLE [dbo].[DimCrimeType](
	[Crime_type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Crime_type] [nvarchar](500) NULL,
 CONSTRAINT [PK_DimCrimeType] PRIMARY KEY CLUSTERED 
(
	[Crime_type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DimLocation]    Script Date: 25/04/2020 07:36:47 ******/
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

/****** Object:  Table [dbo].[DimOutcomeType]    Script Date: 25/04/2020 07:37:00 ******/
CREATE TABLE [dbo].[DimOutcomeType](
	[Outcome_type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Outcome_type] [nvarchar](500) NULL,
 CONSTRAINT [PK_DimOutcomeType] PRIMARY KEY CLUSTERED 
(
	[Outcome_type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DimSubBorough]    Script Date: 25/04/2020 07:38:16 ******/
CREATE TABLE [dbo].[DimSubBorough](
	[Sub_borough_ID] [int] IDENTITY(1,1) NOT NULL,
	[LSOA_code] [nvarchar](400) NULL,
	[LSOA_name] [nvarchar](200) NULL,
 CONSTRAINT [PK_DimSubBorough] PRIMARY KEY CLUSTERED 
(
	[Sub_borough_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DimTime]    Script Date: 25/04/2020 07:38:30 ******/
CREATE TABLE [dbo].[DimTime](
	[Time_ID] [int] NOT NULL,
	[Month] [int] NULL,
	[Year] [int] NULL,
	[Month_name] [varchar](20) NULL,
	[Season_name] [varchar](20) NULL,
 CONSTRAINT [PK_DimTime] PRIMARY KEY CLUSTERED 
(
	[Time_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[FactLondonCrime01]    Script Date: 25/04/2020 07:39:03 ******/
CREATE TABLE [dbo].[FactLondonCrime01](
	[Time_ID] [int] NULL,
	[Borough_ID] [int] NULL,
	[Sub_borough_ID] [int] NULL,
	[Location_ID] [int] NULL,
	[Crime_count] [int] NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[FactLondonCrime02]    Script Date: 25/04/2020 07:39:15 ******/
CREATE TABLE [dbo].[FactLondonCrime02](
	[Time_ID] [int] NULL,
	[Outcome_type_ID] [int] NULL,
	[Crime_status_ID] [int] NULL,
	[Crime_count] [int] NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[FactLondonCrime03]    Script Date: 25/04/2020 07:39:59 ******/
CREATE TABLE [dbo].[FactLondonCrime03](
	[Time_ID] [int] NULL,
	[Crime_count] [int] NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[FactLondonCrime04]    Script Date: 25/04/2020 07:40:31 ******/
CREATE TABLE [dbo].[FactLondonCrime04](
	[Time_ID] [int] NULL,
	[Crime_type_ID] [int] NULL,
	[Crime_count] [int] NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[FactLondonCrime05]    Script Date: 25/04/2020 07:40:44 ******/
CREATE TABLE [dbo].[FactLondonCrime05](
	[Time_ID] [int] NULL,
	[Borough_ID] [int] NULL,
	[Location_ID] [int] NULL,
	[Crime_type_ID] [int] NULL,
	[Crime_count] [int] NULL
) ON [PRIMARY]
GO



