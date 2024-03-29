USE [HASTDB]
GO
/****** Object:  View [dbo].[vwImageDetail]    Script Date: 03/12/2018 14:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwImageDetail]

AS

	/*
	影像詳細資料
	*/


SELECT	
	
	vwHast.SN
	, i.creationDate
	, vwHast.collectorID
	, collectNum1
	, collectNum2
	, collectionDate
	, recordTimeStamp
	--, companion
	--, companionE	

		, vwHast.nameLF
		, vwHast.nameFL
		, vwHast.nameC
		, collectorName
		, vwHast.nameFL + ' '
		+ CAST(COALESCE(collectNum1, '') AS NVARCHAR)
		+ CASE
			WHEN COALESCE(collectNum1, '')='' THEN CAST(COALESCE(collectNum2, '')AS NVARCHAR)
			ELSE ' ' + CAST(COALESCE(collectNum2, '')AS NVARCHAR)
		END
		/*
		+ CASE
			WHEN collectNum1 IS NULL AND collectNum2 IS NULL THEN CAST(COALESCE(dupNo,  '') AS NVARCHAR)
			ELSE ' ' + CAST(COALESCE(dupNo, '') AS NVARCHAR)
		END	
		*/
		AS collectionFLNo

		, vwHast.nameLF + ' '
		+ CAST(COALESCE(collectNum1, '') AS NVARCHAR)
		+ CASE
			WHEN COALESCE(collectNum1, '')='' THEN CAST(COALESCE(collectNum2, '')AS NVARCHAR)
			ELSE ' ' + CAST(COALESCE(collectNum2, '')AS NVARCHAR)
		END
		/*
		+ CASE
			WHEN collectNum1 IS NULL AND collectNum2 IS NULL THEN CAST(COALESCE(dupNo,  '') AS NVARCHAR)
			ELSE ' ' + CAST(COALESCE(dupNo, '') AS NVARCHAR)
		END	
		*/
	AS collectionLFNo

	, vwHast.nameFLC1 + ' '
		+ CAST(COALESCE(collectNum1, '') AS NVARCHAR)
		+ CASE
			WHEN COALESCE(collectNum1, '')='' THEN CAST(COALESCE(collectNum2, '')AS NVARCHAR)
			ELSE ' ' + CAST(COALESCE(collectNum2, '')AS NVARCHAR)
		END
		/*
		+ CASE
			WHEN collectNum1 IS NULL AND collectNum2 IS NULL THEN CAST(COALESCE(dupNo,  '') AS NVARCHAR)
			ELSE ' ' + CAST(COALESCE(dupNo, '') AS NVARCHAR)
		END	
		*/
	AS collectionFLCNo

	, countryNo
	, vwHast.provinceNo
	, vwHast.hsienNo
	, vwHast.townNo
	, localityID	
	, vwHast.parkNo
	, additionalDesc
	, additionalDescE
	, WGS84Lng
	, WGS84Lat
	, alt
	, altx

		, country		
		, countryC


		, provinceE
		, provinceC
		, hsienCityE
		, hsienCityC
		, hsiangTownE
		, hsiangTownC

		

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
			WHEN COALESCE(locality, '') + COALESCE(additionalDescE, '') = '' THEN ''
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
	,
	CAST(alt AS NVARCHAR) 
		+
		CASE 
			WHEN altx IS NOT NULL THEN ' - ' + CAST(altx AS NVARCHAR)
			ELSE ''
		END	
	AS elevation

		, ver.SN AS VSN
		, verFamily.class AS classID		
		, ver.familyID AS familyID
		, ver.genusID AS genusID
		, ver.speciesID AS speciesID
		, verClass.classE
		, verClass.classC
		, verFamily.familyE AS familyE
		, verFamily.familyC AS familyC
		, verGenus.genusE AS genusE
		, verGenus.genusC AS genusC
		, verSpecies.speciesE AS speciesE
		, verSpecies.speciesC AS speciesC
		, ver.verificationNo AS verificationNo
		, verifier.nameFLC2 AS verifierName
		, verifier.nameFL AS verifierNameFL
		, ver.verificationDate AS verDate

		, ISNULL(verFamily.familyE, '') + ', '
				+ ISNULL(verGenus.genusE, '') + ', '
				+ ISNULL(verSpecies.speciesE, '') + ', '
				+ ISNULL(verFamily.familyC, '') 				
				+ ISNULL(verGenus.genusC, '') 				
				+ ISNULL(verSpecies.speciesC, '') 
			AS verFullTaxonName --完整分類階層名稱，用於文字欄位查詢

		, i.imageCode
		, i.sourceID
		, i.categoryID
		, i.note
		, i.providerID		
		, i.photoDate
		, i.greenhouse
		, i.publicWeb
		, COALESCE(i.wholePlant, 0) AS wholePlant 
		, COALESCE(i.root, 0) AS root
		, COALESCE(i.stem, 0) AS stem
		, COALESCE(i.leaf, 0) AS leaf
		, COALESCE(i.flower, 0) AS flower
		, COALESCE(i.fruit, 0) AS fruit
		, COALESCE(i.seed, 0) AS seed
		, COALESCE(i.sorus, 0) AS sorus
		, COALESCE(i.pistillateFlower, 0) AS pistillateFlower
		, COALESCE(i.staminateFlower, 0) AS staminateFlower

		, ic.categoryC
		, ic.categoryE		
		, iSF.imageSourceFormat
		, i.imgAuthorID
		, author.nameC AS authorC
		, author.nameLF AS authorLF
		, author.nameLFC1 AS authorLFC1
		--, author.nameLFC2 AS authorLFC2
		, author.nameFL AS authorFL
		, author.nameFLC1 AS authorFLC1
		--, author.nameFLC2 AS authorFLC2

		, divisionC
		, divisionE
		, classHAST.classID AS classHastID
		, classHAST.classC AS classHastC
		, classHAST.classE AS classHastE
		, orderC		
		, orderE

		
FROM

	vwHast 
	INNER JOIN images AS i ON vwHast.SN = i.SN
	
	--LEFT JOIN verification AS ver ON vwHast.SN = ver.SN
	LEFT JOIN vwVerificationLast AS ver ON vwHast.SN = ver.SN
	LEFT JOIN family AS verFamily ON ver.familyID = verFamily.familyID
	LEFT JOIN classX AS verClass ON verFamily.class = verClass.classID
	LEFT JOIN genus AS verGenus ON ver.genusID = verGenus.genusID
	LEFT JOIN species AS verSpecies ON ver.speciesID = verSpecies.speciesID
	LEFT JOIN vwPersonName AS verifier ON ver.verifierID  = verifier.pid
	
	LEFT JOIN [order] ON [order].orderID = verFamily.orderID 
	LEFT JOIN classHAST ON classHast.classID = [order].classHASTNO
	LEFT JOIN division ON division.divisionID = classHAST.divisionID
	
	LEFT JOIN imageCategory AS ic ON i.categoryID = ic.categoryID	
	LEFT JOIN imageSourceFormat AS iSF ON i.sourceID = iSF.sourceID
	LEFT JOIN vwPersonName AS author ON i.imgAuthorID = author.pid
GO
