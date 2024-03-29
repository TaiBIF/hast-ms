USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prVerifications]    Script Date: 03/12/2018 15:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prVerifications]

	@SN INT

AS

SELECT
	SN
	, verificationDate
	, v.familyID
		, f.familyE
		, f.familyC
		, f.familyExpr
	, v.genusID
		, g.genusE
		, g.genusC
		, g.genusExpr
	, v.speciesID
		, s.speciesE
		, s.speciesC
		, s.speciesExpr
	, verifierID
	, verificationNo
	, unformedVdate
	
	
FROM
	verification AS v
	LEFT JOIN vwFamily AS f on v.familyID = f.familyID
	LEFT JOIN vwGenus AS g on v.genusID= g.genusID
	LEFT JOIN vwSpecies AS s ON v.speciesID = s.speciesID 
		
WHERE 
	
	SN = @SN	

ORDER BY verificationNo DESC
GO
