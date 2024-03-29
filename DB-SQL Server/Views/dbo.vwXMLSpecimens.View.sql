USE [HASTDB]
GO
/****** Object:  View [dbo].[vwXMLSpecimens]    Script Date: 03/12/2018 14:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  VIEW [dbo].[vwXMLSpecimens]

AS

SELECT 
zzz.specimenOrderNum
,
REPLACE(
(

SELECT
	(
	SELECT
		'中研院生物多樣性中心' AS "Project/@Creator"	
		, CONVERT(DATE, GETDATE()) AS "Project/@GenDate"
		, '台灣本土植物數位化典藏' AS Project
		, 
		(
			SELECT
			(
				SELECT	
					'典藏機構與計畫:中央研究院:生物多樣性研究中心:台灣本土植物數位化典藏' AS Record
				FOR XML PATH(''), TYPE
			)
		/*
		, '生物:植物界:' + A.divisionC + ':' + A.classC + ':' + A.orderC  + ':' + ISNULL(A.verFamilyC, A.verFamilyE) AS Record
		FROM 
			vwHastDupVerificationLast AS a
		WHERE 
			a.specimenOrderNum = xyz.specimenOrderNum
		FOR XML PATH(''),ROOT('Catalog'),TYPE
		)
		*/
		, '內容主題:生物:植物界' +
			CASE ISNULL(A.orderC , '') 
				WHEN '' THEN ''
				ELSE
					CASE ISNULL(A.classC, '')
						WHEN '' THEN ''
						ELSE
							CASE ISNULL(A.divisionC, '')
								WHEN '' THEN ''
								ELSE
									':' + A.divisionC + ':' + A.classC + ':' + A.orderC  
									+ ':' + ISNULL(A.verFamilyC, A.verFamilyE)
					END
							END
				END
			 AS Record		
		FROM 
			vwHastDupVerificationLast AS a
		WHERE 
			a.specimenOrderNum = xyz.specimenOrderNum
		FOR XML PATH(''),ROOT('Catalog'),TYPE
		)
		, specimenOrderNum AS DigiArchiveID
		, 'http://www.hast.biodiv.tw/specimens/SpecimenDetailC.aspx?specimenOrderNum=' 
			+ CAST(specimenOrderNum AS NVARCHAR(6)) AS Hyperlink
		, 'CC 2.5 BY-NC-ND' AS "ICON/@license"
		, 
			/*
			'http://gissrv1.sinica.edu.tw/lizardtech/iserv/getimage?cat=plant_sid&item=S_'
			+ CAST(specimenOrderNum AS NVARCHAR(6))
			+ '.SID&cp=0.5,0.5&lev=3&wid=480&hei=480' AS ICON  --如何處理特殊字元？	
			*/
			
			'http://img.hast.biodiv.tw/specimenSmall/specimenSmall' 
				+ REPLICATE('0', 3 -LEN(FLOOR((specimenOrderNum - 1)/10000) ) )
				+ CAST(FLOOR((specimenOrderNum - 1)/10000) AS NVARCHAR(3)) + '/'
				+ CASE CAST(RIGHT(specimenOrderNum, 4) AS NVARCHAR(4))
					WHEN '0000' THEN '9'
				
				 ELSE CAST(FLOOR((RIGHT(specimenOrderNum, 4) -1)/1000) AS NVARCHAR(1))
				 END
				+ '/S_'
				+ REPLICATE('0', 6 - LEN(specimenOrderNum)) 
				+ CAST(specimenOrderNum AS NVARCHAR(6))+ '.jpg'
			AS ICON
	FOR XML PATH(''),ROOT('AdminDesc'),TYPE
	)
	 
	, 'CC 2.5 BY-NC-ND' AS "MetaDesc/@license" 
	,(
	SELECT		
			(
			SELECT
				'中文種名' AS "Title/@field"
				,(
					SELECT
					ISNULL(c.verSpeciesC, ISNULL(c.verSpeciesE, ISNULL(c.verGenusC, ISNULL(c.verGenusE, ISNULL(c.verFamilyC, c.verFamilyE)))))
					FROM 
				vwHastDupVerificationLast AS c
			WHERE 
				c.specimenOrderNum = xyz.specimenOrderNum				
				) AS Title FOR XML PATH(''), TYPE
			) 		
		,	(
			SELECT
				'學名' AS "Title/@field"
				,(
					SELECT
					c.verSpeciesE
					FROM 
				vwHastDupVerificationLast AS c
			WHERE 
				c.specimenOrderNum = xyz.specimenOrderNum				
				) AS Title FOR XML PATH(''), TYPE
			)
		/*	 
		, CASE COALESCE(b.verifierNameC, b.verifierNameFL, '')
			WHEN '' THEN ''
			ELSE '鑑訂者' 
		 END
			AS "Creator/@field"
		,	
			CASE COALESCE(b.verifierNameC, b.verifierNameFL, '')
			WHEN '' THEN ''
			ELSE ISNULL(b.verifierNameC, b.verifierNameFL) 
		 END
			AS Creator
		*/	
		, CASE COALESCE(b.verifierNameC, b.verifierNameFL, '')
			WHEN '' THEN ''
			ELSE
			(
			SELECT
				'鑑訂者' AS "Creator/@field"
				,(
					SELECT
						ISNULL(b.verifierNameC, b.verifierNameFL)
					FROM 
				vwHastDupVerificationLast AS c
			WHERE 
				c.specimenOrderNum = xyz.specimenOrderNum				
				) AS Creator FOR XML PATH(''), TYPE, ELEMENTS ABSENT
			)
		END	
		
		,	(
			SELECT
				'採集者' AS "Contributor/@field"
				,(
					SELECT
						CASE ISNULL(collectorID,'')
							WHEN '' THEN c.companion
							ELSE c.nameC
							END
					FROM 
				vwHastDupVerificationLast AS c
			WHERE 
				c.specimenOrderNum = xyz.specimenOrderNum				
				) AS Contributor FOR XML PATH(''), TYPE
			)
		,	(
			SELECT
				'採集者（英文）' AS "Contributor/@field"
				,(
					SELECT
						CASE ISNULL(collectorID,'')
							WHEN '' THEN c.companionE
							ELSE c.nameFL
							END
					FROM 
				vwHastDupVerificationLast AS c
			WHERE 
				c.specimenOrderNum = xyz.specimenOrderNum				
				) AS Contributor FOR XML PATH(''), TYPE
			)  
				
		,	(
			SELECT
				'界' AS "Subject/@field"
				,( SELECT '植物界' ) AS Subject FOR XML PATH(''), TYPE
			)
		,	(
			SELECT
				'界（英文）' AS "Subject/@field"
				,( SELECT 'Plantae' ) AS Subject FOR XML PATH(''), TYPE
			)	
				
		,	(
			SELECT
				'門' AS "Subject/@field"
				,(
					SELECT
					c.divisionC
					FROM 
				vwHastDupVerificationLast AS c
			WHERE 
				c.specimenOrderNum = xyz.specimenOrderNum				
				) AS Subject FOR XML PATH(''), TYPE
			)
		,	(
			SELECT
				'門（英文）' AS "Subject/@field"
				,(
					SELECT
					c.divisionE
					FROM 
				vwHastDupVerificationLast AS c
			WHERE 
				c.specimenOrderNum = xyz.specimenOrderNum				
				) AS Subject FOR XML PATH(''), TYPE
			)
					
		,	(
			SELECT
				'綱' AS "Subject/@field"
				,(
					SELECT
					c.classC
					FROM 
				vwHastDupVerificationLast AS c
			WHERE 
				c.specimenOrderNum = xyz.specimenOrderNum				
				) AS Subject FOR XML PATH(''), TYPE
			)
		,	(
			SELECT
				'綱（英文）' AS "Subject/@field"
				,(
					SELECT
					c.classE
					FROM 
				vwHastDupVerificationLast AS c
			WHERE 
				c.specimenOrderNum = xyz.specimenOrderNum				
				) AS Subject FOR XML PATH(''), TYPE
			)
	
		,	(
			SELECT
				'目' AS "Subject/@field"
				,(
					SELECT
					c.orderC
					FROM 
				vwHastDupVerificationLast AS c
			WHERE 
				c.specimenOrderNum = xyz.specimenOrderNum				
				) AS Subject FOR XML PATH(''), TYPE
			)
		,	(
			SELECT
				'目（英文）' AS "Subject/@field"
				,(
					SELECT
					c.orderE
					FROM 
				vwHastDupVerificationLast AS c
			WHERE 
				c.specimenOrderNum = xyz.specimenOrderNum				
				) AS Subject FOR XML PATH(''), TYPE
			)
			
			,	(
			SELECT
				'科' AS "Subject/@field"
				,(
					SELECT
					ISNULL(c.verFamilyC, c.verFamilyE)
					FROM 
				vwHastDupVerificationLast AS c
			WHERE 
				c.specimenOrderNum = xyz.specimenOrderNum				
				) AS Subject FOR XML PATH(''), TYPE
			)
		,	(
			SELECT
				'科（英文）' AS "Subject/@field"
				,(
					SELECT
					c.verFamilyE
					FROM 
				vwHastDupVerificationLast AS c
			WHERE 
				c.specimenOrderNum = xyz.specimenOrderNum				
				) AS Subject FOR XML PATH(''), TYPE
			)
			
		,	(
			SELECT
				'屬' AS "Subject/@field"
				,(
					SELECT
					ISNULL(c.verGenusC, c.verGenusE)
					FROM 
				vwHastDupVerificationLast AS c
			WHERE 
				c.specimenOrderNum = xyz.specimenOrderNum				
				) AS Subject FOR XML PATH(''), TYPE
			)
		,	(
			SELECT
				'屬（英文）' AS "Subject/@field"
				,(
					SELECT
					c.verGenusE
					FROM 
				vwHastDupVerificationLast AS c
			WHERE 
				c.specimenOrderNum = xyz.specimenOrderNum				
				) AS Subject FOR XML PATH(''), TYPE
			)
			
		, '採集日期' AS "Date/@field"
		, CONVERT(DATE, b.collectionDate) AS [Date]
		
		
		, CASE ISNULL(CAST(xyz.WGS84Lat AS NVARCHAR),'')
			WHEN '' THEN ''
			ELSE
		
			(
			SELECT
				'緯度' AS "Coverage/@field"
				,(
					SELECT
						ROUND(c.WGS84Lat, 2)
					FROM 
				vwHastDupVerificationLast AS c
			WHERE 
				c.specimenOrderNum = xyz.specimenOrderNum				
				) AS Coverage FOR XML PATH(''), TYPE, ELEMENTS ABSENT
			)
		END
		, CASE ISNULL(CAST(xyz.WGS84Lng AS NVARCHAR),'')
			WHEN '' THEN ''
			ELSE
			(
			SELECT
				'經度' AS "Coverage/@field"
				,(
					SELECT
						ROUND(c.WGS84Lng, 2)
					FROM 
				vwHastDupVerificationLast AS c
			WHERE 
				c.specimenOrderNum = xyz.specimenOrderNum				
				) AS Coverage FOR XML PATH(''), TYPE, ELEMENTS ABSENT
			)
		END
		,	(
			SELECT
				'國家' AS "Coverage/@field"
				,(
					SELECT
					c.countryC
					FROM 
				vwHastDupVerificationLast AS c
			WHERE 
				c.specimenOrderNum = xyz.specimenOrderNum				
				) AS Coverage FOR XML PATH(''), TYPE
			)
		,	(
			SELECT
				'行政區' AS "Coverage/@field"
				,(
					SELECT
					ISNULL(c.hsienCityC, '') + ISNULL(c.hsiangTownC, '')
					FROM 
				vwHastDupVerificationLast AS c
			WHERE 
				c.specimenOrderNum = xyz.specimenOrderNum				
				) AS Coverage FOR XML PATH(''), TYPE
			)
		,	(
			SELECT
				'地點' AS "Coverage/@field"
				,(
					SELECT
					c.localityC
					FROM 
				vwHastDupVerificationLast AS c
			WHERE 
				c.specimenOrderNum = xyz.specimenOrderNum				
				) AS Coverage FOR XML PATH(''), TYPE, ELEMENTS ABSENT
			)
		, CASE ISNULL(CAST(xyz.alt AS NVARCHAR),'')
			WHEN '' THEN ''
			ELSE	
			 (
			SELECT
				'最低海拔' AS "Coverage/@field"
				,(
					SELECT
						c.alt
					FROM 
				vwHastDupVerificationLast AS c
			WHERE 
				c.specimenOrderNum = xyz.specimenOrderNum				
				) AS Coverage FOR XML PATH(''), TYPE, ELEMENTS ABSENT
			)
		END
		, CASE ISNULL(CAST(xyz.altx AS NVARCHAR),'')
			WHEN '' THEN ''
			ELSE
			(
			SELECT
				'最高海拔' AS "Coverage/@field"
				,(
					SELECT
						c.altx
					FROM 
				vwHastDupVerificationLast AS c
			WHERE 
				c.specimenOrderNum = xyz.specimenOrderNum				
				) AS Coverage FOR XML PATH(''), TYPE, ELEMENTS ABSENT
			)
		END
		,	(
			SELECT
				'標本館號' AS "Identifier/@field"
				,(
					SELECT
					c.specimenOrderNum
					FROM 
				vwHastDupVerificationLast AS c
			WHERE 
				c.specimenOrderNum = xyz.specimenOrderNum				
				) AS Identifier FOR XML PATH(''), TYPE
			)
		,	(
			SELECT
				'編目號' AS "Identifier/@field"
				,(
					SELECT
					c.collectionFLNum
					FROM
				vwHastDupVerificationLast AS c
			WHERE 
				c.specimenOrderNum = xyz.specimenOrderNum				
				) AS Identifier FOR XML PATH(''), TYPE
			)
	
		
		, '中央研究院生物多樣性研究中心' AS Publisher
		, '台灣本土植物資料庫（http://taiwanflora.sinica.edu.tw/）' AS Source
		, '中文' AS [Language]
		, '中央研究院 生物多樣性研究中心 植物標本館 Herbarium, Research Center for Biodiversity, Academia Sinica, Taipei (HAST)' AS Rights
	FROM 
		vwHastDupVerificationLast AS b
	WHERE
		b.specimenOrderNum = xyz.specimenOrderNum
		
	FOR XML PATH(''),TYPE, ELEMENTS ABSENT
	) AS MetaDesc
	
FROM
	vwHastDupVerificationLast AS xyz	
WHERE
	xyz.specimenOrderNum =zzz.specimenOrderNum 
FOR XML PATH(''),ROOT('DACatalog')	


) 
,CHAR(39), '&apos;')

AS XMLField
FROM
	vwHastDupVerificationLast AS zzz
	LEFT JOIN XMLSpecimensUpload AS t ON zzz.specimenOrderNum = t.specimenOrderNum
WHERE
	--zzz.specimenOrderNum IS NOT NULL
	t.specimenOrderNum IS NOT NULL
	AND t.uploadDate IS NULL
GO
