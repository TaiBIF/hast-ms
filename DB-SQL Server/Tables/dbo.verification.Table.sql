USE [HASTDB]
GO
/****** Object:  Table [dbo].[verification]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[verification](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SN] [int] NOT NULL,
	[verificationNo] [smallint] NOT NULL,
	[verificationDate] [datetime] NULL,
	[familyID] [smallint] NULL,
	[genusID] [smallint] NULL,
	[speciesID] [int] NULL,
	[verifierId] [smallint] NULL,
	[taxonomic] [nvarchar](255) NULL,
	[unformedVDate] [nvarchar](9) NULL,
	[creationDate] [smalldatetime] NULL,
	[dataOperator] [nvarchar](20) NULL,
	[updateDate] [smalldatetime] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_verification] PRIMARY KEY CLUSTERED 
(
	[SN] ASC,
	[verificationNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[verification]  WITH NOCHECK ADD  CONSTRAINT [repl_identity_range_F162FFCC_438E_4713_82EB_FCA77E969494] CHECK NOT FOR REPLICATION (([ID]>(354803) AND [ID]<=(355803) OR [ID]>(355803) AND [ID]<=(356803)))
GO
ALTER TABLE [dbo].[verification] CHECK CONSTRAINT [repl_identity_range_F162FFCC_438E_4713_82EB_FCA77E969494]
GO
ALTER TABLE [dbo].[verification] ADD  CONSTRAINT [MSmerge_df_rowguid_DE08B95C5DCC4E928648B256C27EE418]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
