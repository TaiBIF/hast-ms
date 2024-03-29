USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prPlantUseDescription]    Script Date: 03/12/2018 15:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prPlantUseDescription]

	@usesID INT = NULL
	, @usedForID INT = NULL
	, @speciesID INT = NULL
	
AS

	/*
	依據物種與利用查詢植物生態與用途說明
	並傳回本土植物資料庫中可顯示資料筆數
	*/

SELECT
	pu.usesID
	, pu.speciesID
	, pu.describeUseID
	, pu.describePlantID
		, du.characteristicC AS describeUse		
		, dp.characteristicC AS describePlant
	, pu.usedForID
	, pu.caption
	, pu.photoUse
	, pu.photoLife
		, s.familyID
		, s.familyE
		, s.familyC
		, s.familyExpr
		, s.genusID
		, s.genusE
		, s.genusC
		, s.genusExpr
		, s.speciesE
		, s.speciesC
		, s.speciesExpr
		
FROM
	plantUses AS pu 
	INNER JOIN speciesDescriptions AS du ON pu.describeUseID = du.characterID
	INNER JOIN vwSpeciesList as s ON pu.speciesID = s.speciesID
	INNER JOIN speciesDescriptions AS dp ON pu.describePlantID = dp.characterID
	
WHERE
	pu.usesID = @usesID
	AND pu.speciesID = @speciesID
	AND pu.usedForID = @usedForID
	AND pu.caption IS NOT NULL

	
--查詢本土植物資料庫中可顯示之標本資料
SELECT 
	COUNT(specimenOrderNum) AS countSpecimens
FROM
	vwHastDupVerificationLast
WHERE
	verSpeciesID = @speciesID
	AND specimenOrderNum IS NOT NULL


--查詢本土植物資料庫中可顯示之生態影像
SELECT
	COUNT(imageCode) AS countImages
FROM
	vwImageDetail
WHERE
	speciesID = @speciesID
	AND publicWeb = 1
	AND SN IS NOT NULL
GO
