USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prFloraSinica]    Script Date: 03/12/2018 15:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prFloraSinica]

	@speciesID INT = NULL
	
AS 

	/*院區植物*/
 
SELECT
	listID
	, SF.speciesID
	, SP.speciesC
	, SP.speciesE
	, commonNameC
	, commonNameE
	, distributionC
	, distributionE
	, locationC
	, locationE
	, characteristicsC
	, characteristicsE
	, remarkC
	, remarkE
	, noteC
	, noteE
FROM
	sinicaFlora AS SF
	LEFT JOIN species AS sp ON SF.speciesID = sp.speciesID

WHERE
	
	SF.speciesID = @speciesID
GO
