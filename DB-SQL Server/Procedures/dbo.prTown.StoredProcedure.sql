USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prTown]    Script Date: 03/12/2018 15:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prTown]
	
	@hsienNo INT = NULL
AS

SELECT
	townNo
	, hsiangTownE
	, hsiangTownC		
	, hsiangTownE + 
		CASE 
			WHEN hsiangTownC IS NULL THEN '' 
			ELSE ' ' + hsiangTownC 
		END 
	AS hsiangTownExpr
	, hsienNo
FROM
	hsiangTown	
WHERE
	(COALESCE(hsienNo, ISNULL(hsienNo,1)) = COALESCE(NULLIF(@hsienNo,0), ISNULL(hsienNo,1)))
GO
