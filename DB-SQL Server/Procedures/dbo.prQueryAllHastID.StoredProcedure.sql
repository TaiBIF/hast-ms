USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prQueryAllHastID]    Script Date: 03/12/2018 15:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROC [dbo].[prQueryAllHastID]
	
	@SN INT = NULL
	, @dupID INT = NULL
	, @specimenOrderNum INT = NULL
	, @imageCode NVARCHAR(15) = NULL
	, @verID INT = NULL
	, @collectorID INT = NULL
	, @collectNum1 INT = NULL

AS
	/*
	查詢相關於採集資料的所有資料表ID
	*/

SELECT
	h.SN 
	, d.dupID
	, s.specimenOrderNum
	, i.imageCode
	, collectorID
	, collectNum1
	, collectNum2
	, v.ID AS verID


FROM
	hast AS h
	LEFT JOIN duplications AS d ON h.SN = d.SN
	LEFT JOIN specimens AS s ON d.dupID = s.dupID
	LEFT JOIN images AS i ON h.SN = i.SN
	LEFT JOIN verification AS v ON h.SN = v.SN

WHERE
	(COALESCE(h.SN, ISNULL(h.SN,1)) = COALESCE(NULLIF(@SN,0), ISNULL(h.SN,1)))
	AND (COALESCE(d.dupID, ISNULL(d.dupID,1)) = COALESCE(NULLIF(@dupID,0), ISNULL(d.dupID,1)))
	AND (COALESCE(specimenOrderNum, ISNULL(specimenOrderNum,1)) 
		= COALESCE(NULLIF(@specimenOrderNum,0), ISNULL(specimenOrderNum,1)))
	AND (COALESCE(imageCode, ISNULL(imageCode,1)) = COALESCE(NULLIF(@imageCode,0), ISNULL(imageCode,1)))
	AND (COALESCE(v.ID, ISNULL(v.ID,1)) = COALESCE(NULLIF(@verID,0), ISNULL(v.ID,1)))
	AND (COALESCE(collectorID, ISNULL(collectorID,1)) 
		= COALESCE(NULLIF(@collectorID,0), ISNULL(collectorID,1)))
	AND (COALESCE(collectNum1, ISNULL(collectNum1,1)) 
		= COALESCE(NULLIF(@collectNum1,0), ISNULL(collectNum1,1)))
GO
