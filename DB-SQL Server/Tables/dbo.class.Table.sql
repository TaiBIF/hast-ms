USE [HASTDB]
GO
/****** Object:  Table [dbo].[class]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[class](
	[classID] [smallint] NOT NULL,
	[classE] [nvarchar](20) NULL,
	[classC] [nvarchar](15) NULL,
 CONSTRAINT [PK_class] PRIMARY KEY CLUSTERED 
(
	[classID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
