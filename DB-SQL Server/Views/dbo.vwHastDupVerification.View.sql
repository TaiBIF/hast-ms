USE [HASTDB]
GO
/****** Object:  View [dbo].[vwHastDupVerification]    Script Date: 03/12/2018 14:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwHastDupVerification]

AS

	/*
	詳細的採集資訊
	含所有鑑訂資料在同一欄位
	含複份資料	
	*/

SELECT	
	
	vwHast.SN
	, creationOperator
	, vwHast.creationDate
	, vwHast.updateDate
	, dataReviser

		, specimens.specimenOrderNum

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

	, countryNo
	, provinceNo
	, hsienNo
	, townNo
	, localityID	
	, parkNo
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
		, verifier.nameFLC2 AS verifierName
		, verifier.nameFL AS verifierNameFL
		, ver.verificationDate AS verDate
		, ver.unformedVdate AS verUnformedDate
	
			, ISNULL(verFamily.familyE, '') + ', '
				+ ISNULL(verGenus.genusE, '') + ', '
				+ ISNULL(verSpecies.speciesE, '') + ', '
				+ ISNULL(verFamily.familyC, '') 				
				+ ISNULL(verGenus.genusC, '') 				
				+ ISNULL(verSpecies.speciesC, '') 
			AS verFullTaxonName --完整分類階層名稱，用於文字欄位查詢

FROM

	vwHast
	--LEFT JOIN verification AS ver ON vwHast.SN = ver.SN
	LEFT JOIN vwVerificationPatch AS ver ON vwHast.SN = ver.SN
	LEFT JOIN family AS verFamily ON ver.familyID = verFamily.familyID
	LEFT JOIN genus AS verGenus ON ver.genusID = verGenus.genusID
	LEFT JOIN species AS verSpecies ON ver.speciesID = verSpecies.speciesID
	LEFT JOIN vwPersonName AS verifier ON ver.verifierID  = verifier.pid

	LEFT JOIN duplications ON vwhast.SN = duplications.SN
	LEFT JOIN specimens ON duplications.dupID = specimens.dupID

	LEFT JOIN flower ON duplications.flowerID = flower.flowerID
	LEFT JOIN fruits ON duplications.fruitsID = fruits.fruitsID

	LEFT JOIN exchangeTo ON duplications.exchangeID = exchangeTo.exchangeID
GO
