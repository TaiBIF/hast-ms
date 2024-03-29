USE [HASTDB]
GO
/****** Object:  Table [dbo].[lifeForm]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lifeForm](
	[lifeFormID] [smallint] NOT NULL,
	[lifeForm] [nvarchar](70) NULL,
	[lifeFormC] [nvarchar](30) NULL,
 CONSTRAINT [PK_lifeForm] PRIMARY KEY CLUSTERED 
(
	[lifeFormID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
