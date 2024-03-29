USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prExchangeBatchList]    Script Date: 03/12/2018 15:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prExchangeBatchList]

	@inputBatchNum INT

AS

/*指定交換批次之交換清單 */



SELECT
	
	E.batchNum
	, C.CKSN
	, C.collectorID
	, C.collectNum1
	, C.collectNum2
	, vwP.nameFLC1
	, hast_m.specimenOrderNum
	, C.hastSN
	

FROM



	 exchangeDetail E
	, checkup C LEFT JOIN hast_m ON C.hastSN = hast_m.SN
	, vwPersonName AS vwP
		


WHERE 

		E.batchNum = @inputBatchNum
		AND E.CKSN = C.CKSN	
		AND C.collectorID = vwP.pid
				
		

ORDER BY
	C.CKSN
GO
