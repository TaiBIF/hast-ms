USE [HASTDB]
GO
/****** Object:  Table [dbo].[light]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[light](
	[lightID] [smallint] NOT NULL,
	[lightIntensity] [nvarchar](30) NULL,
	[lightC] [nvarchar](30) NULL,
	[newAdd] [bit] NOT NULL,
	[edited] [bit] NOT NULL,
 CONSTRAINT [PK_light] PRIMARY KEY CLUSTERED 
(
	[lightID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
