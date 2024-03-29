USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prCheckup]    Script Date: 03/12/2018 15:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROC [dbo].[prCheckup]

	@CKSN nvarchar(15) ='CKSN-0000000000'
AS
SELECT
	collectorID
	, collectNum1
	, collectNum2
	, CKSN
	, ckDate
	, blnBored
	, blnDestroyed
	, blnNoFlwFruit
	, storedSiteID
	, hastSN
	, voidDate
	, note
FROM
	checkup
WHERE
	CKSN  BETWEEN @CKSN 
	AND 
	
	(
	'CKSN-' + 
		REPLICATE ('0',10-LEN(CAST((CAST( RIGHT(@CKSN,10) AS INT) +50-1)  AS NVARCHAR(10)))) + 
		CAST((CAST( RIGHT(@CKSN,10) AS INT) + 50-1)  AS NVARCHAR(15))
	)

ORDER BY
	CKSN
GO
