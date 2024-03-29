USE [HASTDB]
GO
/****** Object:  View [dbo].[vwExchangeToList]    Script Date: 03/12/2018 14:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwExchangeToList]

AS 

SELECT
	b.batchNum 
	, exchDate 
	, institutionE
	, specimenOrderNum 
	, verFamilyE
	, verFamilyC
	, verSpeciesE
	, verSpeciesC
FROM
	exchangeBatch AS b
	INNER JOIN exchangeDetail AS d ON b.batchNum = d.batchNum
	INNER JOIN institution As i ON b.institutionID = i.institutionID
	INNER JOIN checkUP AS c ON d.CKSN = c.CKSN
	INNER JOIN vwHASTDupVerificationLast AS v ON c.hastSN =v.SN
WHERE
	specimenOrderNum IS NOT NULL
GO
