USE [HASTDB]
GO
/****** Object:  Table [dbo].[SwitchboardCheckup]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SwitchboardCheckup](
	[SwitchboardID] [int] NULL,
	[ItemNumber] [smallint] NULL,
	[ItemText] [nvarchar](30) NULL,
	[Command] [smallint] NULL,
	[Argument] [nvarchar](25) NULL,
	[ID] [int] NOT NULL,
	[rowguid] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
