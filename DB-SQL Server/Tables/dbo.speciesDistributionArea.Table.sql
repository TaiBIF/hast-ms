USE [HASTDB]
GO
/****** Object:  Table [dbo].[speciesDistributionArea]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[speciesDistributionArea](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[speciesID] [int] NOT NULL,
	[areaID] [int] NOT NULL,
	[distributionAC] [nvarchar](1000) NULL,
	[distributionAE] [nvarchar](1000) NULL,
 CONSTRAINT [PK_speciesDistributionArea] PRIMARY KEY CLUSTERED 
(
	[speciesID] ASC,
	[areaID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
