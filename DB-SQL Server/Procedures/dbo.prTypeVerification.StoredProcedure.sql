USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prTypeVerification]    Script Date: 03/12/2018 15:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prTypeVerification]

AS

	/*
	type的鑑訂資料
	*/

SELECT

	typeSpecimen.specimenOrderNum AS typeSpecimenNum,
	verification.familyID,
	verification.genusID,
	verification.speciesID,
	genus.genusE,
	species.speciesE,
	species.speciesC,
	verification.verificationNo,
	verification.verificationDate	

FROM 
	
	typeSpecimen
	INNER JOIN specimens ON typeSpecimen.specimenOrderNum=specimens.specimenOrderNum
	INNER JOIN duplications ON duplications.dupID = specimens.dupID
	INNER JOIN hast ON hast.SN = duplications.SN
	INNER JOIN verification ON verification.SN = hast.SN
	LEFT JOIN family ON verification.familyID = family.familyID
	LEFT JOIN genus ON verification.genusID = genus.genusID
	LEFT JOIN species ON verification.speciesID = species.speciesID

ORDER BY 

	typeSpecimenNum, verification.verificationNo
GO
