USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prPrntLabelExchangeBatch]    Script Date: 03/12/2018 15:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prPrntLabelExchangeBatch]

	@inputBatchNum INT

AS

/* 列印指定交換批號之標籤 */


SELECT *	
FROM
	vwHASTDetail
	, exchangeDetail E
	, checkup C

WHERE 

		E.batchNum = @inputBatchNum
		and E.CKSN = C.CKSN	
		and C.collectorID = vwHASTDetail.hCID 
		and ISNULL(C.collectnum1,'') = ISNULL(vwHASTDetail.hCNum1,'')
		and ISNULL(C.collectnum2,'') = ISNULL(vwHASTDetail.hCNum2,'')

ORDER BY
	
	E.CKSN

/*
WHERE

	hast_m.SN

IN

	(
	SELECT 
	
		H.SN as exchangeSN

	FROM

		exchangeDetail E
		, checkup C
		, hast_m H

	WHERE 

		E.batchNum = @inputBatchNum
		and E.CKSN = C.CKSN	
		and C.collectorID = H.collectorID 
		and ISNULL(C.collectnum1,'') = ISNULL(H.collectnum1,'')
		and ISNULL(C.collectnum2,'') = ISNULL(H.collectnum2,'')
	)

*/
GO
