USE [HASTDB]
GO
/****** Object:  Table [dbo].[dataOperator]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dataOperator](
	[建檔者代號] [nvarchar](10) NOT NULL,
	[建檔者詳細資料] [nvarchar](20) NULL,
	[英文名稱] [nvarchar](20) NULL,
	[密碼] [nvarchar](20) NULL,
	[權限等級] [smallint] NULL,
 CONSTRAINT [PK_dataOperator] PRIMARY KEY CLUSTERED 
(
	[建檔者代號] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
