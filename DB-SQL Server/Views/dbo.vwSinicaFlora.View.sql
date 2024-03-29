USE [HASTDB]
GO
/****** Object:  View [dbo].[vwSinicaFlora]    Script Date: 03/12/2018 14:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwSinicaFlora]

AS


WITH tableA AS
(
SELECT DISTINCT 	
	 
	SinicaFlora.listID
	, classID
	, classE
	, classC
	, familyID
	, familyE
	, familyC
	, vwImageDetail.speciesID 
	, speciesE
	, speciesC
	, characteristicsC AS characteristicC
	, distributionC
	, '' AS distributionTC	
	--, nLocalityE
	, locationC AS nLocalityC
	, remarkC
	, noteC
	
	
	--authorC , publicWeb, vwImageDetail.SN
FROM 
	vwImageDetail 
	INNER JOIN areaCollection on vwImageDetail.SN = areaCollection.SN
	INNER JOIN areaSpeciesList on areaSpecieslist.listid = areacollection.listid 
	INNER JOIN sinicaFlora ON areaSpecieslist.speciesID = sinicaFlora.speciesID
	 
WHERE 
	--speciesID = @speciesID
	--areaCollection.listID = @lI
	
	areaSpeciesList.areaID = 2
	AND publicWeb =1
	--order by speciesE
	
	
)  

SELECT 
	*

FROM
	tableA


UNION



SELECT 
	l.listID
	, l.classID
	, l.classE
	, l.classC
	, l.familyID
	, l.familyE
	, l.familyC
	, l.speciesID
	, l.speciesE
	, l.speciesC
	, characteristicC
	, distributionWC
	, distributionTC
	--, nLocalityE
	, CASE nLocalityC
			WHEN '中央研究院' THEN ''
			ELSE nLocalityC
		END
	, '' AS remarkC
	, '' AS noteC
	
	--, count(l.speciesID)
	
FROM
	vwAreaSpeciesList AS l
	INNER JOIN speciesDescriptions AS sd ON l.speciesID = sd.speciesID
	INNER JOIN areaCollection AS ac ON l.listID = ac.listID
	INNER JOIN vwImageDetail AS i ON i.SN = ac.SN 
WHERE
	areaID = 2
	AND category IS  NULL
	AND publicWeb =1
	AND l.listID NOT IN (
		SELECT 
			listID
		FROM 
			TableA )
/*
GROUP BY 
	listID
	, l.speciesID
	, speciesE
	, speciesC
	
HAVING count(l.speciesID)> 1
ORDER BY l.speciesID
*/
GO
