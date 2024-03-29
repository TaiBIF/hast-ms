USE [HASTDB]
GO
/****** Object:  Table [dbo].[division]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[division](
	[divisionID] [smallint] NOT NULL,
	[divisionE] [nvarchar](15) NULL,
	[divisionC] [nvarchar](15) NULL,
 CONSTRAINT [PK_division] PRIMARY KEY CLUSTERED 
(
	[divisionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
