USE [HASTDB]
GO
/****** Object:  Table [dbo].[veget]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[veget](
	[vegetID] [smallint] NOT NULL,
	[typeC] [nvarchar](20) NULL,
	[vegetationTypeC] [nvarchar](30) NULL,
	[vegetationType] [nvarchar](100) NULL,
 CONSTRAINT [PK_veget] PRIMARY KEY CLUSTERED 
(
	[vegetID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
