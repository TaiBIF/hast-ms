USE [HASTDB]
GO
/****** Object:  Table [dbo].[fruitColor]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fruitColor](
	[fruitColorID] [smallint] NOT NULL,
	[fruitColorC] [nvarchar](30) NULL,
	[fruitColor] [nvarchar](50) NULL,
	[addNew] [bit] NOT NULL,
 CONSTRAINT [PK_fruitColor] PRIMARY KEY CLUSTERED 
(
	[fruitColorID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
