USE [HASTDB]
GO
/****** Object:  Table [dbo].[characteristics]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[characteristics](
	[characteristicID] [int] IDENTITY(1,1) NOT NULL,
	[levelID] [int] NULL,
	[upperID] [int] NULL,
	[characteristicC] [nvarchar](30) NULL,
	[characteristicE] [nvarchar](50) NULL,
	[singleValue] [bit] NULL,
 CONSTRAINT [PK_characteristics] PRIMARY KEY CLUSTERED 
(
	[characteristicID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
