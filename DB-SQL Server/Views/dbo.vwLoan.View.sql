USE [HASTDB]
GO
/****** Object:  View [dbo].[vwLoan]    Script Date: 03/12/2018 14:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwLoan]

AS

SELECT 
	i.invoiceID
	, i.shippingDate
	, i.applicantE
	, i.applicantC
	, LTRIM(ISNULL(i.applicantE, '') + ' ' + ISNULL(i.applicantC, '')) AS applicant
	, i.institutionID 
	, inst.institutionAbbr
	, inst.institutionE
	, inst.institutionC
	,l.specimenOrderNum
	, CASE l.[isNative]
		WHEN  1 THEN '台灣'
		ELSE '國外' 
		END
		AS nativeX
	, CASE l.checkIn
		WHEN 1 THEN '已歸還'
		ELSE '未歸還'
		END
		AS checkinX
	, verFamilyE
	, verFamilyC
	, verSpeciesE
	, verSpeciesC
FROM
	invoice AS i
	INNER JOIN invoicePurpose AS p ON i.purposeID = p.purposeID
	LEFT JOIN institution AS inst ON i.institutionID = inst.institutionID
	INNER JOIN loanList AS l ON i.invoiceID = l.invoiceID
	LEFT JOIN vwHastDupVerificationLast as h ON l.specimenOrderNum = h.specimenOrderNum
GO
