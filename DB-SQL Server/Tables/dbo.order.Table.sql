USE [HASTDB]
GO
/****** Object:  Table [dbo].[order]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[classHASTNo] [smallint] NOT NULL,
	[orderID] [smallint] NOT NULL,
	[orderE] [nvarchar](30) NOT NULL,
	[orderC] [nvarchar](20) NULL,
	[note] [nvarchar](5) NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
