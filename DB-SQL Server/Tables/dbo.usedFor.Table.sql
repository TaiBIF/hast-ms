USE [HASTDB]
GO
/****** Object:  Table [dbo].[usedFor]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usedFor](
	[cID] [int] NULL,
	[sub_no] [int] NULL,
	[c_name] [nvarchar](30) NULL,
	[upperUsedForID] [int] NULL,
	[usedForID] [int] NOT NULL,
	[usedFor] [nvarchar](30) NULL,
 CONSTRAINT [PK_usedFor] PRIMARY KEY CLUSTERED 
(
	[usedForID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
