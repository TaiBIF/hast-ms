USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prRedundanceSpecImgFile]    Script Date: 03/12/2018 15:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prRedundanceSpecImgFile]
/*
查詢標本影像檔重複的館號(檔名)
*/
AS
SELECT
 
	id,specImgFile.SpecimenOrderNum,  specImgFile.NDAPdisk,  specImgFile.specFile 

FROM 

	specImgFile


WHERE 
	specImgFile.specFile in
		(
		SELECT specImgFile.specFile FROM specImgFile
		GROUP BY specImgFile.specFile HAVING Count(*)>1
 		)

Order By
	specImgFile.SpecimenOrderNum
	, specImgFile.NDAPdisk
GO
