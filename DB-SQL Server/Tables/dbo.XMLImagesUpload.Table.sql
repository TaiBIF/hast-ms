USE [HASTDB]
GO
/****** Object:  Table [dbo].[XMLImagesUpload]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XMLImagesUpload](
	[imageCode] [nvarchar](15) NOT NULL,
	[uploadDate] [smalldatetime] NULL,
 CONSTRAINT [PK_XMLImageUpload] PRIMARY KEY CLUSTERED 
(
	[imageCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
