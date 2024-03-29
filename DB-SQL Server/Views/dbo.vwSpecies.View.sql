USE [HASTDB]
GO
/****** Object:  View [dbo].[vwSpecies]    Script Date: 03/12/2018 14:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[vwSpecies]
AS
SELECT DISTINCT 
	s.genusID
	, s.speciesID
	, s.speciesE
	, s.speciesC
	, s.speciesE + 
		CASE 
			WHEN speciesC IS NULL THEN '' 
			ELSE ' ' + s.speciesC 
		END 
	AS speciesExpr
	, g.familyID
	, s.informal
	, RIGHT(speciesE, (LEN(speciesE) - (PATINDEX('% %', speciesE)))) AS epithetN
	, genusE
	, genusC	
	, familyE
	, familyC
	, c.classID
	, classE
	, classC

FROM             
	species AS s
	INNER JOIN genus AS g ON s.genusID = g.genusID
	INNER JOIN family AS f ON g.familyID = f.familyID
	INNER JOIN classX AS c ON f.class = c.classID
GO
