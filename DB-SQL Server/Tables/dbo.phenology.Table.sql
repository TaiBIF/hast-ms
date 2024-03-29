USE [HASTDB]
GO
/****** Object:  Table [dbo].[phenology]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phenology](
	[phenologyFID] [smallint] NOT NULL,
	[phenologyC] [nvarchar](15) NULL,
	[phenology] [nvarchar](30) NULL,
	[addNew] [bit] NOT NULL,
	[edited] [bit] NOT NULL,
 CONSTRAINT [PK_phenology] PRIMARY KEY CLUSTERED 
(
	[phenologyFID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
