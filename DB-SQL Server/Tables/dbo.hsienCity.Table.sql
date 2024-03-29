USE [HASTDB]
GO
/****** Object:  Table [dbo].[hsienCity]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hsienCity](
	[provinceNo] [int] NULL,
	[hsienNo] [int] IDENTITY(1,1) NOT NULL,
	[代號] [float] NULL,
	[hsienCityC] [nvarchar](30) NULL,
	[hsienCityE] [nvarchar](30) NOT NULL,
	[newAdd] [bit] NOT NULL,
	[updated] [bit] NOT NULL,
 CONSTRAINT [PK_hsienCity] PRIMARY KEY CLUSTERED 
(
	[hsienNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
