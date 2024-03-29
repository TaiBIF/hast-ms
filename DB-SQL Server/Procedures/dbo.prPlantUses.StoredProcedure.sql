USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prPlantUses]    Script Date: 03/12/2018 15:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prPlantUses]
	@usedForID INT = NULL
	
AS
	/*
	查詢植物利用
	*/
SELECT
	u.usesID
	, u.speciesID
	, u.describeUseID
	, u.usedForID
	, uf.usedFor
	, u.caption
	, u.photoUse
	, s.familyC
	, s.familyE
	, s.speciesE
	, s.speciesC
	, d.characteristicC
	
FROM
	plantUses AS u
	INNER JOIN vwSpeciesList AS s ON u.speciesID = s.speciesID
	INNER JOIN speciesDescriptions AS d on u.describeUseID = d.characterID
	INNER JOIN usedFor AS uf ON u.usedForID = uf.usedForID
WHERE
	
	u.describeUseID IS NOT NULL
	AND u.usedForID = @usedForID
	AND photoUse IS NOT NULL
GO
