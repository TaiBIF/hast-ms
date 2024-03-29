USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prPrntListExchangeBatch]    Script Date: 03/12/2018 15:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prPrntListExchangeBatch]

	@inputBatchNum INT

AS

/* 列印指定交換批號之標籤 */




SELECT *

FROM

	vwAcHASTDetail

	, exchangeDetail E
	, checkup C
	


WHERE 

		E.batchNum = @inputBatchNum
		AND E.CKSN = C.CKSN	
		AND C.hastSN = vwAcHASTDetail.SN
		

ORDER BY
	C.CKSN
	, vwAcHASTDetail.collectorName	
	, vwAcHASTDetail.collectNum1
	, vwAcHASTDetail.collectNum2
GO
