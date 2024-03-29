USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[PrImagesProgress]    Script Date: 03/12/2018 15:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PrImagesProgress]

	/*查詢影像進度 */
AS

SELECT
	COUNT(*)
FROM 
	images
	INNER JOIN hast ON images.sn = hast.sn
	INNER JOIN verification ON hast.sn =verification.sn
WHERE
	images.sn IS NOT NULL
	AND	images.publicweb = 1
	AND speciesID IS NOT NULL
GO
