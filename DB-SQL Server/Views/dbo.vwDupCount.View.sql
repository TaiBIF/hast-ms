USE [HASTDB]
GO
/****** Object:  View [dbo].[vwDupCount]    Script Date: 03/12/2018 14:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwDupCount]

AS

SELECT	
		GROUPING_ID(d.classID, d.familyID, d.genusID, d.speciesID) AS groupset,
	    ISNULL(d.classID, 0) AS classID
		, ISNULL(d.familyID,0) AS familyID
		, ISNULL(d.genusID, 0) AS genusID
		, ISNULL(d.speciesID, 0) AS speciesID
		, COUNT(*) AS summary, 
			COUNT(DISTINCT d.familyID) AS sumFamily,
			COUNT(DISTINCT d.genusID) AS sumGenus, 
			COUNT(DISTINCT d.speciesID) AS sumSpecies	
		--, d.familyE
		--, d.familyC
		--, d.genusE
		--, d.genusC
		--, d.speciesE
		--, d.speciesC
		
		 
FROM

	vwDupAll AS d
	LEFT JOIN exchangeDetail ON d.CKSN = exchangeDetail.CKSN
 GROUP BY CUBE(classID, familyID, genusID, speciesID)
GO
