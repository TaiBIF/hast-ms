USE [HASTDB]
GO
/****** Object:  Table [dbo].[abundance]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[abundance](
	[abundanceID] [smallint] NOT NULL,
	[abundance] [nvarchar](30) NULL,
	[abundanceC] [nvarchar](20) NULL,
	[newAdd] [bit] NOT NULL,
	[edited] [bit] NOT NULL,
 CONSTRAINT [PK_abundance] PRIMARY KEY CLUSTERED 
(
	[abundanceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
