USE [HASTDB]
GO
/****** Object:  Table [dbo].[flowerColor]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[flowerColor](
	[flowerColorID] [smallint] NOT NULL,
	[flowerColorC] [nvarchar](30) NULL,
	[flowerColor] [nvarchar](50) NULL,
	[addNew] [bit] NOT NULL,
 CONSTRAINT [PK_flowerColor] PRIMARY KEY CLUSTERED 
(
	[flowerColorID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
