USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prUpdateGreenhouseHastSN]    Script Date: 03/12/2018 15:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prUpdateGreenhouseHastSN]

AS

	/*
	同時更新greenhouse的 hastSNA，hastSNB欄位
	透過 vwSNOfIndependentCollectorNum
	篩選出 collectNum1值僅一筆資料的sn值填入
	
	*/


UPDATE 
	
	greenhouse

SET 

	greenhouse.hastSNA = vwSN.SN

FROM 

	greenhouse
	,  vwSNOfIndependentCollectorNum AS vwSN
	
WHERE

	greenhouse.collectorID_A = vwSN.collectorID
	AND greenhouse.collectNumA1 = vwSN.collectNum1
	AND greenhouse.collectNumA2 = ''
	AND greenhouse.hastSNA IS NULL
GO
