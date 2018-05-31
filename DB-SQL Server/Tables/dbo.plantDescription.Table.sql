USE [HASTDB]
GO
/****** Object:  Table [dbo].[plantDescription]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[plantDescription](
	[SID] [int] NULL,
	[descriptionID] [int] NULL,
	[plantID] [int] NULL,
	[speciesCz] [nvarchar](30) NULL,
	[speciesID] [int] NULL,
	[photo] [nvarchar](30) NULL,
	[alterName] [nvarchar](200) NULL,
	[description] [nvarchar](255) NULL
) ON [PRIMARY]
GO
