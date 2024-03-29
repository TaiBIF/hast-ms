USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prXMLImagesUpdate]    Script Date: 03/12/2018 15:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prXMLImagesUpdate]

	@UpdatedRowCount INT =NULL OUTPUT	
AS
	
	/*
	更新XMLImageUpload中
	日期值null至現在日期
	*/

SET NOCOUNT OFF

UPDATE
	XMLImagesUpload
SET
	uploadDate = CONVERT(DATE, GETDATE())
WHERE
	uploadDate IS NULL
	
SET @UpdatedRowCount = @@rowcount
GO
