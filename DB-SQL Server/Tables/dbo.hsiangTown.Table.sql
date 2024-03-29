USE [HASTDB]
GO
/****** Object:  Table [dbo].[hsiangTown]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hsiangTown](
	[hsienNo] [int] NOT NULL,
	[townNo] [int] IDENTITY(1,1) NOT NULL,
	[hsiangTownC] [nvarchar](30) NULL,
	[hsiangTownE] [nvarchar](30) NULL,
	[newAdd] [bit] NOT NULL,
	[updated] [bit] NOT NULL,
 CONSTRAINT [PK_hsiangTown] PRIMARY KEY CLUSTERED 
(
	[townNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
