USE [HASTDB]
GO
/****** Object:  Table [dbo].[typeSpecimen]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[typeSpecimen](
	[id] [smallint] NOT NULL,
	[specimenOrderNum] [int] NOT NULL,
	[typeCateID] [tinyint] NULL,
	[inStorage] [bit] NULL,
	[isArchived] [bit] NULL,
	[dgImage] [bit] NULL,
	[note] [nvarchar](200) NULL,
	[reference] [nvarchar](150) NULL,
	[literaryLink] [nvarchar](150) NULL,
	[editDate] [smalldatetime] NULL,
	[editor] [nvarchar](10) NULL,
	[storageADD] [nvarchar](10) NULL,
	[onWebsite] [bit] NULL,
	[webVerificationNo] [smallint] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_typeSpecimen] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [AK_specimenOrderNum] UNIQUE NONCLUSTERED 
(
	[specimenOrderNum] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[typeSpecimen] ADD  CONSTRAINT [MSmerge_df_rowguid_6C4ED6F9E6FF4F1F9A005EE0FE7A7861]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
