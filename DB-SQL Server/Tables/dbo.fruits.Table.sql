USE [HASTDB]
GO
/****** Object:  Table [dbo].[fruits]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fruits](
	[fruitsID] [smallint] NOT NULL,
	[fruitsC] [nvarchar](30) NULL,
	[fruits] [nvarchar](50) NULL,
	[addNew] [bit] NOT NULL,
	[edited] [bit] NOT NULL,
 CONSTRAINT [PK_fruits] PRIMARY KEY CLUSTERED 
(
	[fruitsID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
