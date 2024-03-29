USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prTaxonNameQuery]    Script Date: 03/12/2018 15:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prTaxonNameQuery]
		
	@plantName NVARCHAR(200) = NULL

AS

--DECLARE @s NVARCHAR(500)

IF LEN(@plantName)>0 
	BEGIN

SELECT
	l.familyID
	, l.familyE
	, l.familyC
	, l.genusID
	, l.genusE
	, l.genusC
	, l.speciesID
	, l.speciesE
	, l.speciesC			
	, l.familyExpr
	, l.genusExpr
	, l.speciesExpr
	, MAX(COALESCE(specimenOrderNum, 0) ) AS specimens
	, MAX(LEN(COALESCE(imageCode, '0')) ) AS images
FROM
	vwSpeciesList AS l
	LEFT JOIN vwHastDupVerification AS h ON l.speciesID =h.verspeciesID
	LEFT JOIN vwImageDetail AS i ON  l.speciesID = i.speciesID
	
WHERE
	( ISNULL(familyExpr, '') + ', '
		+ ISNULL(genusExpr, '') + ', '
		+ ISNULL(speciesExpr, '') + ', ') LIKE   '%' + @plantName + '%'
GROUP BY
	l.familyID
	, l.familyE
	, l.familyC
	, l.genusID
	, l.genusE
	, l.genusC
	, l.speciesID
	, l.speciesE
	, l.speciesC			
	, l.familyExpr
	, l.genusExpr
	, l.speciesExpr
	
ORDER BY
	l.familyE	
	, l.genusE
	, l.speciesE
END
GO
