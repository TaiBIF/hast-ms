USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prImageSNSpecimenOrderNum]    Script Date: 03/12/2018 15:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROC [dbo].[prImageSNSpecimenOrderNum]

	@imageCode NVARCHAR(15) = NULL
AS

	/*
	檢查該生態影像是否存在館號
	*/

SELECT
	imageCode
	,specimens.specimenOrderNum
FROM images
	INNER JOIN hast ON images.SN = hast.SN
	INNER JOIN duplications ON hast.SN = duplications.SN
	INNER JOIN specimens ON duplications.dupID = specimens.dupID
WHERE
	imageCode = @imageCode
GO
