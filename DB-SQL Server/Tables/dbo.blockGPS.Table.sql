USE [HASTDB]
GO
/****** Object:  Table [dbo].[blockGPS]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[blockGPS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[speciesID] [int] NULL,
	[speciesE] [nvarchar](200) NULL,
	[speciesC] [nvarchar](50) NULL,
	[collector] [nvarchar](50) NULL,
	[collectNo] [nvarchar](50) NULL
) ON [PRIMARY]
GO
