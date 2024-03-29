USE [HASTDB]
GO
/****** Object:  Table [dbo].[institution]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[institution](
	[institutionID] [smallint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[institutionAbbr] [nvarchar](10) NOT NULL,
	[institutionE] [nvarchar](150) NULL,
	[institutionC] [nvarchar](50) NULL,
	[note] [nvarchar](150) NULL,
	[website] [nvarchar](255) NULL,
	[country2Code] [nvarchar](2) NULL,
 CONSTRAINT [PK_institution] PRIMARY KEY CLUSTERED 
(
	[institutionAbbr] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
