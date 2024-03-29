USE [HASTDB]
GO
/****** Object:  Table [dbo].[plantUses]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[plantUses](
	[usesID] [int] NOT NULL,
	[speciesID] [int] NULL,
	[describeUseID] [int] NULL,
	[describePlantID] [int] NULL,
	[usedForID] [int] NULL,
	[caption] [nvarchar](20) NULL,
	[photoUse] [nvarchar](30) NULL,
	[photoLife] [nvarchar](30) NULL,
	[itemNo] [int] NULL,
	[speciesC] [nvarchar](30) NULL,
	[descriptionX] [nvarchar](255) NULL,
	[SID] [int] NULL,
	[familyC] [nvarchar](20) NULL,
	[classU] [int] NULL,
	[subjectNo] [int] NULL,
	[width] [nvarchar](10) NULL,
	[height] [nvarchar](10) NULL,
 CONSTRAINT [PK_plantUses] PRIMARY KEY CLUSTERED 
(
	[usesID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
