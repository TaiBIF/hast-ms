USE [HASTDB]
GO
/****** Object:  Table [dbo].[exchangeDetail]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exchangeDetail](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[batchNum] [smallint] NOT NULL,
	[CKSN] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_exchangeDetail_1] PRIMARY KEY CLUSTERED 
(
	[batchNum] ASC,
	[CKSN] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
