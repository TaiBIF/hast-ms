USE [HASTDB]
GO
/****** Object:  Table [dbo].[speciesList]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[speciesList](
	[classID] [smallint] NOT NULL,
	[classE] [nvarchar](20) NULL,
	[classC] [nvarchar](15) NULL,
	[familyID] [int] NOT NULL,
	[familyE] [nvarchar](40) NOT NULL,
	[familyC] [nvarchar](20) NULL,
	[familyExpr] [nvarchar](61) NULL,
	[genusID] [int] NOT NULL,
	[genusE] [nvarchar](30) NOT NULL,
	[genusC] [nvarchar](25) NULL,
	[genusExpr] [nvarchar](56) NULL,
	[speciesID] [int] NOT NULL,
	[speciesE] [nvarchar](130) NOT NULL,
	[speciesC] [nvarchar](60) NULL,
	[speciesExpr] [nvarchar](191) NULL
) ON [PRIMARY]
GO
