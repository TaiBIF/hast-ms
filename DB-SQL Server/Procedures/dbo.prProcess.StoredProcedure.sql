USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prProcess]    Script Date: 03/12/2018 15:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prProcess]

	/*進度*/

AS 

	/*標本標籤*/
	
SELECT 
	COUNT(*) AS totalSpecimens
FROM
	specimens
	
	/*生態影像*/
SELECT
	COUNT(imageCode) AS totalImages
FROM
	vwImageDetail
WHERE
	publicweb = 1
	AND SN IS NOT NULL
	AND speciesID IS NOT NULL
	
	/*標本影像*/
	
SELECT 
	COUNT(specimenOrderNum) AS totalSpecImgFile
FROM
	specImgFile
GO
