USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prHsien]    Script Date: 03/12/2018 15:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prHsien]
	
	@provinceNo INT = NULL
AS

SELECT
	hsienNo
	, hsienCityE
	, hsienCityC		
	, hsienCityE + 
		CASE 
			WHEN hsienCityC IS NULL THEN '' 
			ELSE ' ' + hsienCityC 
		END 
	AS hsienCityExpr
	, provinceNo
FROM
	hsienCity
	
WHERE
	(COALESCE(provinceNo, ISNULL(provinceNo,1)) = COALESCE(NULLIF(@provinceNo,0), ISNULL(provinceNo,1)))
GO
