USE [HASTDB]
GO
/****** Object:  View [dbo].[vwStockSpecimenImage]    Script Date: 03/12/2018 14:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwStockSpecimenImage]
AS 
 /*
 上傳標本影像盤點
 */

SELECT
	'S_' + REPLICATE('0', 6 - LEN(CAST(i.specimenOrderNum AS NVARCHAR))) + CAST(i.specimenOrderNum AS NVARCHAR) AS [數位財產編號]
	, 'S_' + REPLICATE('0', 6 - LEN(CAST(i.specimenOrderNum AS NVARCHAR))) + CAST(i.specimenOrderNum AS NVARCHAR) AS [數位化檔案名稱]
	--, SN
	, LTRIM(RTRIM(COALESCE(verSpeciesE, '') + ' ' + COALESCE(verSpeciesC, '')) + ' 標本影像') AS [內容主題說明]
	, i.specimenOrderNum AS [實物典藏品代碼] 
 	, RTRIM(COALESCE(verSpeciesE, '') + ' ' + COALESCE(verSpeciesC, '')) AS [實體典藏品名稱（品名）]
	, 'http://img.hast.biodiv.tw/specimenSmall/specimenSmall' 
				+ REPLICATE('0', 3 -LEN(FLOOR(i.specimenOrderNum - 1)/10000) ) 
				+ CAST((FLOOR(i.specimenOrderNum - 1)/10000) AS NVARCHAR(3)) + '/'
				+ CASE CAST(RIGHT(CAST(i.specimenOrderNum AS INT), 4) AS NVARCHAR(4))
					WHEN '0000' THEN '9'
				
				 ELSE CAST(FLOOR((RIGHT(CAST(RIGHT(i.specimenOrderNum, 6) AS INT), 4) -1)/1000) AS NVARCHAR(1))
				 END
				+ '/S_'
				+ REPLICATE('0', 6 - LEN(CAST(RIGHT(i.specimenOrderNum, 6) AS INT))) 
				+ CAST(CAST(RIGHT(i.specimenOrderNum, 6) AS INT) AS NVARCHAR(6))+ '.jpg'
			AS [原始影像與檔案之網址]
	, i.specimenOrderNum AS [Digital Archive ID]
	
	, CASE ISNULL(x.specimenOrderNum, '0')
		WHEN 0 THEN '否'
		ELSE '是'
	  END 
	  AS [數位化檔案匯入聯合目錄(是/否)]
	, i.fileMaker
	
		
FROM
	specImgFile AS i
	LEFT JOIN vwHastDupVerificationLast as h ON i.specimenOrderNum  = h.specimenOrderNum
	LEFT JOIN XMLSpecimensUpload AS x on i.specimenOrderNum = x.specimenOrderNum 
WHERE
	diskNo BETWEEN '597' AND '679'
	--AND h.specimenOrderNum is  null
	

/*

SELECT
	i.specimenOrderNum
	, h.specimenOrderNum
	, CAST(RIGHT(i.specimenOrderNum, 6) AS INT) 
FROM
	specImgFile AS i
	LEFT JOIN specimens as h ON CAST(RIGHT(i.specimenOrderNum, 6) AS INT) = h.specimenOrderNum
WHERE
	diskNo BETWEEN '597' AND '679'

*/
GO
