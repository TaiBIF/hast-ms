USE [HASTDB]
GO
/****** Object:  Table [dbo].[countryISO]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[countryISO](
	[countryE] [nvarchar](50) NOT NULL,
	[country2Code] [nvarchar](2) NOT NULL,
	[country3Code] [nvarchar](3) NOT NULL,
	[NumericCode] [smallint] NOT NULL,
	[countryC] [nvarchar](20) NOT NULL,
	[country] [nvarchar](50) NULL,
	[countryNo] [smallint] NULL,
	[note] [nvarchar](200) NULL,
 CONSTRAINT [PK_countryISO] PRIMARY KEY CLUSTERED 
(
	[country2Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
