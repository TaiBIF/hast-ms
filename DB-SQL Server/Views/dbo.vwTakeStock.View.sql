USE [HASTDB]
GO
/****** Object:  View [dbo].[vwTakeStock]    Script Date: 03/12/2018 14:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[vwTakeStock]

	/*
	盤點
	*/
AS
	


SELECT --TOP 100
	/*
	AS 數位財產編號
	, AS 數位化檔案名稱
	, AS 內容主題說明
	, AS 實物典藏品代碼
	, AS 實體典藏品名稱（品名）
	, AS Digital Archive ID
	, AS 原始影像與檔案之網址
	, AS 數位化檔案匯入聯合目錄(是/否)
	, AS "是否允許以 CC 2.5 BY-NC-ND 方式分享"
	*/
	'HAST_S_' + Replicate('0',6-LEN(i.specimenOrderNum)) + CAST(i.specimenOrderNum AS NVARCHAR) AS 數位財產編號
	, 'S_' + CAST((Replicate('0',6-LEN(i.specimenOrderNum)) + CAST(i.specimenOrderNum AS NVARCHAR)) AS NVARCHAR(11)) + '.TIF' AS 數位化檔案名稱
	, CASE
		WHEN h.verSpeciesE IS NOT NULL THEN h.verSpeciesE + ' ' + COALESCE(verSpeciesC,'') 
		ELSE
			CASE 
				WHEN h.verGenusE IS NOT NULL THEN h.verGenusE + ' ' + COALESCE(verGenusC,'') 
				ELSE
					CASE 
						WHEN h.verFamilyE IS NOT NULL THEN h.verFamilyE + ' ' + COALESCE(verFamilyC, '')
					END
			END
		END 	
	 AS 內容主題說明
	 
	 , h.specimenOrderNum AS 實物典藏品代碼
	 
	 , CASE
		WHEN h.verSpeciesE IS NOT NULL THEN h.verSpeciesE + ' ' + COALESCE(verSpeciesC,'') 
		ELSE
			CASE 
				WHEN h.verGenusE IS NOT NULL THEN h.verGenusE + ' ' + COALESCE(verGenusC,'') 
				ELSE
					CASE 
						WHEN h.verFamilyE IS NOT NULL THEN h.verFamilyE + ' ' + COALESCE(verFamilyC, '')
					END
			END
		END 
	
	 + ' ' + ' 標本' AS 實體典藏品名稱
	 
	 , h.specimenOrderNum AS [Digital Archive ID]
	 , 'http://www.hast.biodiv.tw/specimens/SpecimenDetailC.aspx?specimenOrderNum=' 
			+ CAST(h.specimenOrderNum AS NVARCHAR(6)) AS 原始影像與檔案之網址
	 , '是' AS 數位化檔案匯入聯合目錄
	, '否' AS [是否允許以 CC 2.5 BY-NC-ND 方式分享]
	 

FROM
	specImgFile AS i
	INNER JOIN XMLSpecimensUpload AS x ON i.specimenOrderNum = x.specimenOrderNum
	INNER JOIN 	vwHastDupVerificationLast AS H ON i.specimenOrderNum = H.specimenOrderNum
	
	
where
h.specimenOrderNum > 100000
GO
