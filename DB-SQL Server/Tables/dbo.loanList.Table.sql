USE [HASTDB]
GO
/****** Object:  Table [dbo].[loanList]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loanList](
	[invoiceID] [int] NOT NULL,
	[loanListID] [int] IDENTITY(1,1) NOT NULL,
	[collectorID] [int] NULL,
	[collector] [nvarchar](100) NULL,
	[collectNum] [nvarchar](20) NULL,
	[specimenOrderNum] [int] NULL,
	[isNative] [bit] NULL,
	[checkIn] [bit] NULL,
	[returnDate] [date] NULL,
	[SN] [int] NULL,
	[tempID] [int] NULL,
 CONSTRAINT [PK_loanList] PRIMARY KEY CLUSTERED 
(
	[loanListID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
