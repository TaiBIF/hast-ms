USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prAreaCollection]    Script Date: 03/12/2018 15:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROC [dbo].[prAreaCollection]

	@lID INT = NULL
	, @publicWeb BIT = 1

AS

	/*
	地區 - 植物名錄詳細資料
	*/

--物種資訊
SELECT 
	species.speciesID, speciesE, speciesC, sectionName, distribution, continent, protologue, protologueLink, reference, referenceLink
	,characteristicC ,distributionWC, distributionTC
	,distributionAC
FROM 
	species 
	INNER JOIN areaSpeciesList ON species.speciesID = areaSpeciesList.speciesID
	LEFT JOIN speciesDescriptions AS dc ON species.speciesID = dc.speciesID
	LEFT JOIN speciesDistributionArea AS dt ON areaSpeciesList.speciesID = dt.speciesID 
		AND areaSpeciesList.areaID = dt.areaID
	
WHERE 
	--speciesID = @speciesID;
	listID = @lID;

--採集資訊
SELECT 
	l.listID AS lID, 
	h.SN, dupID, h.specimenOrderNum, h.listID,  
	sf.specimenOrderNum AS imageFile, 
	collectorID, collectNum1, collectNum2, collectionDate, 
	collectorName, nameC, collectionFLNo, collectionLFNo, collectionFLCNo, 
	countryNo, provinceNo, hsienNo, townNo, localityID, parkNo, 
	WGS84Lng, WGS84Lat, alt, altx, elevation, 
	country, countryC, districtE, districtC, localityDescE, localityDescC, location, 
	verfamilyID, verGenusID, verSpeciesID, 
	verFamilyE, verFamilyC, verGenusE, verGenusC, verSpeciesE, verSpeciesC, 
	verFullTaxonName, verificationNo, verifierName, verifierNameFL -- , GPSInfo 

FROM
	areaSpeciesList AS l
	INNER JOIN areaCollection as c ON l.listID = c.listID
	INNER JOIN vwHastDupverificationWeb as h on c.SN = h.SN
	LEFT JOIN specImgFile AS sf ON h.specimenOrderNum = CAST(RIGHT(sf.specimenOrderNum, 6) AS INT) 

WHERE
	l.listID = @lID
	AND h.specimenORderNum IS NOT NULL
	;

--影像查詢
SELECT DISTINCT 
	imageCode,  familyID, genusID, speciesID, speciesE, speciesC, authorC , publicWeb, vwImageDetail.SN
FROM 
	vwImageDetail 
	INNER JOIN areaCollection on vwImageDetail.SN = areaCollection.SN
WHERE 
	--speciesID = @speciesID
	areaCollection.listID = @lID
	AND publicWeb = 1	

/*	 
	AND publicWeb =
		CASE  
			WHEN @publicWeb =1 THEN 1
		ELSE
			publicWeb
		END
*/
	AND (COALESCE(publicWeb, ISNULL(publicWeb,1)) = COALESCE(NULLIF(@publicWeb,0), ISNULL(publicWeb,1)))
	  ;
GO
