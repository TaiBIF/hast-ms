USE [HASTDB]
GO
/****** Object:  Table [dbo].[characteristicName]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[characteristicName](
	[charactID] [int] NULL,
	[characteristic] [nvarchar](30) NULL,
	[classID] [int] NULL
) ON [PRIMARY]
GO
