USE [HASTDB]
GO
/****** Object:  View [dbo].[vwSpeciesList]    Script Date: 03/12/2018 14:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwSpeciesList]
AS
SELECT DISTINCT
	/* 台灣有採集記錄的學名 */
	c.classID
	, c.classE
	, c.classC
	, f.familyID
	, f.familyE
	, f.familyC
	, f.familyE + 
		CASE 
			WHEN f.familyC IS NULL THEN '' 
			ELSE ' ' + f.familyC 
		END 
		AS familyExpr
	, g.genusID
	, g.genusE
	, g.genusC
	, g.genusE + 
		CASE 
			WHEN g.genusC IS NULL THEN '' 
			ELSE ' ' + g.genusC 
		END 
		AS genusExpr
	, s.speciesID
	, s.speciesE
	, s.speciesC
	, s.speciesE + 
		CASE 
			WHEN s.speciesC IS NULL THEN '' 
			ELSE ' ' + s.speciesC 
		END 
		AS speciesExpr
FROM
	class AS c
	INNER JOIN family AS f ON  c.classID = f.class
	INNER JOIN genus AS g ON f.familyID = g.familyID
	INNER JOIN species AS s ON g.genusID = s.genusID
	/*
	LEFT JOIN family AS f ON  c.classID = f.class
	LEFT JOIN genus AS g ON f.familyID = g.familyID
	LEFT JOIN species AS s ON g.genusID = s.genusID	
	*/
/*	
WHERE
	s.speciesC IS NOT NULL
	*/
GO
