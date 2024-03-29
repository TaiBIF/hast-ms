USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prFloraArea]    Script Date: 03/12/2018 15:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prFloraArea]
	
	@areaID INT =NULL

AS 

	/*查詢特定地區植物名錄*/

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
	, speciesID
	, speciesE
	, speciesC
	, areaID
	, nLocalityE
	, nLocalityC

FROM

	vwAreaSpeciesList

WHERE

	areaID = @areaID

ORDER BY

	classID
	, familyE
	, speciesE
GO
