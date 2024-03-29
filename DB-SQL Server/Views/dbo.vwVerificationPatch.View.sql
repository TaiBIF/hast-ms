USE [HASTDB]
GO
/****** Object:  View [dbo].[vwVerificationPatch]    Script Date: 03/12/2018 14:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwVerificationPatch]

AS 
	
SELECT 
	SN
	, verificationNo	
	, verificationDate
	, familyID
	, genusID
	, speciesID
	, verifierID
	, taxonomic
	, unformedVDate	
	
FROM
	verification
	
WHERE

	ISNULL(familyID, 0) + ISNULL(genusID, 0) + ISNULL(speciesID, 0) !=0 

UNION

SELECT
	SN
	--, verificationNo
	, (verificationNo - 1) AS verificationNo
	, verificationDate
	, g.familyID
	, g.genusID
	, v.speciesID
	--, g.familyApgIVID
	, verifierID
	, taxonomic
	, unformedVDate	
	
FROM
	genus AS g
	--INNER JOIN family AS f ON f.familyID = g.familyID
	INNER JOIN verification AS v ON v.genusID = g.genusID
WHERE
	--g.familyID != familyApgIVID
	g.familyID != v.familyID
GO
