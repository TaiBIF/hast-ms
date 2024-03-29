USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prQryHAST]    Script Date: 03/12/2018 15:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prQryHAST]

        
	@SN  NVARCHAR(10)= '%'
	, @specimenOrderNum NVARCHAR(10) = '%'
	, @collectorID NVARCHAR(10) = '%'
	,  @collectNum1 NVARCHAR(10)= '%'
AS
SELECT 
	*
FROM
	hast_m
WHERE
	SN LIKE @SN	
  	AND COALESCE(specimenOrderNum, 0) LIKE  @specimenOrderNum
	AND COALESCE(collectorID, 0) LIKE @collectorID
	AND COALESCE(collectNum1, 0) LIKE @collectNum1 
ORDER BY
	collectNum1
	, collectNum2
GO
