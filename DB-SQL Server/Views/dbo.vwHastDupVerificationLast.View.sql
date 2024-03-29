USE [HASTDB]
GO
/****** Object:  View [dbo].[vwHastDupVerificationLast]    Script Date: 03/12/2018 14:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwHastDupVerificationLast]

AS

	/*
	詳細的採集資訊
	最後一次訂正記錄
	含複份資料	
	*/

SELECT	
	
	vwHast.SN
	, creationOperator
	, vwHast.creationDate
	, vwHast.updateDate
	, dataReviser

		, specimens.specimenOrderNum
			, RTRIM(CAST(ISNULL(vwHast.SN,0) AS CHAR)) + '_'
			+ RTRIM(CAST(ISNULL(duplications.dupID,0) AS CHAR)) + '_'
			+ RTRIM(CAST(ISNULL(verificationNo,0) AS CHAR)) 
			AS listID
		, duplications.dupID
		, duplications.dupNo
		, duplications.greenhouse
		, duplications.preparationDate
		, duplications.statusID
		, duplications.lifeForm
		, duplications.plantH
		, duplications.flowerID
		, duplications.flowerColor
		, duplications.fruitsID
		, duplications.fruitColor
		, duplications.sexChar
		, duplications.addChar
		, duplications.addCharC
		--, duplications.noSpecimens
		, duplications.DNANo
		, duplications.nameComment
		, duplications.exchangeID
		, duplications.exchangeDept
		
		, exchangeTo.exchangeTo
		

		/*
		, specimenOrderNum

		, dupID
		, dupNo
		, greenhouse
		, preparationDate
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
		--, duplications.noSpecimens
		, DNANo
		, nameComment
		, exchangeID
		, exchangeDept
		, exchangeTo

		*/

	, collectorID
	, collectNum1
	, collectNum2
	, collectionDate
	, recordTimeStamp
	, companion
	, companionE	

		, vwHast.nameLF
		, vwHast.nameFL
		, vwHast.nameFLC1
		, collectorName
		, vwHast.nameC

		, RTRIM(
		LTRIM(ISNULL(vwHast.nameLF + ' ', ''))
		+ LTRIM(ISNULL(CAST(collectNum1 AS NVARCHAR) + ' ', '')) 
		+ ISNULL(collectNum2, '') 
		) AS collectionNum
		
		, RTRIM(
		LTRIM(ISNULL(vwHast.nameFL + ' ', ''))
		+ LTRIM(ISNULL(CAST(collectNum1 AS NVARCHAR) + ' ', '')) 
		+ ISNULL(collectNum2, '') 
		) AS collectionFLNum

			, CASE COALESCE(collectorID, '')
			WHEN  '' then
				CAST(LTRIM(LTRIM(ISNULL(companionE, ISNULL(companion, '')))) AS NVARCHAR) + ' ' 
			ELSE
				vwHast.nameFL + ' '
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
			, vwHast.nameLF + ' '
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
			
			, vwHast.nameFLC1 + ' '
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
	, additionalDesc
	, additionalDescE
	
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
		
		
		, COALESCE(parkE, '') +
		CASE 
			WHEN parkE IS NULL THEN ''
			WHEN COALESCE(locality, '') + COALESCE(additionalDescE, '') = '' THEN ''
			ELSE '. '
		END		
		+ COALESCE(locality, '') + 
			CASE
				WHEN locality IS NULL THEN ''
				WHEN COALESCE(additionalDescE, '') = '' THEN ''
				ELSE '. '
			END
			
		+ COALESCE(additionalDescE, '') +
			CASE
				WHEN RIGHT(additionalDescE, 1) = '.' THEN ''
				ELSE ''
			END
		AS localityDescE

	, COALESCE(parkC, '') +
		CASE 
			WHEN parkC IS NULL THEN ''
			WHEN COALESCE(locality, '') + COALESCE(additionalDesc, '') = '' THEN ''
			ELSE ', '
		END		
		+ COALESCE(localityC, '') + 
			CASE
				WHEN localityC IS NULL THEN ''
				WHEN COALESCE(additionalDesc, '') = '' THEN ''
				ELSE ', '
			END
			
		+ COALESCE(additionalDesc, '')
		AS localityDescC
			
		, ISNULL(provinceE, '') + ', ' + ISNULL(hsienCityE, '') + ', ' + ISNULL(hsiangTownE, '') 
			+ ISNULL(parkE, '') + ' ,' + ISNULL(locality, '') + ', ' + ISNULL(additionalDescE, '')
			+ ISNULL(provinceC, '') + ISNULL(hsienCityC, '') + ISNULL(hsiangTownC, '') + ',' 
			+ ISNULL(parkC, '') + ',' + ISNULL(localityC, '') + ',' + ISNULL(additionalDesc, '')
		AS location

	, WGS84Lng
	, WGS84Lat
	/*
		, CASE dbo.fxBlockGps(vwHast.SN) 
		WHEN 1 THEN NULL
		ELSE  WGS84Lng
	END AS WGS84Lng
	, CASE dbo.fxBlockGps(vwHast.SN) 
		WHEN 1 THEN NULL 
		ELSE  WGS84Lat
	END AS WGS84Lat
	*/
	, alt
	, altx

		, country		
		, countryC
		, provinceE
		, provinceC
			--, NULLIF(provinceE, country) AS countryProvinceE
			--, NULLIF(provinceC, countryC) AS countryProvinceC
			, countryProvinceE
			, countryProvinceC
		, hsienCityE
		, hsienCityC
		, hsiangTownE
		, hsiangTownC
		, parkE
		, parkC
		, locality
		, localityC

		, province

		, hsienCity

		, hsiangTown

		, park
		
		, localityX

		, additionalDescX


	, veget
	, topography
	, habitat
	, naturalnessID
	, lightID
	, humidityID
	, abundanceID
	, projectID
	, vwHast.note
	, noteE

		, flower.flower
		, flower.flowerC
		, fruits.fruits
		, fruits.fruitsC

		/*		
		, flower
		, flowerC
		, fruits
		, fruitsC
		*/

		, naturalnessStatus
		, naturalnessC
		, lightIntensity
		, lightC
		, humidity
 		, humidityC
		, abundance
		, abundanceC
		, projectName

		, trophicID
		, trophic
		, trophicC
		, hostFamilyID
		, hostGenusID
		, hostSpeciesID
		, hostFamilyE
		, hostFamilyC
		, hostGenusE
		, hostGenusC
		, hostSpeciesE
		, hostSpeciesC		


		, ver.SN AS VSN
		, ver.familyID AS verFamilyID
		, ver.genusID AS verGenusID
		, ver.speciesID AS verSpeciesID
		
		, verFamily.familyE AS verFamilyE
		, verFamily.familyC AS verFamilyC
		, verGenus.genusE AS verGenusE
		, verGenus.genusC AS verGenusC
		, verSpecies.speciesE AS verSpeciesE
		, verSpecies.speciesC AS verSpeciesC
		, ver.verificationNo AS verificationNo
		, verifier.nameC AS verifierNameC
		, verifier.nameFLC2 AS verifierName
		, verifier.nameFL AS verifierNameFL
		, ver.verificationDate AS verDate
		--, ver.unformedVdate AS verUnformedDate
	
			, ISNULL(verFamily.familyE, '') + ', '
				+ ISNULL(verGenus.genusE, '') + ', '
				+ ISNULL(verSpecies.speciesE, '') + ', '
				+ ISNULL(verFamily.familyC, '') 				
				+ ISNULL(verGenus.genusC, '') 				
				+ ISNULL(verSpecies.speciesC, '') 
			AS verFullTaxonName --完整分類階層名稱，用於文字欄位查詢
		, divisionC
		, divisionE
		, classHAST.classID
		, classHAST.classC
		, classHAST.classE
		, orderC		
		, orderE
		, classHAST.[class]
		
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

FROM

	vwHast
	--LEFT JOIN verification AS ver ON vwHast.SN = ver.SN
	LEFT JOIN vwVerificationLast AS ver ON vwHast.SN = ver.SN
	
		
	
	LEFT JOIN family AS verFamily ON ver.familyID = verFamily.familyID
	LEFT JOIN genus AS verGenus ON ver.genusID = verGenus.genusID
	LEFT JOIN species AS verSpecies ON ver.speciesID = verSpecies.speciesID
	LEFT JOIN vwPersonName AS verifier ON ver.verifierID  = verifier.pid
	
	
	LEFT JOIN [order] ON [order].orderID = verFamily.orderID 
	LEFT JOIN classHAST ON classHast.classID = [order].classHASTNO
	LEFT JOIN division ON division.divisionID = classHAST.divisionID

	LEFT JOIN duplications ON vwhast.SN = duplications.SN
	LEFT JOIN specimens ON duplications.dupID = specimens.dupID

	LEFT JOIN flower ON duplications.flowerID = flower.flowerID
	LEFT JOIN fruits ON duplications.fruitsID = fruits.fruitsID

	LEFT JOIN exchangeTo ON duplications.exchangeID = exchangeTo.exchangeID
GO
