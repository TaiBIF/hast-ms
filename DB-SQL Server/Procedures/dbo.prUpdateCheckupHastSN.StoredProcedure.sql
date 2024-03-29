USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prUpdateCheckupHastSN]    Script Date: 03/12/2018 15:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prUpdateCheckupHastSN]

AS

	/*
	更新checkup的 hastSN欄位
	透過 vwSNOfIndependentCollectorNum
	篩選出 collectNum1值僅一筆資料的sn值填入	
	*/

UPDATE 
	
	checkup

SET 

	checkup.hastSN = vwSN.SN

FROM 

	checkup
	,  vwSNOfIndependentCollectorNum AS vwSN
	
WHERE

	checkup.collectorID = vwSN.collectorID
	AND checkup.collectNum1 = vwSN.collectNum1
	AND checkup.collectNum2 = ''
	AND checkup.hastSN IS NULL
GO
