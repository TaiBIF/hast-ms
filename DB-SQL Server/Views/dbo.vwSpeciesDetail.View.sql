USE [HASTDB]
GO
/****** Object:  View [dbo].[vwSpeciesDetail]    Script Date: 03/12/2018 14:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwSpeciesDetail]

AS

	/* 
	詳細學名資料
	*/
	
SELECT DISTINCT
	g.familyID 
	, s.genusID
	, s.speciesID
	, s.speciesE
	, s.speciesC
	, s.speciesE + 
		CASE 
			WHEN speciesC IS NULL THEN '' 
			ELSE ' ' + s.speciesC 
		END 
	AS speciesExpr	
	, s.informal
	, RIGHT(speciesE, (LEN(speciesE) - (PATINDEX('% %', speciesE)))) AS epithetN
	, s.reference
	, s.referenceLink
	, s.note
	, s.twFlora
	, s.flora2
	, s.manualTWVP
	, s.protologue
	, s.protologueLink
	, s.distribution
	, s.continent
	, s.acceptedName
	, s.sectionName

FROM             
	species AS s
	LEFT OUTER JOIN genus AS g ON s.genusID = g.genusID
GO
