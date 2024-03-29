USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prAcAnnotationList]    Script Date: 03/12/2018 15:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prAcAnnotationList]

	@SN  INT=NULL
AS
SELECT 
	verification.SN
	, verification.verificationNo AS 訂正序
	, verification.verificationDate AS 訂正日期
	, verification.unformedVDate AS 訂正時期
	, vwPersonName.nameFLC2 AS 訂正者
	, family.familyE AS 科
	, genus.genusE AS 屬
	, species.speciesE AS 學名	 
	, verification.ID
FROM
	verification 
	LEFT JOIN vwPersonName ON verification.verifierId = vwPersonName.pid
	LEFT JOIN species ON verification.speciesID = species.speciesID
	LEFT JOIN genus ON verification.genusID = genus.genusID
	LEFT JOIN family ON verification.familyID = family.familyID
WHERE
	verification.SN = @SN
	AND verificationNo <> 0
ORDER BY
	verification.verificationNo
GO
