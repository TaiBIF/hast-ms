USE [HASTDB]
GO
/****** Object:  Table [dbo].[greenhouse]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[greenhouse](
	[potID] [nvarchar](9) NOT NULL,
	[areaID] [int] NULL,
	[hastSNA] [int] NULL,
	[collectorID_A] [int] NULL,
	[collectNumA1] [int] NULL,
	[collectNumA2] [nvarchar](20) NULL,
	[hastSNB] [int] NULL,
	[collectorID_B] [int] NULL,
	[collectNumB1] [int] NULL,
	[collectNumB2] [nvarchar](20) NULL,
	[removeID] [int] NULL,
	[DNAExp] [nvarchar](50) NULL,
	[chromosome] [nvarchar](50) NULL,
	[source] [nvarchar](50) NULL,
	[note] [nvarchar](100) NULL,
	[code] [int] NULL,
	[POT] [int] NULL,
	[採集號] [nvarchar](50) NULL,
	[採集者一代號] [nvarchar](20) NULL,
	[採集者二代號] [nvarchar](20) NULL,
	[野外標本] [nvarchar](20) NULL,
	[fieldSpecimen] [bit] NULL,
	[溫室標本] [nvarchar](20) NULL,
	[greenHouseSpecimen] [bit] NULL,
	[採集地] [nvarchar](100) NULL,
	[學名] [nvarchar](50) NULL,
	[greenhouseArea] [nvarchar](50) NULL,
	[country] [nvarchar](50) NULL,
	[sectionE] [nvarchar](50) NULL,
	[originalData] [nvarchar](255) NULL,
	[plantDate] [datetime] NULL,
 CONSTRAINT [PK_greenhouse] PRIMARY KEY CLUSTERED 
(
	[potID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
