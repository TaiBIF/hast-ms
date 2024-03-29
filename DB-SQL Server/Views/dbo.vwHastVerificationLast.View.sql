USE [HASTDB]
GO
/****** Object:  View [dbo].[vwHastVerificationLast]    Script Date: 03/12/2018 14:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwHastVerificationLast]

AS 

	/*
	包含最後一筆鑑訂資料的標籤詳細採集資料
	不含複份資料
	*/
SELECT	
	
	vwHast.SN
	, creationOperator
	, vwHast.creationDate
	, vwHast.updateDate
	, dataReviser

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
		, vwHast.nameC

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

			--, NULLIF(provinceE, country) AS countryProvinceE
			--, NULLIF(provinceC, countryC) AS countryProvinceC
			, countryProvinceE
			, countryProvinceC

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
			

FROM

	vwHast
	LEFT JOIN vwVerificationLast AS ver ON vwHast.SN = ver.SN
	LEFT JOIN family AS verFamily ON ver.familyID = verFamily.familyID
	LEFT JOIN genus AS verGenus ON ver.genusID = verGenus.genusID
	LEFT JOIN species AS verSpecies ON ver.speciesID = verSpecies.speciesID
	LEFT JOIN vwPersonName AS verifier ON ver.verifierID  = verifier.pid
GO
