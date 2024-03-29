USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prInvoice]    Script Date: 03/12/2018 15:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prInvoice]
	@isNative NVARCHAR = NULL
	, @checkIn NVARCHAR = NULL
	, @purposeID tinyInt = NULL
AS
SELECT
	invoiceID
	, loanNumber
	, applicantE
	, applicantC
		, t.institutionID
		, t.institutionAbbr
		, t.institutionE
		, t.institutionC
	, signingDate
	, shippingDate
	, isNative 
	, checkIn 
	, returnDate
	, amount
	, p.purposeID
	, purposeE
	, purposeC
	, tempDepartment 
	, tempCheck
	, receivedDate
	, invoice.note
FROM
	invoice  
	LEFT JOIN institution AS t ON invoice.institutionID = t.institutionID
	LEFT JOIN invoicePurpose AS p on invoice.purposeID = p.purposeID
WHERE
	p.purposeID = ISNULL(@purposeID, p.purposeID)
	
	AND 
	isNative =
	CASE		 
		WHEN @isNative = '1' THEN 'TRUE'
		WHEN @isNative = '0' THEN 'FALSE'
		ELSE isNative
	END
		
	AND 
	checkIn =
	CASE		 
		WHEN @checkIn = '1' THEN 'TRUE'
		WHEN @checkIn = '0' THEN 'FALSE'
		ELSE checkIn
	END
GO
