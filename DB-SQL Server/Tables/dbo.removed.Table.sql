USE [HASTDB]
GO
/****** Object:  Table [dbo].[removed]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[removed](
	[removeID] [int] IDENTITY(1,1) NOT NULL,
	[removed] [nvarchar](10) NULL,
 CONSTRAINT [PK_removed] PRIMARY KEY CLUSTERED 
(
	[removeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
