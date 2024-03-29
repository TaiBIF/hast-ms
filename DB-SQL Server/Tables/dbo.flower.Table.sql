USE [HASTDB]
GO
/****** Object:  Table [dbo].[flower]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[flower](
	[flowerID] [smallint] NOT NULL,
	[flower] [nvarchar](30) NULL,
	[flowerC] [nvarchar](15) NULL,
	[recordDate] [datetime] NULL,
	[createDate] [datetime] NULL,
 CONSTRAINT [PK_flower] PRIMARY KEY CLUSTERED 
(
	[flowerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
