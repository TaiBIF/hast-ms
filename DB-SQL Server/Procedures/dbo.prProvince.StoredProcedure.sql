USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prProvince]    Script Date: 03/12/2018 15:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prProvince]
	
	@countryNo INT = NULL
AS

SELECT
	provinceNo
	, provinceE
	, provinceC		
	, provinceE + 
		CASE 
			WHEN provinceC IS NULL THEN '' 
			ELSE ' ' + provinceC 
		END 
	AS provinceExpr
	, countryNo
FROM
	province
	
WHERE
	(COALESCE(countryNo, ISNULL(countryNo,1)) = COALESCE(NULLIF(@countryNo,0), ISNULL(countryNo,1)))
GO
