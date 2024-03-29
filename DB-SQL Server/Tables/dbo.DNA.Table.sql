USE [HASTDB]
GO
/****** Object:  Table [dbo].[DNA]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DNA](
	[DNANo] [smallint] NOT NULL,
	[DNA] [nvarchar](100) NULL,
 CONSTRAINT [PK_DNA] PRIMARY KEY CLUSTERED 
(
	[DNANo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
