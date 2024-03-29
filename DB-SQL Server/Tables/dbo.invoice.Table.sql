USE [HASTDB]
GO
/****** Object:  Table [dbo].[invoice]    Script Date: 03/12/2018 14:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invoice](
	[invoiceID] [int] IDENTITY(1,1) NOT NULL,
	[via] [nvarchar](30) NULL,
	[numberOfPackage] [tinyint] NULL,
	[approvedBy] [nvarchar](50) NULL,
	[loanNumber] [int] NULL,
	[applicantE] [nvarchar](80) NULL,
	[applicantC] [nvarchar](20) NULL,
	[institutionID] [smallint] NULL,
	[addressID] [int] NULL,
	[purposeID] [tinyint] NULL,
	[amount] [int] NULL,
	[isNative] [bit] NULL,
	[checkIn] [bit] NULL,
	[requestDate] [date] NULL,
	[signingDate] [date] NULL,
	[shippingDate] [date] NULL,
	[returnDate] [date] NULL,
	[admin] [nvarchar](20) NULL,
	[tempDepartment] [nvarchar](100) NULL,
	[tempCheck] [bit] NULL,
	[receivedDate] [date] NULL,
	[note] [nvarchar](255) NULL,
 CONSTRAINT [PK_invoice] PRIMARY KEY CLUSTERED 
(
	[invoiceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[invoice] ADD  CONSTRAINT [DF_invoice_tempCheck]  DEFAULT ((0)) FOR [tempCheck]
GO
