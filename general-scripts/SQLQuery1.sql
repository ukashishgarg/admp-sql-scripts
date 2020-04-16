USE [CrimeInLondon_DataWareHouse]
GO

/****** Object:  Table [dbo].[DimCrimeType]    Script Date: 12/04/2020 18:37:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimCrimeDetails](
	[Crime_ID] [int] IDENTITY(1,1) NOT NULL,
	[Crime_hash_ID] [nvarchar](200) NULL,
	[Crime_type] [nvarchar](500) NULL,
 CONSTRAINT [PK_DimCrimeDetails] PRIMARY KEY CLUSTERED 
(
	[Crime_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

