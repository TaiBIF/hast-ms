USE [HASTDB]
GO
/****** Object:  Table [dbo].[checkup]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[checkup](
	[CKSN] [nvarchar](15) NOT NULL,
	[collectorID] [smallint] NULL,
	[collectNum1] [int] NULL,
	[collectNum2] [nvarchar](15) NULL,
	[storedSiteID] [tinyint] NULL,
	[blnBored] [bit] NULL,
	[blnDestroyed] [bit] NULL,
	[blnNoFlwFruit] [bit] NULL,
	[ckDate] [smalldatetime] NULL,
	[voidDate] [smalldatetime] NULL,
	[hastSN] [int] NULL,
	[note] [nvarchar](50) NULL,
 CONSTRAINT [PK_checkup] PRIMARY KEY CLUSTERED 
(
	[CKSN] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
