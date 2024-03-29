USE [HASTDB]
GO
/****** Object:  Table [dbo].[nationalPark]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nationalPark](
	[parkNo] [smallint] IDENTITY(1,1) NOT NULL,
	[parkZone] [smallint] NULL,
	[parkC] [nvarchar](30) NULL,
	[parkE] [nvarchar](60) NOT NULL,
	[newAdd] [bit] NOT NULL,
 CONSTRAINT [PK_nationalPark] PRIMARY KEY CLUSTERED 
(
	[parkNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
