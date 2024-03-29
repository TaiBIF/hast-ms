USE [HASTDB]
GO
/****** Object:  Table [dbo].[trophic]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trophic](
	[trophicID] [smallint] NOT NULL,
	[trophic] [nvarchar](20) NULL,
	[trophicC] [nvarchar](20) NULL,
	[newAdd] [bit] NOT NULL,
	[edited] [bit] NOT NULL,
 CONSTRAINT [PK_trophic] PRIMARY KEY CLUSTERED 
(
	[trophicID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
