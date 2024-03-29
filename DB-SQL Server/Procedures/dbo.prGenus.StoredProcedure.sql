USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prGenus]    Script Date: 03/12/2018 15:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prGenus]
	
	@familyID INT = NULL
AS
	
SELECT 
	g.familyID
	, g.familyApgIVID
	, genusID
	, genusE
	, genusC
	, genusE + 
		CASE 
			WHEN genusC IS NULL  THEN '' 
			ELSE ' ' + g.genusC 
		END 
	AS genusExpr, infromal
	, familyE
	, familyC
	, classID
	, classC
	, classE

FROM
	 genus AS g 
	INNER JOIN family AS f ON g.familyApgIVID = f.familyID
	LEFT JOIN classX AS c ON f.class = c.classID

WHERE
	--g.familyID = @familyID
	(COALESCE(g.familyApgIVID, ISNULL(g.familyApgIVID,1)) = COALESCE(NULLIF(@familyID,0), ISNULL(g.familyApgIVID,1)))
GO
