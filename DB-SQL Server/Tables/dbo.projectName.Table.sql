USE [HASTDB]
GO
/****** Object:  Table [dbo].[projectName]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[projectName](
	[projectID] [smallint] NOT NULL,
	[projectName] [nvarchar](400) NULL,
	[addNew] [bit] NOT NULL,
	[edited] [bit] NOT NULL,
 CONSTRAINT [PK_projectName] PRIMARY KEY CLUSTERED 
(
	[projectID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
