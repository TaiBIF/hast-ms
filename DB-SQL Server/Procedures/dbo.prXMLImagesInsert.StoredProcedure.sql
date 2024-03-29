USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prXMLImagesInsert]    Script Date: 03/12/2018 15:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prXMLImagesInsert]

	@InsertedRowCount INT =NULL OUTPUT
	
AS
	/*
		插入尚未上傳的imageCode		
	*/

SET NOCOUNT OFF

INSERT XMLImagesUpload(imageCode)
	
SELECT
	i.imageCode
FROM
	vwImageDetail AS i
	LEFT JOIN XMLImagesUpload AS x ON i.imageCode = x.imageCode
WHERE
	i.publicWeb = 1
	AND i.SN IS NOT NULL
	AND i.speciesID IS NOT NULL
	AND x.uploadDate IS NULL

SET @InsertedRowCount = @@rowcount
GO
