USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prUpdateSpecImgFile]    Script Date: 03/12/2018 15:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prUpdateSpecImgFile]

	@diskNo INT = NULL		--光碟編號
	, @oldSpecFile int = NULL	--舊館號
	, @specFile int = NULL		--新館號
 
AS

	/*
		修改錯誤檔名
	*/

UPDATE
	specImgFile
SET
	specimenOrderNum = @specFile
	, NDAPdisk = 'NDAP_TWF_S' + 
	CASE 
		WHEN @diskNo < 1000 THEN '-'
		ELSE ''
	END
	 +	CAST(@diskNo AS CHAR)
	, specFile = REPLICATE('0',6-LEN(CAST(@specFile AS VARCHAR))) + CAST(@specFile AS VARCHAR)
	, diskNo = @diskNo
	
WHERE
	diskNo = @diskNo
	AND specFile = @oldSpecFile	
	

SELECT
	*
FROM
	specImgFile
WHERE
	specFile = @SpecFile
	or specFile = @oldSpecFile
GO
