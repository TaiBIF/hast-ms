USE [HASTDB]
GO
/****** Object:  View [dbo].[vwHastDupVerificationWeb]    Script Date: 03/12/2018 14:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwHastDupVerificationWeb]
	
AS

	/*
	網頁顯示時用，合併部份欄位，原始和訂正資料至相同欄位
	*/

SELECT 
	SN
	/*
	, creationOperator
	, creationDate
	, updateDate
	, dataReviser
	*/	
	, specimenOrderNum
		, RTRIM(CAST(ISNULL(SN,0) AS CHAR)) + '_'
			+ RTRIM(CAST(ISNULL(dupID,0) AS CHAR)) + '_'
			+ RTRIM(CAST(ISNULL(verificationNo,0) AS CHAR)) 
		AS listID
	, dupID
	, dupNo
	, greenhouse
	, preparationDate	
	,	CASE 
			WHEN preparationDate IS NOT NULL THEN 'Plants of this collection were brought back for cultivation. This specimen was pressed on '			
		END
		AS preparation 
	, statusID
	, lifeForm
	, plantH
	, flowerID
	, flowerColor
	, fruitsID
	, fruitColor
	, sexChar
	, addChar
	, addCharC

	, DNANo
	, nameComment

	, exchangeID
	, exchangeDept
	, exchangeTo

	, collectorID
	, collectNum1
	, collectNum2
	, collectionDate
	, recordTimeStamp
	, companion
	, companionE
	, nameLF
	, nameFL
	, nameC
	, collectorName
	, CASE COALESCE(collectorID, '')
		WHEN  '' then
			CAST(LTRIM(LTRIM(ISNULL(companionE, ISNULL(companion, '')))) AS NVARCHAR) + ' ' 
		ELSE
			nameFL + ' '
		END
	 
		+ COALESCE(CAST(collectNum1 AS NVARCHAR), '')
		+ CASE
			WHEN COALESCE(collectNum1, '')='' THEN CAST(COALESCE(collectNum2, '')AS NVARCHAR)
			ELSE ' ' + COALESCE(CAST(collectNum2 AS NVARCHAR), '')
		END
		+ CASE
			WHEN collectNum1 IS NULL AND collectNum2 IS NULL THEN CAST(COALESCE(dupNo,  '') AS NVARCHAR)
			ELSE ' ' + COALESCE(CAST(dupNo AS NVARCHAR), '')
		END	
	AS collectionFLNo
	
	, nameLF + ' '
		+ CAST(COALESCE(collectNum1, '') AS NVARCHAR)
		+ CASE
			WHEN COALESCE(collectNum1, '')='' THEN CAST(COALESCE(collectNum2, '')AS NVARCHAR)
			ELSE ' ' + CAST(COALESCE(collectNum2, '')AS NVARCHAR)
		END
		+ CASE
			WHEN collectNum1 IS NULL AND collectNum2 IS NULL THEN CAST(COALESCE(dupNo,  '') AS NVARCHAR)
			ELSE ' ' + CAST(COALESCE(dupNo, '') AS NVARCHAR)
		END	
	AS collectionLFNo
	
	, nameFLC1 + ' '
		+ CAST(COALESCE(collectNum1, '') AS NVARCHAR)
		+ CASE
			WHEN COALESCE(collectNum1, '')='' THEN CAST(COALESCE(collectNum2, '')AS NVARCHAR)
			ELSE ' ' + CAST(COALESCE(collectNum2, '')AS NVARCHAR)
		END
		+ CASE
			WHEN collectNum1 IS NULL AND collectNum2 IS NULL THEN CAST(COALESCE(dupNo,  '') AS NVARCHAR)
			ELSE ' ' + CAST(COALESCE(dupNo, '') AS NVARCHAR)
		END	
	AS collectionFLCNo



	, countryNo
	, provinceNo
	, hsienNo
	, townNo
	, localityID
	, parkNo
	--, additionalDesc
	--, additionalDescE
	, WGS84Lng
	, WGS84Lat
	, alt
	, altx

	, country	
	, countryC
	
	, COALESCE(countryProvinceE, '') + 
			CASE 
				WHEN countryProvinceE IS NULL THEN ''
				WHEN COALESCE(hsienCityE, '') + COALESCE(hsiangTownE, '') ='' THEN ''
				ELSE ', '
			END
		+ COALESCE(hsienCityE, '') +
			CASE 
				WHEN hsienCityE IS NULL THEN ''
				WHEN COALESCE(hsiangTownE, '') ='' THEN ''
				ELSE ', '
			END
		+ COALESCE(hsiangTownE, '')
		AS districtE

	, COALESCE(countryProvinceC, '') + 			
		+ COALESCE(hsienCityC, '') +			
		+ COALESCE(hsiangTownC, '')
		AS districtC

	--, provinceE
	--, provinceC
	--, hsienCityE
	--, countryProvinceE
	--, countryProvinceC
	--, hsienCityC
	--, hsiangTownE
	--, hsiangTownC
	--, parkE
	--, parkC
	--, locality
	--, localityC

	/*
	, CASE dbo.fxBlockGps(SN) 
		WHEN 1 THEN NULL
		ELSE  WGS84Lng
	END AS WGS84Lng
	, CASE dbo.fxBlockGps(SN) 
		WHEN 1 THEN NULL 
		ELSE  WGS84Lat
	END AS WGS84Lat
	*/




	, COALESCE(parkE, '') +
		CASE 
			WHEN parkE IS NULL THEN ''
			WHEN COALESCE(locality, '') + COALESCE(additionalDescE, '') = '' THEN ''
			ELSE '. '
		END		
		+ COALESCE(
					CASE dbo.fxBlockGps(SN) 
					WHEN 1 THEN NULL 
					ELSE  locality
				END
					--locality
					, ''
					) + 
			CASE
				WHEN locality IS NULL THEN ''
				WHEN COALESCE(additionalDescE, '') = '' THEN ''
				ELSE '. '
			END
			
		+ COALESCE(
				
				CASE dbo.fxBlockGps(SN) 
					WHEN 1 THEN NULL 
					ELSE  additionalDescE
				END
				 
				--additionalDescE
				, ''
				) +
			CASE
				WHEN RIGHT(additionalDescE, 1) = '.' THEN ''
				ELSE ''
			END
		AS localityDescE

	, COALESCE(parkC, '') +
		CASE 
			WHEN parkC IS NULL THEN ''
			WHEN COALESCE(localityC, '') + COALESCE(additionalDesc, '') = '' THEN ''
			ELSE ', '
		END		
		+ COALESCE(
			CASE dbo.fxBlockGps(SN) 
					WHEN 1 THEN NULL 
					ELSE localityC
				END
			--localityC
			, ''
			) + 
			CASE
				WHEN localityC IS NULL THEN ''
				WHEN COALESCE(additionalDesc, '') = '' THEN ''
				ELSE ', '
			END
			
		+ COALESCE(
			
			CASE dbo.fxBlockGps(SN) 
					WHEN 1 THEN NULL 
					ELSE  additionalDesc
				END
			 
			--additionalDesc
			, ''
			)
		AS localityDescC
			
		, ISNULL(provinceE, '') + ', ' + ISNULL(hsienCityE, '') + ', ' + ISNULL(hsiangTownE, '') 
			+ ISNULL(parkE, '') + ' ,' + ISNULL(locality, '') + ', ' + ISNULL(additionalDescE, '')
			+ ISNULL(provinceC, '') + ISNULL(hsienCityC, '') + ISNULL(hsiangTownC, '') + ',' 
			+ ISNULL(parkC, '') + ',' + ISNULL(localityC, '') + ',' + ISNULL(additionalDesc, '')
		AS location




	--, province
	--, hsienCity
	--, hsiangTown
	--, park
	--, localityX
	--, additionalDescX

	, veget
	, topography
	, habitat
	, naturalnessID
	, lightID
	, humidityID
	, abundanceID
	, projectID
	, note
	, noteE

	, flower
	--, flowerC
	, fruits
	--, fruitsC

	, naturalnessStatus
	--, naturalnessC
	, lightIntensity
	--, lightC
	, humidity
	--, humidityC
	, abundance
	--, abundanceC
	, projectName

	, trophicID
	--, trophic
	--, trophicC
	, hostFamilyID
	, hostGenusID
	, hostSpeciesID
	--, hostFamilyE
	--, hostFamilyC
	--, hostGenusE
	--, hostGenusC
	--, hostSpeciesE
	--, hostSpeciesC
	,
	CASE 
		WHEN trophic IS NOT NULL THEN trophic + ' ' + 
		CASE
			WHEN hostSpeciesE IS NOT NULL THEN hostSpeciesE
			WHEN hostSpeciesE IS NULL AND hostGenusE IS NOT NULL THEN hostGenusE
			WHEN hostSpeciesE IS NULL AND hostGenusE IS NULL AND hostFamilyE IS NOT NULL THEN hostFamilyE		
		END
	END								 
	AS trophicData	

	/*
	, OSN
	, verOFamilyID
	, verOGenusID
	, verOSpeciesID
	, verOFamilyE
	, verOFamilyC
	, verOGenusE
	, verOGenusC
	, verOSpeciesE
	, verOSpeciesC
	, verifierOName
	, verifierONameFL
	, verODate
	, verOUnformedDate
	*/
	
		
	, VSN
	, verFamilyID
	, verGenusID
	, verSpeciesID
	, verFamilyE
	, verFamilyC
	, verGenusE
	, verGenusC
	, verSpeciesE
	, verSpeciesC
		, verFullTaxonName
	, verificationNo
	, verifierName
	, verifierNameFL
	, verDate
	, verUnformedDate
	
	
	/*
	, CASE 
		WHEN WGS84Lng IS NULL OR WGS84Lat IS NULL THEN ''
		ELSE			
			CAST(ABS(CONVERT(INT, WGS84Lat)) AS NVARCHAR) + '°'
			+
			CAST(CONVERT(INT, ((ABS(WGS84Lat) - ABS(CONVERT(INT, WGS84Lat))) * 60)) AS NVARCHAR)
			+ CHAR(39)
			+  CAST(CONVERT(INT, ROUND(((ABS(WGS84Lat) - ABS(CONVERT(INT, WGS84Lat))) * 60 -	CONVERT(INT,((ABS(WGS84Lat) - ABS(CONVERT(INT, WGS84Lat))) * 60) ))*60, 0)) AS NVARCHAR)
			+CHAR(34)
			+ CASE
				WHEN WGS84Lat < 0 THEN 'S'
				ELSE 'N'
			END
			+
			+ ', '			
			+
			CAST(ABS(CONVERT(INT, WGS84Lng)) AS NVARCHAR) + '°' 
			+
			CAST(CONVERT(INT, ((ABS(WGS84Lng) - ABS(CONVERT(INT, WGS84Lng))) * 60)) AS NVARCHAR) 
			+ CHAR(39)
			+  CAST(CONVERT(INT, ROUND(((ABS(WGS84Lng) - ABS(CONVERT(INT, WGS84Lng))) * 60 -	CONVERT(INT,((ABS(WGS84Lng) - ABS(CONVERT(INT, WGS84Lng))) * 60) ))*60, 0)) AS NVARCHAR)
			+CHAR(34)
			+ CASE
				WHEN WGS84Lng < 0 THEN 'W' 
				ELSE 'E'
			END 
	END
	AS GPSInfo
	*/
	
	,
	CAST(alt AS NVARCHAR) 
		+
		CASE 
			WHEN altx IS NOT NULL THEN ' - ' + CAST(altx AS NVARCHAR)
			ELSE ''
		END	
	AS elevation

from
	vwHastDupVerification
GO
