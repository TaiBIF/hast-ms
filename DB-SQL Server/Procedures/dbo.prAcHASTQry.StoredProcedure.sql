USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prAcHASTQry]    Script Date: 03/12/2018 15:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[prAcHASTQry]

	@condition INT        
	, @SN INT = NULL	
	, @specimenOrderNum INT = NULL
	, @collectorID INT  = NULL
	, @collectNum1 INT = NULL
	, @startDate DATETIME = NULL
	, @endDate DATETIME = NULL
	--, @optionDate BIT = 0

AS
	/*
	查詢hast資料表
	當有輸入collectNum1時，擴大查詢範圍100筆
	*/
	
SELECT 

	*
	--, @specimenOrderNum AS SNum
	
	
FROM
	hast


	
WHERE
	/*
	(COALESCE(SN, ISNULL(SN,1)) = COALESCE(NULLIF(@SN,0), ISNULL(SN,1)))
	AND (COALESCE(collectorID, ISNULL(collectorID,1)) = COALESCE(NULLIF(@collectorID,0), ISNULL(collectorID,1)))
	AND (
		COALESCE(collectNum1, ISNULL(collectNum1,1)) 
		BETWEEN  COALESCE(NULLIF(@collectNum1,0), ISNULL(collectNum1,1))
		AND COALESCE(NULLIF(@collectNum1 + 100 ,0), ISNULL(collectNum1,1))
		)  
	*/

	
	
	(
	 @condition = 1	
 	AND 
	SN =@SN 
	)

	OR

	(
	@condition = 3
	AND
	 	(COALESCE(collectorID, ISNULL(collectorID,1)) = COALESCE(NULLIF(@collectorID,0), ISNULL(collectorID,1)))
		AND (
			COALESCE(collectNum1, ISNULL(collectNum1,1)) 
			BETWEEN  COALESCE(NULLIF(@collectNum1,0), ISNULL(collectNum1,1))
			AND COALESCE(NULLIF(@collectNum1 + 100 ,0), ISNULL(collectNum1,1))
			)
	AND
		(
			(	
			ISNULL(@startDate, 0) = ISNULL(@endDate, 0)
			)
			OR
			(
			collectionDate BETWEEN 
				ISNULL(@startDate, ISNULL(@endDate, collectionDate)) 
				AND
				ISNULL(@endDate, ISNULL(@startDate, collectionDate)) 
			)
		)
	)     


	OR

	(
	@condition = 2
	AND
	SN =
		(
		SELECT
			duplications.SN
		FROM	
			duplications
			INNER JOIN specimens ON duplications.dupID = specimens.dupID
		WHERE
			specimens.specimenOrderNum = @specimenOrderNum
		)
	
	
	)

ORDER BY
	collectNum1
	, collectNum2
GO
