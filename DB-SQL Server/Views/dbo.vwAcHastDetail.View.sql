USE [HASTDB]
GO
/****** Object:  View [dbo].[vwAcHastDetail]    Script Date: 03/12/2018 14:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwAcHastDetail]

AS

	/*
	詳細的採集資料
	區隔鑑訂資料至不同欄的詳細採集資訊
	用於列印標籤
	*/

SELECT	
	
	vwHast.SN
	, creationOperator
	, creationDate
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
		, collectorName
		, vwHast.NameFLC1

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

		, NULLIF(provinceE, country) AS countryProvinceE
		, NULLIF(provinceC, countryC) AS countryProvinceC
		
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

		, verO.SN AS OSN
		, verO.familyID AS verOFamilyID
		, verO.genusID AS verOGenusID
		, verO.speciesID AS verOSpeciesID
		, verOFamily.familyE AS verOFamilyE
		, verOFamily.familyC AS verOFamilyC
		, verOGenus.genusE AS verOGenusE
		, verOGenus.genusC AS verOGenusC
		, verOSpecies.speciesE AS verOSpeciesE
		, verOSpecies.speciesC AS verOSpeciesC
		, verifierO.nameFLC2 AS verifierOName
		, verifierO.nameFLC1 AS verifierONameFLC1
		, verifierO.nameFL AS verifierONameFL
		, verO.verificationDate AS verODate
		, verO.unformedVdate AS verOUnformedDate

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
		, verifier.nameFLC1 AS verifierNameFLC1
		, verifier.nameFL AS verifierNameFL
		, ver.verificationDate AS verDate
		, ver.unformedVdate AS verUnformedDate
			

FROM

	vwHast

	 
	LEFT JOIN duplications ON vwHast.SN = duplications.SN
	LEFT JOIN specimens ON duplications.dupID = specimens.dupID

	LEFT JOIN flower ON duplications.flowerID = flower.flowerID
	LEFT JOIN fruits ON duplications.fruitsID = fruits.fruitsID

	LEFT JOIN exchangeTo ON duplications.exchangeID = exchangeTo.exchangeID

	LEFT JOIN vwVerificationOriginal AS verO ON vwHast.SN = verO.SN
		LEFT JOIN family AS verOFamily ON verO.familyID = verOFamily.familyID
		LEFT JOIN genus AS verOGenus ON verO.genusID = verOGenus.genusID
		LEFT JOIN species AS verOSpecies ON verO.speciesID = verOSpecies.speciesID
		LEFT JOIN vwPersonName AS verifierO ON verO.verifierID  = verifierO.pid
	--LEFT JOIN vwVerification AS ver ON vwHast.SN = ver.SN
	LEFT JOIN vwVerificationPatch AS ver ON vwHast.SN = ver.SN
		LEFT JOIN family AS verFamily ON ver.familyID = verFamily.familyID
		LEFT JOIN genus AS verGenus ON ver.genusID = verGenus.genusID
		LEFT JOIN species AS verSpecies ON ver.speciesID = verSpecies.speciesID
		LEFT JOIN vwPersonName AS verifier ON ver.verifierID  = verifier.pid
GO
