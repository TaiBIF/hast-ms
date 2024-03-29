USE [HASTDB]
GO
/****** Object:  Table [dbo].[locality]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[locality](
	[localityID] [int] IDENTITY(1,1) NOT NULL,
	[locality] [nvarchar](50) NULL,
	[localityC] [nvarchar](30) NULL,
	[中英文] [nvarchar](100) NULL,
 CONSTRAINT [PK_locality] PRIMARY KEY CLUSTERED 
(
	[localityID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
