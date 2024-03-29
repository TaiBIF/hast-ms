USE [HASTDB]
GO
/****** Object:  View [dbo].[vwTypeDetail]    Script Date: 03/12/2018 14:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  VIEW [dbo].[vwTypeDetail]

AS

	/*
	模式標本的詳細資料
	含所有的鑑訂資料
	*/

SELECT
	t.id
	, t.specimenOrderNum AS typeSpecimenOrderNum
	, t.typeCateID
		, tc.typeCateGory
	, t.inStorage
	, t.isArchived
	, t.dgImage
	, t.note AS typeNote
	, t.reference
	, t.literaryLink
	, t.editDate
	, t.storageADD
	, t.onWebSite
	, t.webVerificationNo 

	, h.SN
	, h.creationOperator
	, h.creationDate
	, h.updateDate
	, h.dataReviser
		, h.specimenOrderNum
        , h.dupID
		, h.dupNo
		, h.greenhouse
		, h.preparationDate
		, h.statusID
		, h.lifeForm
		, h.plantH
		, h.flowerID
		, h.flowerColor
		, h.fruitsID
		, h.fruitColor
		, h.sexChar
		, h.addChar
		, h.addCharC

		, h.DNANo
		, h.nameComment
		, h.exchangeID
		, h.exchangeDept

		, h.exchangeTo

	, h.collectorID
	, h.collectNum1
	, h.collectNum2
	, h.collectionDate
	, h.recordTimeStamp
	, h.companion
	, h.companionE

		, h.nameLF
		, h.collectorName

	, h.countryNo
	, h.provinceNo
	, h.hsienNo
	, h.townNo
	, h.localityID
	, h.parkNo
	, h.additionalDesc
	, h.additionalDescE
	, h.WGS84Lng
	, h.WGS84Lat
	, h.alt
	, h.altx

		, h.country		
		, h.countryC
		, h.provinceE
		, h.provinceC
		, h.hsienCityE
		, h.hsienCityC
		, h.hsiangTownE
		, h.hsiangTownC
		, h.parkE
		, h.parkC
		, h.locality
		, h.localityC
		, h.province
		, h.hsienCity
		, h.hsiangTown
		, h.park
		, h.localityX
		, h.additionalDescX
		
	, h.veget
	, h.topography
	, h.habitat
	, h.naturalnessID
	, h.lightID
	, h.humidityID
	, h.abundanceID
	, h.projectID
	, h.note
	, h.noteE

		, h.flower
		, h.flowerC
		, h.fruits
		, h.fruitsC

		, h.naturalnessStatus
		, h.naturalnessC
		, h.lightIntensity
		, h.lightC
		, h.humidity
		, h.humidityC
		, h.abundance
		, h.abundanceC
		, h.projectName

		, h.trophicID
		, h.trophic
		, h.trophicC
		, h.hostFamilyID
		, h.hostGenusID
		, h.hostSpeciesID
		, h.hostFamilyE
		, h.hostFamilyC
		, h.hostGenusE
		, h.hostGenusC
		, h.hostSpeciesE
		, h.hostSpeciesC

		, h.VSN
		, h.verFamilyID
		, h.verGenusID
		, h.verSpeciesID
		, h.verFamilyE
		, h.verFamilyC
		, h.verGenusE
		, h.verGenusC
		, h.verSpeciesE
		, h.verSpeciesC
		, h.verificationNo 
		, h.verifierName
		, h.verDate
		, h.verUnformedDate	
FROM

	typeSpecimen AS t 	
	INNER JOIN vwHastDupVerification AS h ON t.specimenOrderNum = h.specimenOrderNum
	LEFT JOIN typeCategory AS tc ON t.typeCateID = tc.typeCateID
GO
