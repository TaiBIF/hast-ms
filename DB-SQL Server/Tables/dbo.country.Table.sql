USE [HASTDB]
GO
/****** Object:  Table [dbo].[country]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[country](
	[countryNo] [smallint] IDENTITY(1,1) NOT NULL,
	[countryE] [nvarchar](70) NULL,
	[country] [nvarchar](50) NOT NULL,
	[countryC] [nvarchar](20) NULL,
	[note] [nvarchar](200) NULL,
	[countryNoOld] [smallint] NULL,
	[country2Code] [nvarchar](2) NULL,
	[country3Code] [nvarchar](3) NULL,
	[ISONumericCode] [smallint] NULL,
 CONSTRAINT [PK_country] PRIMARY KEY CLUSTERED 
(
	[country] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
