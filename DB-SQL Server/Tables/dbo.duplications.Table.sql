USE [HASTDB]
GO
/****** Object:  Table [dbo].[duplications]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[duplications](
	[SN] [int] NOT NULL,
	[dupID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[dupNo] [nvarchar](10) NULL,
	[greenhouse] [bit] NULL,
	[preparationDate] [smalldatetime] NULL,
	[DNANo] [smallint] NULL,
	[nameComment] [nvarchar](150) NULL,
	[lifeForm] [nvarchar](255) NULL,
	[plantH] [nvarchar](60) NULL,
	[flowerID] [smallint] NULL,
	[flowerColor] [nvarchar](255) NULL,
	[fruitsID] [smallint] NULL,
	[fruitColor] [nvarchar](255) NULL,
	[sexChar] [nvarchar](255) NULL,
	[statusID] [smallint] NULL,
	[addChar] [nvarchar](255) NULL,
	[addCharC] [nvarchar](255) NULL,
	[exchangeID] [smallint] NULL,
	[exchangeDept] [nvarchar](100) NULL,
	[updateDate] [smalldatetime] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_duplications] PRIMARY KEY CLUSTERED 
(
	[dupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[duplications]  WITH NOCHECK ADD  CONSTRAINT [repl_identity_range_A2F862E9_06D2_4EB6_A19A_40831A27AAA6] CHECK NOT FOR REPLICATION (([dupID]>(223506) AND [dupID]<=(224506) OR [dupID]>(224506) AND [dupID]<=(225506)))
GO
ALTER TABLE [dbo].[duplications] CHECK CONSTRAINT [repl_identity_range_A2F862E9_06D2_4EB6_A19A_40831A27AAA6]
GO
ALTER TABLE [dbo].[duplications] ADD  CONSTRAINT [MSmerge_df_rowguid_EACF31828DC1432C8126E6A85770EEC3]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
