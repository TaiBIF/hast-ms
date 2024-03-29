USE [HASTDB]
GO
/****** Object:  Table [dbo].[hast]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hast](
	[SN] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[creationOperator] [nvarchar](20) NULL,
	[creationDate] [smalldatetime] NULL,
	[updateDate] [smalldatetime] NULL,
	[dataReviser] [nvarchar](20) NULL,
	[collectorID] [smallint] NULL,
	[collectNum1] [int] NULL,
	[collectNum2] [nvarchar](20) NULL,
	[collectionDate] [datetime] NULL,
	[recordTimeStamp] [smalldatetime] NULL,
	[companion] [nvarchar](150) NULL,
	[companionE] [nvarchar](150) NULL,
	[countryNo] [smallint] NULL,
	[provinceNo] [smallint] NULL,
	[hsienNo] [smallint] NULL,
	[townNo] [smallint] NULL,
	[localityID] [smallint] NULL,
	[parkNo] [smallint] NULL,
	[additionalDesc] [nvarchar](255) NULL,
	[additionalDescE] [nvarchar](255) NULL,
	[WGS84Lng] [decimal](9, 6) NULL,
	[WGS84Lat] [decimal](8, 6) NULL,
	[alt] [smallint] NULL,
	[altx] [smallint] NULL,
	[veget] [nvarchar](200) NULL,
	[topography] [nvarchar](100) NULL,
	[habitat] [nvarchar](255) NULL,
	[naturalnessID] [smallint] NULL,
	[lightID] [smallint] NULL,
	[humidityID] [smallint] NULL,
	[abundanceID] [smallint] NULL,
	[projectID] [smallint] NULL,
	[note] [nvarchar](255) NULL,
	[noteE] [nvarchar](255) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_hast] PRIMARY KEY CLUSTERED 
(
	[SN] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[hast]  WITH NOCHECK ADD  CONSTRAINT [repl_identity_range_CEABB980_0AEB_47B0_974D_E531825D5C82] CHECK NOT FOR REPLICATION (([SN]>(212043) AND [SN]<=(213043) OR [SN]>(213043) AND [SN]<=(214043)))
GO
ALTER TABLE [dbo].[hast] CHECK CONSTRAINT [repl_identity_range_CEABB980_0AEB_47B0_974D_E531825D5C82]
GO
ALTER TABLE [dbo].[hast] ADD  CONSTRAINT [MSmerge_df_rowguid_8F80D81A5D6148418DBA3E6506568DFD]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
