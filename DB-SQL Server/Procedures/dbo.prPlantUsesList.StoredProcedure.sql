USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prPlantUsesList]    Script Date: 03/12/2018 15:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prPlantUsesList]

	@usedForID INT = NULL

AS
	/*
	依植物利用方式查詢，列出清單
	*/

SELECT
	usesID
	, speciesID
	, describeUseID
	, usedForID
	, usedFor
	, caption
	, photoUse
	, photoLife
	, familyC
	, familyE
	, speciesE
	, speciesC
	, characteristicC
	
FROM
	vwPlantUses 
WHERE
	usedForID = @usedForID
	AND describeUseID IS NOT NULL
	AND describePlantID IS NOT NULL
	AND caption IS NOT NULL
	AND photoUse IS NOT NULL
	AND photoLife IS NOT NULL
GO
