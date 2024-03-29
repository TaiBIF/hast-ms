USE [HASTDB]
GO
/****** Object:  Table [dbo].[exchangeTo]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exchangeTo](
	[exchangeID] [smallint] NOT NULL,
	[exchangeTo] [nvarchar](15) NOT NULL,
	[交換狀況] [nvarchar](10) NULL,
	[newAdd] [bit] NOT NULL,
	[edited] [bit] NOT NULL,
	[rowguid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_exchangeTo] PRIMARY KEY CLUSTERED 
(
	[exchangeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
