USE [HASTDB]
GO
/****** Object:  Table [dbo].[areaCollection]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[areaCollection](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[listID] [int] NOT NULL,
	[SN] [int] NOT NULL,
 CONSTRAINT [PK_areaCollection] PRIMARY KEY CLUSTERED 
(
	[listID] ASC,
	[SN] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
