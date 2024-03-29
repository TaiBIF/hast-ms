USE [HASTDB]
GO
/****** Object:  View [dbo].[vwInvoice]    Script Date: 03/12/2018 14:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwInvoice]

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
	, CAST(isNative AS CHAR) AS isNative
	, CAST(checkIn AS CHAR) AS checkIn
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
	--LEFT JOIN countryISO AS c ON i.country2Code = c.country2Code
	--LEFT JOIN addressRefer AS r
	--LEFT JOIN [address] AS a
GO
