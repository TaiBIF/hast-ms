USE [HASTDB]
GO
/****** Object:  Table [dbo].[province]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[province](
	[provinceNo] [int] IDENTITY(1,1) NOT NULL,
	[代號] [smallint] NULL,
	[countryNo] [smallint] NOT NULL,
	[provinceC] [nvarchar](30) NULL,
	[provinceE] [nvarchar](40) NOT NULL,
	[provinceAbbr] [nvarchar](10) NULL,
	[new] [bit] NOT NULL,
 CONSTRAINT [PK_province] PRIMARY KEY CLUSTERED 
(
	[provinceNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
