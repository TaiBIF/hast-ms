USE [HASTDB]
GO
/****** Object:  View [dbo].[vwGenus]    Script Date: 03/12/2018 14:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  VIEW [dbo].[vwGenus]
AS

SELECT DISTINCT 
	g.familyID
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
	INNER JOIN family AS f ON g.familyID = f.familyID
	INNER JOIN classX AS c ON f.class = c.classID
GO
