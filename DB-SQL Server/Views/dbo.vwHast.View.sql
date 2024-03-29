USE [HASTDB]
GO
/****** Object:  View [dbo].[vwHast]    Script Date: 03/12/2018 14:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  VIEW [dbo].[vwHast]


AS
	/*
	不含鑑訂資料、不含複份資料的詳細採集資料	
	*/

SELECT

	hast.SN
	, hast.creationOperator
	, hast.creationDate
	, hast.updateDate
	, hast.dataReviser

		/*

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
		*/

	, hast.collectorID
	, hast.collectNum1
	, hast.collectNum2
	, hast.collectionDate
	, hast.recordTimeStamp
	, hast.companion
	, hast.companionE	
		
		, collector.nameC
		, collector.nameLF
		, collector.nameFL
		, collector.nameFLC1
		, collector.nameFLC2 AS collectorName

	, hast.countryNo
	, hast.provinceNo
	, hast.hsienNo
	, hast.townNo
	, hast.localityID	
	, hast.parkNo
	, hast.additionalDesc
	, hast.additionalDescE
	--, hast.WGS84Lng
	--, hast.WGS84Lat
		, CASE dbo.fxBlockGps(hast.SN) 
			WHEN 1 THEN NULL
			ELSE  WGS84Lng
		END AS WGS84Lng
		, CASE dbo.fxBlockGps(hast.SN) 
			WHEN 1 THEN NULL 
			ELSE  WGS84Lat
		END AS WGS84Lat
	, hast.alt
	, hast.altx

		, country.country		
		, country.countryC
		, province.provinceE
		, province.provinceC
		, hsienCity.hsienCityE
		, hsienCity.hsienCityC
		, hsiangTown.hsiangTownE
		, hsiangTown.hsiangTownC
		, nationalPark.parkE
		, nationalPark.parkC
		, locality.locality
		, locality.localityC

		, provinceE +	
			CASE			
				WHEN provinceC IS NULL THEN ''
				ELSE ' (' + provinceC + ')'				
			END 
		AS province

		, hsienCityE +
			CASE
				WHEN hsienCityC IS NULL THEN ''
				ELSE ' (' + hsienCityC + ')'
			END
		AS hsienCity

		, hsiangTownE +
			CASE
				WHEN hsiangTownC IS NULL THEN ''
				ELSE ' (' + hsiangTownC + ')'
			END
		AS hsiangTown

		, NULLIF(provinceE, country) AS countryProvinceE
		, NULLIF(provinceC, countryC) AS countryProvinceC

		, parkE +
			CASE
				WHEN parkC IS NULL THEN ''
				ELSE ' (' + parkC + ')'
			END
		AS park
		
		, locality +
			CASE
				WHEN localityC IS NULL THEN ''
				ELSE ' (' + localityC + ')'
			END
		AS localityX

		, IsNull(CASE dbo.fxBlockGps(hast.SN) 
					WHEN 1 THEN NULL 
					ELSE  additionalDescE
				END 
				, '') +
			CASE
				WHEN additionalDesc IS NULL THEN ''
								
				ELSE CASE
						WHEN additionalDescE IS NULL THEN (CASE dbo.fxBlockGps(hast.SN) 
															WHEN 1 THEN NULL 
															ELSE  additionalDesc
														END )
						WHEN additionalDesc = ''  THEN ''
						ELSE' (' + 
							(CASE dbo.fxBlockGps(hast.SN) 
								WHEN 1 THEN NULL 
								ELSE  additionalDesc
							END ) 
						+ ')'
					END
			END
		AS additionalDescX


	, hast.veget
	, hast.topography
	, hast.habitat
	, hast.naturalnessID
	, hast.lightID
	, hast.humidityID
	, hast.abundanceID
	, hast.projectID
	, hast.note
	, hast.noteE
		
		/*
		, flower.flower
		, flower.flowerC
		, fruits.fruits
		, fruits.fruitsC
		*/

		, naturalness.naturalnessStatus
		, naturalness.naturalnessC
		, light.lightIntensity
		, light.lightC
		, humidity.humidity
 		, humidity.humidityC
		, abundance.abundance
		, abundance.abundanceC
		, projectName.projectName

		/*
		, verO.familyID AS verOFamilyID
		, verO.genusID AS verOGesnuID
		, verO.speciesID AS verOSpeciesID
		, verOFamily.familyE AS verOFamilyE
		, verOFamily.familyC AS verOFamilyC
		, verOGenus.genusE AS verOGenusE
		, verOGenus.genusC AS verOGenusC
		, verOSpecies.speciesE AS verOSpeciesE
		, verOSpecies.speciesC AS verOSpeciesC
		, verifierO. nameFLC2 AS verifierOName
		, verO.verificationDate AS verODate
		, verO.unformedVdate AS verOUnformedDate

		, ver.familyID AS verFamilyID
		, ver.genusID AS verGesnuID
		, ver.speciesID AS verSpeciesID
		, verFamily.familyE AS verFamilyE
		, verFamily.familyC AS verFamilyC
		, verGenus.genusE AS verGenusE
		, verGenus.genusC AS verGenusC
		, verSpecies.speciesE AS verSpeciesE
		, verSpecies.speciesC AS verSpeciesC
		, ver.verificationNo AS verificationNo
		, verifier.nameFLC2 AS verifierName
		, ver.verificationDate AS verDate
		, ver.unformedVdate AS verUnformedDate
		*/
			

		, trophicData.trophicID
		, trophic.trophic
		, trophic.trophicC
		, trophicData.hostFamilyID
		, trophicData.hostGenusID
		, trophicData.hostSpeciesID
		, hostFamily.familyE AS hostFamilyE
		, hostFamily.familyC AS hostFamilyC
		, hostGenus.genusE AS hostGenusE
		, hostGenus.genusC AS hostGenusC
		, hostSpecies.speciesE AS hostSpeciesE
		, hostSpecies.SpeciesC AS hostSpeciesC		

FROM

	hast

	/* 
	LEFT JOIN duplications ON hast.SN = duplications.SN
	LEFT JOIN specimens ON duplications.dupID = specimens.dupID
	*/


	LEFT JOIN vwPersonName AS collector ON hast.collectorID =collector.pid
	LEFT JOIN country ON hast.countryNo = country.countryNo
	LEFT JOIN province ON hast.provinceNo = province.provinceNo
	LEFT JOIN hsienCity ON hast.hsienNo = hsienCity.hsienNo
	LEFT JOIN hsiangTown ON hast.townNo = hsiangTown.townNo
	LEFT JOIN nationalPark ON hast.parkNo = nationalPark.parkNo
	LEFT JOIN locality ON hast.localityID = locality.localityID

	/*
	LEFT JOIN flower ON duplications.flowerID = flower.flowerID
	LEFT JOIN fruits ON duplications.fruitsID = fruits.fruitsID
	*/

	LEFT JOIN naturalness ON hast.naturalnessID = naturalness.naturalnessID
	LEFT JOIN light ON hast.lightID = light.lightID
	LEFT JOIN humidity ON hast.humidityID = humidity.humidityID
	LEFT JOIN abundance ON hast.abundanceID = abundance.abundanceID
	LEFT JOIN projectName ON hast.projectID = projectName.projectID

	/*
	LEFT JOIN vwVerificationOriginal AS verO ON hast.SN = verO.SN
		LEFT JOIN family AS verOFamily ON verO.familyID = verOFamily.familyID
		LEFT JOIN genus AS verOGenus ON verO.genusID = verOGenus.genusID
		LEFT JOIN species AS verOSpecies ON verO.speciesID = verOSpecies.speciesID
		LEFT JOIN vwPersonName AS verifierO ON verO.verifierID  = verifierO.pid
	LEFT JOIN vwVerification AS ver ON hast.SN = ver.SN
		LEFT JOIN family AS verFamily ON ver.familyID = verFamily.familyID
		LEFT JOIN genus AS verGenus ON ver.genusID = verGenus.genusID
		LEFT JOIN species AS verSpecies ON ver.speciesID = verSpecies.speciesID
		LEFT JOIN vwPersonName AS verifier ON ver.verifierID  = verifier.pid
	*/

	LEFT JOIN trophicData ON hast.SN = trophicData.SN
		LEFT JOIN trophic ON trophicData.trophicID = trophic.trophicID
		LEFT JOIN family AS hostFamily ON trophicData.hostFamilyID = hostFamily.familyID
		LEFT JOIN genus AS hostGenus ON trophicData.hostGenusID = hostGenus.genusID
		LEFT JOIN species AS hostSpecies ON trophicData.hostSpeciesID = hostSpecies.speciesID

	/*
	LEFT JOIN exchangeTo ON duplications.exchangeID = exchangeTo.exchangeID
	*/
GO
