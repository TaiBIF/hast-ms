USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prSpecies]    Script Date: 03/12/2018 15:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prSpecies]
	
	@genusID INT = NULL
AS
	
SELECT 
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
	, (
		LEFT(speciesE,  
		CHARINDEX(' ' , speciesE)
        +
		CHARINDEX(' ',
		RIGHT(speciesE, (LEN(speciesE)-(CHARINDEX(' ' , speciesE))))
		)
		-1
		)
	) AS speciesSimple
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

WHERE
	
	--s.genusID = @genusID
	(COALESCE(s.genusID, ISNULL(s.genusID,1)) = COALESCE(NULLIF(@genusID,0), ISNULL(s.genusID,1)))
GO
