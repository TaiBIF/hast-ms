USE [HASTDB]
GO
/****** Object:  Table [dbo].[images]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[images](
	[SN] [int] NULL,
	[imageCode] [nvarchar](15) NOT NULL,
	[creationOperator] [nvarchar](10) NULL,
	[imgAuthorID] [smallint] NULL,
	[providerID] [smallint] NULL,
	[photoDate] [smalldatetime] NULL,
	[note] [nvarchar](255) NULL,
	[creationDate] [smalldatetime] NULL,
	[updateDate] [smalldatetime] NULL,
	[dataReviser] [nvarchar](10) NULL,
	[sourceID] [tinyint] NULL,
	[categoryID] [tinyint] NULL,
	[greenhouse] [bit] NULL,
	[publicWeb] [bit] NULL,
	[wholePlant] [bit] NULL,
	[root] [bit] NULL,
	[stem] [bit] NULL,
	[leaf] [bit] NULL,
	[flower] [bit] NULL,
	[fruit] [bit] NULL,
	[seed] [bit] NULL,
	[sorus] [bit] NULL,
	[pistillateFlower] [bit] NULL,
	[staminateFlower] [bit] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_images] PRIMARY KEY CLUSTERED 
(
	[imageCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[images] ADD  CONSTRAINT [MSmerge_df_rowguid_10325F261F414B62BE347D5BB622791A]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
