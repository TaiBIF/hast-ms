USE [HASTDB]
GO
/****** Object:  Table [dbo].[specimens]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[specimens](
	[dupID] [int] NOT NULL,
	[specimenOrderNum] [int] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_specimens] PRIMARY KEY CLUSTERED 
(
	[specimenOrderNum] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[specimens] ADD  CONSTRAINT [MSmerge_df_rowguid_E5105B6759654BD9BA4A0FDA8F9B5F56]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
