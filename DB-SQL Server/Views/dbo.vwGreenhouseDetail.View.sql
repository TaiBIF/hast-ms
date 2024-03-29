USE [HASTDB]
GO
/****** Object:  View [dbo].[vwGreenhouseDetail]    Script Date: 03/12/2018 14:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwGreenhouseDetail]

AS
	
	/*溫室盆栽詳細料*/	

SELECT

	g.potID
	, g.removeID
	, g.note
	, g.採集號
	, g.hastSNA
	, g.collectorID_A
	, g.collectNumA1
	, g.collectNumA2

	, r.removed
	
	--, ha.CNum AS CNumA
	, ha.nameLF	AS collectorA
	, ha.collectNum1 AS collectNum1A
	, ha.collectNum2 AS collectNum2A
	, RTRIM(
		LTRIM(ISNULL(ha.nameLF + ' ', ''))
		+ LTRIM(ISNULL(CAST(ha.collectNum1 AS NVARCHAR) + ' ', '')) 
		+ ISNULL(ha.collectNum2, '') 
		) AS collectionNumA	
	, ha.collectionDate AS CDateA

	, g.hastSNB
	, g.collectorID_B
	, g.collectNumB1
	, g.collectNumB2
	--, hb.CNum AS CNumB
	
	, hb.nameLF	AS collectorB
	, hb.collectNum1 AS collectNum1B
	, hb.collectNum2 AS collectNum2B
	, RTRIM(
		LTRIM(ISNULL(hb.nameLF + ' ', ''))
		+ LTRIM(ISNULL(CAST(hb.collectNum1 AS NVARCHAR) + ' ', '')) 
		+ ISNULL(hb.collectNum2, '') 
		) AS collectionNumB
	, hb.collectionDate AS CDateB

	, g.areaID
	, g.DNAexp
	, g.chromosome
	, g.country
	, g.source
	, g.originalData
		
	, a.greenhouseArea

	, ha.verFamilyID AS verFamilyIDA
	, ha.verGenusID AS verGenusIDA
	, ha.verSpeciesID AS verSpeciesIDA
	, ha.verFamilyE AS verFamilyEA
	, ha.verFamilyC AS verFamilyCA
	, ha.verGenusE AS verGenusEA
	, ha.verGenusC AS verGenusCA
	, ha.verSpeciesE AS verSpeciesEA
	, ha.verSpeciesC AS verSpeciesCA
	, ha.country AS countryA
	, ha.provinceE AS provinceEA
	, ha.provinceC AS provinceCA
	, ha.hsienCityE AS hsienCityEA
	, ha.hsienCityC AS hsienCityCA
	, ha.hsiangTownE AS hsiangTownEA
	, ha.hsiangTownC AS hsiangTownCA
	, ha.parkE AS parkEA
	, ha.parkC AS parkCA
	, ha.additionalDesc AS additionalDescA

	, hb.verFamilyID AS verFamilyIDB
	, hb.verGenusID AS verGenusIDB
	, hb.verSpeciesID AS verSpeciesIDB
	, hb.verFamilyE AS verFamilyEB
	, hb.verFamilyC AS verFamilyCB
	, hb.verGenusE AS verGenusEB
	, hb.verGenusC AS verGenusCB
	, hb.verSpeciesE AS verSpeciesEB
	, hb.verSpeciesC AS verSpeciesCB
	, hb.country AS countryB
	, hb.provinceE AS provinceEB
	, hb.provinceC AS provinceCB
	, hb.hsienCityE AS hsienCityEB
	, hb.hsienCityC AS hsienCityCB
	, hb.hsiangTownE AS hsiangTownEB
	, hb.hsiangTownC AS hsiangTownCB
	, hb.parkE AS parkEB
	, hb.parkC AS parkCB
	, hb.additionalDesc AS additionalDescB
	

FROM

	greenhouse AS g 

	LEFT JOIN vwHastVerificationLast AS ha ON g.hastSNA = ha.sn
	LEFT JOIN vwHastVerificationLast AS hb ON g.hastSNB = hb.sn
	LEFT JOIN greenhouseArea AS a ON g.areaID = a.areaID
	LEFT JOIN removed AS r ON g.removeID = r.removeID
GO
