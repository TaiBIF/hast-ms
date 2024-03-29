USE [HASTDB]
GO
/****** Object:  View [dbo].[vwXMLImages]    Script Date: 03/12/2018 14:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  VIEW [dbo].[vwXMLImages]

AS

SELECT --top 100
	zzz.imageCode
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
			
				, '內容主題:生物:植物界' 
				/*
				+
				CASE ISNULL(A.orderC , '') 
					WHEN '' THEN ''
					ELSE
						CASE ISNULL(A.classHastC, '')
							WHEN '' THEN ''
							ELSE
								CASE ISNULL(A.divisionC, '')
									WHEN '' THEN ''
									ELSE
										':' + A.divisionC + ':' + A.classHastC + ':' + A.orderC  
										+ ':' + ISNULL(A.familyC, A.familyE)
						END
								END
				END
				*/	
				AS Record		
			FROM 
				vwImageDetail AS a
			WHERE 
				a.imageCode= xyz.imageCode
			FOR XML PATH(''),ROOT('Catalog'),TYPE
			)
			, imageCode AS DigiArchiveID
			, 'http://www.hast.biodiv.tw/Photo/ImageDetailC.aspx?imageCode=' 
				+ imageCode AS Hyperlink
			, 'CC 2.5 BY-NC-ND' AS "ICON/@license"
			,'http://img.hast.biodiv.tw/Album/image' +
				CASE ISNUMERIC(imageCode)
					WHEN 1 THEN 
						  REPLICATE('0', 3 -LEN(FLOOR((imageCode - 1)/10000) ) )
							+ CAST(FLOOR((imageCode - 1)/10000) AS NVARCHAR(3)) + '/'
							+ CASE CAST(RIGHT(imageCode, 4) AS NVARCHAR(4))
								WHEN '0000' THEN '9'			
								ELSE CAST(FLOOR((RIGHT(imageCode, 4) -1)/1000) AS NVARCHAR(1))
							END
						+ '/'
						+ REPLICATE('0', 7 - LEN(imageCode)) 
						+ CAST(imageCode AS NVARCHAR(7))
						
					ELSE 'File/' + imageCode
				END
				+ '.jpg'
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
						ISNULL(c.speciesC, ISNULL(c.speciesE, ISNULL(c.genusC, ISNULL(c.genusE, ISNULL(c.familyC, c.familyE)))))
						FROM 
					vwImageDetail AS c
				WHERE 
					c.imageCode = xyz.imageCode				
					) AS Title FOR XML PATH(''), TYPE
				) 		
			,	(
				SELECT
					'學名' AS "Title/@field"
					,(
						SELECT
						c.speciesE
						FROM 
					vwImageDetail AS c
				WHERE 
					c.imageCode = xyz.imageCode				
					) AS Title FOR XML PATH(''), TYPE
				)
			
			/* 
					
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
					vwImageDetail AS c
				WHERE 
					c.imageCode = xyz.imageCode				
					) AS Subject FOR XML PATH(''), TYPE
				)
			,	(
				SELECT
					'門（英文）' AS "Subject/@field"
					,(
						SELECT
						c.divisionE
						FROM 
					vwImageDetail AS c
				WHERE 
					c.imageCode = xyz.imageCode				
					) AS Subject FOR XML PATH(''), TYPE
				)
						
			,	(
				SELECT
					'綱' AS "Subject/@field"
					,(
						SELECT
						c.classHastC
						FROM 
					vwImageDetail AS c
				WHERE 
					c.imageCode = xyz.imageCode				
					) AS Subject FOR XML PATH(''), TYPE
				)
			,	(
				SELECT
					'綱（英文）' AS "Subject/@field"
					,(
						SELECT
						c.classHastE
						FROM 
					vwImageDetail AS c
				WHERE 
					c.imageCode = xyz.imageCode				
					) AS Subject FOR XML PATH(''), TYPE
				)
		
			,	(
				SELECT
					'目' AS "Subject/@field"
					,(
						SELECT
						c.orderC
						FROM 
					vwImageDetail AS c
				WHERE 
					c.imageCode = xyz.imageCode				
					) AS Subject FOR XML PATH(''), TYPE
				)
			,	(
				SELECT
					'目（英文）' AS "Subject/@field"
					,(
						SELECT
						c.orderE
						FROM 
					vwImageDetail AS c
				WHERE 
					c.imageCode = xyz.imageCode				
					) AS Subject FOR XML PATH(''), TYPE
				)
				
				,  
				*/
				
				,(
				SELECT
					
					(
						SELECT
						c.classC
						FROM 
					vwImageDetail AS c
				WHERE 
					c.imageCode = xyz.imageCode				
					) AS Subject FOR XML PATH(''), TYPE
				) 
						,(
				SELECT
					
					(
						SELECT
						c.classE
						FROM 
					vwImageDetail AS c
				WHERE 
					c.imageCode = xyz.imageCode				
					) AS Subject FOR XML PATH(''), TYPE
				) 
				
				--, classE AS Subject
				,	(
				SELECT
					'科' AS "Subject/@field"
					,(
						SELECT
						ISNULL(c.familyC, c.familyE)
						FROM 
					vwImageDetail AS c
				WHERE 
					c.imageCode = xyz.imageCode				
					) AS Subject FOR XML PATH(''), TYPE
				)
			,	(
				SELECT
					'科（英文）' AS "Subject/@field"
					,(
						SELECT
						c.familyE
						FROM 
					vwImageDetail AS c
				WHERE 
					c.imageCode = xyz.imageCode				
					) AS Subject FOR XML PATH(''), TYPE
				)
				
			,	(
				SELECT
					'屬' AS "Subject/@field"
					,(
						SELECT
						ISNULL(c.genusC, c.genusE)
						FROM 
					vwImageDetail AS c
				WHERE 
					c.imageCode = xyz.imageCode				
					) AS Subject FOR XML PATH(''), TYPE
				)
			,	(
				SELECT
					'屬（英文）' AS "Subject/@field"
					,(
						SELECT
						c.genusE
						FROM 
					vwImageDetail AS c
				WHERE 
					c.imageCode = xyz.imageCode				
					) AS Subject FOR XML PATH(''), TYPE
				)
			, '主題' AS "Description/@field"	
			, 
			RTRIM(
				CASE wholePlant
					WHEN 1 THEN '全株 '
					ELSE ''
				END +
				CASE [root]
					WHEN 1 THEN '根 '
					ELSE ''
				END +
				CASE stem
					WHEN 1 THEN '莖 '
					ELSE ''
				END +
				CASE leaf
					WHEN 1 THEN '葉 '
					ELSE ''
				END +
				CASE flower
					WHEN 1 THEN '花 '
					ELSE ''
				END +
				CASE fruit
					WHEN 1 THEN '果 '
					ELSE ''
				END +
				CASE seed
					WHEN 1 THEN '種子 '
					ELSE ''
				END +
				CASE sorus
					WHEN 1 THEN '孢子囊群 '
					ELSE ''
				END +
				CASE pistillateFlower
					WHEN 1 THEN '雌花 '
					ELSE ''
				END +
				CASE staminateFlower
					WHEN 1 THEN '雄花 '
					ELSE ''
				END 
			)
			AS Description
			
			, '拍攝日期' AS "Date/@field"
			, CONVERT(DATE, b.collectionDate) AS [Date]
			
			, CASE COALESCE(b.authorC, b.authorFL, '')
				WHEN '' THEN ''
				ELSE
				(
				SELECT
					'拍攝者' AS "Creator/@field"
					,(
						SELECT
							COALESCE(b.authorC, b.authorFL, '')
						FROM 
					vwImageDetail AS c
				WHERE 
					c.imageCode = xyz.imageCode				
					) AS Creator FOR XML PATH(''), TYPE, ELEMENTS ABSENT
				)
			END	
			
			,	(
				SELECT
					'地名' AS "Coverage/@field"
					,(
						SELECT
						c.localityC
						FROM 
					vwImageDetail AS c
				WHERE 
					c.imageCode = xyz.imageCode				
					) AS Coverage FOR XML PATH(''), TYPE, ELEMENTS ABSENT
				)
			
			,	(
				SELECT
					'國家' AS "Coverage/@field"
					,(
						SELECT
						c.countryC
						FROM 
					vwImageDetail AS c
				WHERE 
					c.imageCode = xyz.imageCode				
					) AS Coverage FOR XML PATH(''), TYPE
				)
			,	(
				SELECT
					'行政區' AS "Coverage/@field"
					,(
						SELECT
						ISNULL(c.hsienCityC, '') + ISNULL(c.hsiangTownC, '')
						FROM 
					vwImageDetail AS c
				WHERE 
					c.imageCode = xyz.imageCode				
					) AS Coverage FOR XML PATH(''), TYPE
				)
			
			
			,	(
				SELECT
					'圖檔' AS "Identifier/@field"
					,(
						SELECT
						c.imageCode
						FROM 
					vwImageDetail AS c
				WHERE 
					c.imageCode = xyz.imageCode				
					) AS Identifier FOR XML PATH(''), TYPE
				)
			
		
			
			, '中央研究院生物多樣性研究中心' AS Publisher
			, '台灣本土植物資料庫（影像資料庫）（http://taiwanflora.sinica.edu.tw/）' AS Source
			, '中文' AS [Language]
			, '中央研究院 生物多樣性研究中心 植物標本館 Herbarium, Research Center for Biodiversity, Academia Sinica, Taipei (HAST)' AS Rights
		FROM 
			vwImageDetail AS b
		WHERE
			b.imageCode = xyz.imageCode
			
		FOR XML PATH(''),TYPE, ELEMENTS ABSENT
		) AS MetaDesc
		
	FROM
		vwImageDetail AS xyz	
	WHERE
		xyz.imageCode =zzz.imageCode 
	FOR XML PATH(''),ROOT('DACatalog')	


		) ,CHAR(39), '&apos;'
	)

AS XMLField
FROM
	vwImageDetail AS zzz
	INNER JOIN XMLImagesUpload AS x ON zzz.imageCode = x.imageCode 
WHERE
	x.uploadDate IS NULL
GO
