USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prRedundanceVerifyNo]    Script Date: 03/12/2018 15:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prRedundanceVerifyNo]
AS
	/*
	找出verifyNo重複的值
	手動修改後
	需多次執行確認已無重複值
	*/
SELECT
	SN
	, verifyNo
	, buildDate
	, familyID
	, genusID
	, speciesID
	, recordDate
FROM
	verification_m
WHERE
	SN IN
		(
		SELECT 
			SN
		From
			verification_m
		GROUP BY
			SN, verifyNo
		HAVING
			 count(*)  >1
		)
ORDER BY 
	SN
	, buildDate
GO
