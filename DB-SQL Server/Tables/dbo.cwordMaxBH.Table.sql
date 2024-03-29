USE [HASTDB]
GO
/****** Object:  Table [dbo].[cwordMaxBH]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cwordMaxBH](
	[strokeID] [int] NOT NULL,
	[cword] [nvarchar](2) NULL,
	[stroke] [nchar](12) NULL,
 CONSTRAINT [PK_cwordMaxBH] PRIMARY KEY CLUSTERED 
(
	[strokeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
