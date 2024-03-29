USE [HASTDB]
GO
/****** Object:  Table [dbo].[specImgFile]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[specImgFile](
	[SpecimenOrderNum] [int] NULL,
	[NDAPdisk] [char](14) NULL,
	[specFile] [char](6) NULL,
	[diskNo] [smallint] NULL,
	[note] [varchar](50) NULL,
	[fileMaker] [nvarchar](8) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_specImgFile] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
