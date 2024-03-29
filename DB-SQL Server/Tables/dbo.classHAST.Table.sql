USE [HASTDB]
GO
/****** Object:  Table [dbo].[classHAST]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[classHAST](
	[class] [smallint] NOT NULL,
	[divisionID] [smallint] NOT NULL,
	[classID] [smallint] NOT NULL,
	[classE] [nvarchar](20) NULL,
	[classC] [nvarchar](20) NULL,
 CONSTRAINT [PK_classHAST] PRIMARY KEY CLUSTERED 
(
	[classID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
