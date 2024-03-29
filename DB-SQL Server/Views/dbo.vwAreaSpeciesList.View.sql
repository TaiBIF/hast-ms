USE [HASTDB]
GO
/****** Object:  View [dbo].[vwAreaSpeciesList]    Script Date: 03/12/2018 14:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwAreaSpeciesList]

AS

SELECT
	listID
	, classID
	, classE
	, classC
	, familyID
	, familyE
	, familyC
	, genusID
	, genusE
	, genusC
	, s.speciesID
	, speciesE
	, speciesC
	, a.areaID
	, nLocalityE
	, nLocalityC

FROM
	areaSpeciesList AS sl 
	INNER JOIN area AS a ON sl.areaID = a.areaID 
	INNER JOIN vwLocalityAll AS l ON a.sourceTable = l.sourceTable AND a.oLocalityID = l.oLocalityID
	INNER JOIN vwSpecies AS s ON sl.speciesID = s.speciesID
GO
