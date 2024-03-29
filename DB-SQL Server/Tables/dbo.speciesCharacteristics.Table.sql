USE [HASTDB]
GO
/****** Object:  Table [dbo].[speciesCharacteristics]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[speciesCharacteristics](
	[speciesID] [int] NOT NULL,
	[characteristicID] [int] NOT NULL,
 CONSTRAINT [PK_speciesCharacteristics] PRIMARY KEY CLUSTERED 
(
	[speciesID] ASC,
	[characteristicID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
