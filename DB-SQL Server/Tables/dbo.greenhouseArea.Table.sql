USE [HASTDB]
GO
/****** Object:  Table [dbo].[greenhouseArea]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[greenhouseArea](
	[areaID] [int] NOT NULL,
	[greenhouseArea] [nvarchar](50) NULL,
 CONSTRAINT [PK_greenhouseArea] PRIMARY KEY CLUSTERED 
(
	[areaID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
