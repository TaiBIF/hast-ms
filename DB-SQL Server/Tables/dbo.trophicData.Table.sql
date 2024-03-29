USE [HASTDB]
GO
/****** Object:  Table [dbo].[trophicData]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trophicData](
	[ID] [smallint] NOT NULL,
	[SN] [int] NOT NULL,
	[trophicID] [tinyint] NULL,
	[hostFamilyID] [smallint] NULL,
	[hostGenusID] [smallint] NULL,
	[hostSpeciesID] [int] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_trophicData] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[trophicData] ADD  CONSTRAINT [MSmerge_df_rowguid_29B070D22DCE4031994D5BE9C6EEAAAE]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
