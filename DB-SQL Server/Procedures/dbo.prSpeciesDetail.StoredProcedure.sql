USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prSpeciesDetail]    Script Date: 03/12/2018 15:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prSpeciesDetail]
	@speciesID INT = NULL
	, @showGreenhouse BIT = 0
	, @publicWeb BIT = 1
AS

--物種資訊
SELECT 
	speciesID, speciesE, speciesC, sectionName, distribution, continent, protologue, protologueLink, reference, referenceLink 
FROM 
	species 
WHERE 
	speciesID = @speciesID;

--標本查詢
SELECT DISTINCT 
	SN, specimenOrderNum, collectionDate, collectionLFNo, collectionFLCNo 
	, WGS84Lat ,WGS84Lng
	, country, countryC, districtE, districtC, localityDescE, localityDescC, location
	, verfamilyID, verGenusID, verSpeciesID
	, verFamilyE, verFamilyC, verGenusE, verGenusC, verSpeciesE, verSpeciesC
	, verFullTaxonName, verificationNo, verifierName, verifierNameFL --, GPSInfo 
FROM 
	vwHastDupVerificationWeb 
WHERE 
	verSpeciesID = @speciesID 
	AND specimenOrderNum IS NOT NULL
	;

--影像查詢
SELECT DISTINCT 
	imageCode,  familyID, genusID, speciesID, speciesE, speciesC, authorC , publicWeb
FROM 
	vwImageDetail 
WHERE 
	speciesID = @speciesID
/*	 
	AND publicWeb =
		CASE  
			WHEN @publicWeb =1 THEN 1
		ELSE
			publicWeb
		END
*/
AND publicWeb = ISNULL(@publicWeb, publicWeb)
	  ;

--溫室資料

IF @showGreenhouse = 1 
BEGIN
	SELECT 
		potID, hastSNA, hastSNB, collectionNumA, collectionNumB, CDateA, CDateB, greenhouseArea, verSpeciesIDA, verSpeciesIDB, verSpeciesEA, verSpeciesEB, countryA, countryB 
	FROM 
		vwGreenhouseDetail 
	WHERE 
		(verSpeciesIDA = @speciesID) OR  (verSpeciesIDB = @speciesID)
END ;
GO
