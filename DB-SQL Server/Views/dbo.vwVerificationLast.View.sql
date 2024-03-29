USE [HASTDB]
GO
/****** Object:  View [dbo].[vwVerificationLast]    Script Date: 03/12/2018 14:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwVerificationLast]

AS
	/*
	找出最後一筆的鑑訂資料
	如果沒鑑訂過，以null補上
	*/

((
SELECT
	SN
	, familyID
	, genusID
	, speciesID
	, verifierID
	, verificationNo
	, verificationDate
FROM
	verification AS V
	, vwVerificationLastNo AS VN
WHERE
	V.SN = VN.LSN
	AND V.verificationNo = VN.lastVerificationNo
)
UNION
(
SELECT
	hast.sn AS SN
	, NULL AS familyID
	, NULL AS genusID
	, NULL AS speciesID
	, NULL AS verifierID
	, 0 AS verificationNo
	, NULL AS verificationDate
FROM
	hast LEFT JOIN verification
	ON hast.sn = verification.sn
WHERE
	verification.sn IS NULL

)
)
GO
