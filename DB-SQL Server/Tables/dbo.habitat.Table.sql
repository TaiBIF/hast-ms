USE [HASTDB]
GO
/****** Object:  Table [dbo].[habitat]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[habitat](
	[habitatID] [smallint] NOT NULL,
	[habitat] [nvarchar](80) NULL,
	[habitatC] [nvarchar](30) NULL,
 CONSTRAINT [PK_habitat] PRIMARY KEY CLUSTERED 
(
	[habitatID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
