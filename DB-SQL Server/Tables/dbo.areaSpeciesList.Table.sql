USE [HASTDB]
GO
/****** Object:  Table [dbo].[areaSpeciesList]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[areaSpeciesList](
	[listID] [int] IDENTITY(1,1) NOT NULL,
	[areaID] [int] NOT NULL,
	[speciesID] [int] NOT NULL,
	[projectID] [int] NULL,
 CONSTRAINT [PK_areaSpeciesList] PRIMARY KEY CLUSTERED 
(
	[areaID] ASC,
	[speciesID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
