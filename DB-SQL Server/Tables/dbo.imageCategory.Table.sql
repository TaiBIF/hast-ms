USE [HASTDB]
GO
/****** Object:  Table [dbo].[imageCategory]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[imageCategory](
	[categoryID] [int] NOT NULL,
	[categoryE] [nvarchar](20) NULL,
	[categoryC] [nvarchar](20) NULL,
 CONSTRAINT [PK_imageCategory] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
