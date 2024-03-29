USE [HASTDB]
GO
/****** Object:  View [dbo].[vwPlantUses]    Script Date: 03/12/2018 14:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwPlantUses]

AS

	/*
	植物用途
	*/
	
SELECT
	u.usesID
	, u.speciesID
	, u.describeUseID
	, u.describePlantID
	, u.usedForID
	, uf.usedFor
	, u.caption
	, u.photoUse
	, u.photoLife
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
GO
