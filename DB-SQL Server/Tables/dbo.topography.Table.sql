USE [HASTDB]
GO
/****** Object:  Table [dbo].[topography]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[topography](
	[topogarphyID] [smallint] NOT NULL,
	[topography] [nvarchar](80) NULL,
	[topographyC] [nvarchar](20) NULL,
 CONSTRAINT [PK_topography] PRIMARY KEY CLUSTERED 
(
	[topogarphyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
