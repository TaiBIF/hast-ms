USE [HASTDB]
GO
/****** Object:  View [dbo].[vwGreenHouseSNNull]    Script Date: 03/12/2018 14:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwGreenHouseSNNull]

AS

	/*
	找出hastSNA 或hastSNB為NULL的資料
	*/

SELECT 
	*
FROM
	vwGreenhouseDetail
WHERE
	hastSNA IS NULL
	OR
	(
		(
		CAST(ISNULL(collectorID_B, '') AS NVARCHAR) + CAST(ISNULL(collectNumB1,'') AS NVARCHAR) + ISNULL(collectNumB2,'') =''
		)
		AND hastSNB IS NULL
	)
GO
