USE [HASTDB]
GO
/****** Object:  Table [dbo].[plantStatus]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[plantStatus](
	[statusID] [smallint] NOT NULL,
	[planStatusE] [nvarchar](15) NULL,
	[planStatusC] [nvarchar](10) NULL,
 CONSTRAINT [PK_plantStatus] PRIMARY KEY CLUSTERED 
(
	[statusID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
