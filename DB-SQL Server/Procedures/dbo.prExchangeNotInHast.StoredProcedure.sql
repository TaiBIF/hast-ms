USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prExchangeNotInHast]    Script Date: 03/12/2018 15:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prExchangeNotInHast]

	@inputExchangeBatchNum INT =0

AS

/*尋找交換清單中，無法以採集者採集號對應至hast_m的資料*/

SELECT
	
	exchangeDetail.batchNum
	, exchangeDetail.CKSN
	, vwPersonName.nameLFC2
	--, checkup.collectorID
	, checkup.collectNum1
	, checkup.collectNum2
	, checkup.hastSN

FROM

	 exchangeDetail
	, checkup
	, vwPersonName

WHERE


	exchangeDetail.batchNum = 
		CASE 
			WHEN @inputExchangeBatchNum <>0 THEN @inputExchangeBatchNum
			ELSE exchangeDetail.batchNum
		END

	and exchangeDetail.CKSN = checkup.CKSN
	and checkup.collectorID = vwPersonName.pid
	and exchangeDetail.CKSN

NOT IN

	(
	SELECT 
		E.CKSN AS eCKSN
		/* C.CKSN AS cCKSN */

	FROM
		exchangeDetail E
		, checkup C
		, hast_m H

	WHERE 
		/*
		Access無法處理雙重參數
		E.batchNum = @inputExchangeBatchNum
		--and                                                            
		*/ 
		E.CKSN=C.CKSN 
		/*
		and C.collectorID = H.collectorID 
		
		and ISNULL(C.collectnum1,'') = ISNULL(H.collectnum1,'') 
		and ISNULL(C.collectnum2,'') = ISNULL(H.collectnum2,'')
		*/
		and ISNULL(C.hastSN,'') = ISNULL(H.SN,'')
	)


ORDER BY
	
	exchangeDetail.batchNum
	, vwPersonName.nameLFC2
	, checkup.collectNum1
	, checkup.collectNum2
GO
