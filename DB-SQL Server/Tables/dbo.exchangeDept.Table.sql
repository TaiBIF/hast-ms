USE [HASTDB]
GO
/****** Object:  Table [dbo].[exchangeDept]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exchangeDept](
	[deptID] [smallint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[deptAbber] [nvarchar](10) NOT NULL,
	[deptName] [nvarchar](100) NULL,
	[country] [nvarchar](20) NULL,
	[newAdd] [bit] NOT NULL,
 CONSTRAINT [PK_exchangeDept] PRIMARY KEY CLUSTERED 
(
	[deptAbber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
