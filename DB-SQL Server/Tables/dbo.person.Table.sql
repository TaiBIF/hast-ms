USE [HASTDB]
GO
/****** Object:  Table [dbo].[person]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[person](
	[pid] [smallint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[lastName] [nvarchar](50) NOT NULL,
	[firstName] [nvarchar](21) NULL,
	[nameC] [nvarchar](20) NULL,
	[nameOther] [nvarchar](15) NULL,
	[nameAbbr] [nvarchar](9) NULL,
	[organAbbr] [nvarchar](50) NULL,
	[collector] [bit] NULL,
	[identifier] [bit] NULL,
	[imageAuthor] [bit] NULL,
	[recordDate] [datetime] NULL,
	[updateDate] [datetime] NULL,
	[showInCheckList] [bit] NULL,
 CONSTRAINT [PK_person] PRIMARY KEY CLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
