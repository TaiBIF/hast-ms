USE [HASTDB]
GO
/****** Object:  Table [dbo].[speciesDescriptions]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[speciesDescriptions](
	[speciesID] [int] NOT NULL,
	[characterID] [int] IDENTITY(1,1) NOT NULL,
	[characteristicC] [nvarchar](4000) NULL,
	[characteristicE] [nvarchar](4000) NULL,
	[distributionWC] [nvarchar](1000) NULL,
	[distributionWE] [nvarchar](1000) NULL,
	[distributionTC] [nvarchar](1000) NULL,
	[distributionTE] [nvarchar](1000) NULL,
	[plantID] [int] NULL,
	[category] [nvarchar](20) NULL,
 CONSTRAINT [PK_speciesDescriptions] PRIMARY KEY CLUSTERED 
(
	[characterID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
