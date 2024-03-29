USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prFamilyStroke]    Script Date: 03/12/2018 15:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prFamilyStroke]
	/*
	產生科名中文筆劃排序清單
	*/
AS
	SET NOCOUNT ON

DECLARE

	@intErrorCode int
	, @charQuery NVARCHAR(1000)
	, @charStroke NVARCHAR(500)
	, @charAlphabet NVARCHAR(250)


SELECT
	@charQuery =
		'SELECT b.strokeID, b.fword, f.familyID, f.familyC, f.familyE, LEFT(f.familyE,1) AS firstLetter '
		+ '	FROM '
		+ '		(	SELECT min(strokeID) AS strokeID,	a.fWord '
		+ '			FROM '
		+ '			(	SELECT DISTINCT	LEFT(familyC,1) AS fWord '
		+ '				FROM family '
		+ '				WHERE familyC IS NOT NULL ) AS a '
		+ '			LEFT JOIN cwordMaxBH '
		+ '			ON a.fword <= cwordMaxBH.cword '
		+ '			GROUP BY a.fword ) AS b '
		+ '	LEFT JOIN family AS f '
		+ ' ON b.fword = LEFT(f.familyC,1) '
		+ '	ORDER BY b.fword '
	
	, @charStroke =
		' SELECT DISTINCT b.strokeID , c.stroke '
		+ ' FROM '
		+ ' ( SELECT Min(strokeID) AS strokeID ,  fword '
		+ '			FROM '
		+ '			(	SELECT DISTINCT	LEFT(familyC,1) AS fWord '
		+ '				FROM family '
		+ '				WHERE familyC IS NOT NULL ) AS a '
		+ '			LEFT JOIN cwordMaxBH '
		+ '			ON a.fword <= cwordMaxBH.cword '
		+ '			GROUP BY a.fword ) AS b   '
		+ '			INNER JOIN cwordMaxBH AS c ON b.strokeID = c.strokeID'

	, @charAlphabet =
		' SELECT DISTINCT LEFT(familyE,1) AS firstLetter '
		+ ' FROM family '
		+ ' ORDER BY LEFT(familyE,1) ASC '


					
EXEC (@charQuery)
EXEC (@charStroke)
EXEC (@charAlphabet)
GO
