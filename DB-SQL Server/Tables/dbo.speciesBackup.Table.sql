USE [HASTDB]
GO
/****** Object:  Table [dbo].[speciesBackup]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[speciesBackup](
	[genusID] [int] NULL,
	[speciesID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[speciesE] [nvarchar](130) NOT NULL,
	[speciesC] [nvarchar](60) NULL,
	[vpCode] [nvarchar](12) NULL,
	[officialVPCode] [nvarchar](12) NULL,
	[checkerID] [int] NULL,
	[dataRecorder] [nvarchar](15) NULL,
	[reviewer] [nvarchar](15) NULL,
	[recordDate] [datetime] NULL,
	[updateDate] [datetime] NULL,
	[correction] [nvarchar](100) NULL,
	[attributeNo] [smallint] NULL,
	[speciesNo] [nvarchar](3) NULL,
	[varietyNo] [nvarchar](1) NULL,
	[reference] [nvarchar](100) NULL,
	[referenceLink] [nvarchar](200) NULL,
	[SNPLiterature] [nvarchar](100) NULL,
	[SNPLiteratureLink] [nvarchar](200) NULL,
	[note] [nvarchar](50) NULL,
	[unicodeChar] [nvarchar](15) NULL,
	[informal] [bit] NULL,
	[twFlora] [bit] NULL,
	[publicData] [bit] NULL,
	[flora2] [bit] NULL,
	[manualTWVP] [bit] NULL,
	[protologue] [nvarchar](200) NULL,
	[protologueLink] [nvarchar](200) NULL,
	[distribution] [nvarchar](50) NULL,
	[continent] [nvarchar](30) NULL,
	[acceptedName] [nvarchar](50) NULL,
	[sectionID] [nvarchar](20) NULL,
	[sectionName] [nvarchar](30) NULL,
 CONSTRAINT [PK_species] PRIMARY KEY CLUSTERED 
(
	[speciesE] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
