USE [HASTDB]
GO
/****** Object:  Table [dbo].[imageSubject]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[imageSubject](
	[imgSubjectID] [smallint] IDENTITY(1,1) NOT NULL,
	[imgSubject] [nvarchar](30) NULL,
	[imgSubjectNo] [nvarchar](2) NULL,
 CONSTRAINT [PK_imageSubject] PRIMARY KEY CLUSTERED 
(
	[imgSubjectID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
