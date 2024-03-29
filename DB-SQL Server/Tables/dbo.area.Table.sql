USE [HASTDB]
GO
/****** Object:  Table [dbo].[area]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[area](
	[areaID] [int] IDENTITY(1,1) NOT NULL,
	[sourceTable] [nvarchar](30) NOT NULL,
	[oLocalityID] [int] NOT NULL,
 CONSTRAINT [PK_area] PRIMARY KEY CLUSTERED 
(
	[sourceTable] ASC,
	[oLocalityID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
