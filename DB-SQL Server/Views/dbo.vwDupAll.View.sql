USE [HASTDB]
GO
/****** Object:  View [dbo].[vwDupAll]    Script Date: 03/12/2018 14:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwDupAll]

AS

	/* 所有複份標本，含交換出的 */	

SELECT 
			c.CKSN
			, c.blnBored
			, c.blnDestroyed
			, c.blnNoFlwFruit
			, c.storedSiteID
			, c.voidDate
			, c.note AS cNote
			, storedSite.storedSite
			, h.SN
			, h.specimenOrderNum
/*
			, h.collectorID AS hCollectorID
			, h.collectNum1 AS hCollectNum1
			, h.collectNum2 AS hCollectNum2
			, vwPh.nameFLC1 AS hCollector
*/			
			, c.collectorID AS cCollectorID
			, c.collectNum1 AS cCollectNum1
			, c.collectNum2 AS cCollectNum2
			, vwPc.nameFLC1 AS cCollector
			, vwPc.nameLFC1 AS cCollector2

			, classID			
			, verFamilyID AS familyID
			, verGenusID AS genusID
			, verSpeciesID AS speciesID
			
			, verFamilyE AS familyE
			, verFamilyC AS familyC
			, verGenusE AS genusE
			, verGenusE AS genusC
			, verSpeciesE AS speciesE
			, verSpeciesC AS speciesC

			/*	
			,(
			LTRIM(ISNULL(nation.nation, '') + ' ')
						
			+ LTRIM(ISNULL(province.provinceE, '') + ' ' )
			+ LTRIM(ISNULL(province.provinceC, '') + ' ')
								

			+ LTRIM(ISNULL(hsienCity.hsienCityE, '') + ' ')
			+ LTRIM(ISNULL(hsienCity.hsienCityC, '') + ' ')

			+ LTRIM(ISNULL(hsiangTown.hsiangTownE, '') + ' ')
			+ LTRIM(ISNULL(hsiangTown.hsiangTownC, '') + ' ')
			
			+ LTRIM(ISNULL(np.parkE, '') + ' ')
			+ LTRIM(ISNULL(np.parkC, '') + ' ')

			+  ISNULL(h.additionalDesc, '')
			*/
			, (
			LTRIM(ISNULL(country, '') + ' ')
						
			+ LTRIM(ISNULL(province, '') + ' ' )
			--+ LTRIM(ISNULL(province.provinceC, '') + ' ')
								

			+ LTRIM(ISNULL(hsienCity, '') + ' ')
			--+ LTRIM(ISNULL(hsienCity.hsienCityC, '') + ' ')

			+ LTRIM(ISNULL(hsiangTown, '') + ' ')
			--+ LTRIM(ISNULL(hsiangTown.hsiangTownC, '') + ' ')
			
			--+ LTRIM(ISNULL(np.parkE, '') + ' ')
			+ LTRIM(ISNULL(park, '') + ' ')

			+  ISNULL(h.additionalDesc, '')


			) AS loca
						
				 
		FROM
		
			checkup AS c
			LEFT JOIN vwPersonName AS vwPc ON c.collectorID = vwPc.pid
			LEFT JOIN storedSite ON c.storedSiteID = storedSite.siteID

			, vwHastDupVerificationLast AS h
			/*
			, hast_m AS h 
			LEFT JOIN family AS f ON h.familyID = f.familyID
			RIGHT JOIN classX ON f.class = classX.classID
			LEFT JOIN  genus AS g ON h.genusID = g.genusID
			LEFT JOIN species AS s ON h.speciesID = s.speciesID
			--LEFT JOIN vwPersonName AS vwPh ON h.collectorID = vwPh.pid
			LEFT JOIN nation ON h.nationNo = nation.nationNo
			LEFT JOIN province ON h.provinceNo = province.provinceNo
			LEFT JOIN hsienCity ON h.hsienNo = hsienCity.hsienNo
			LEFT JOIN hsiangTown ON h.townNo = hsiangTown.townNo
			LEFT JOIN nationalPark AS np ON h.parkNo = np.parkNo
			*/
		
		WHERE	
		
			c.hastSN= h.SN
GO
