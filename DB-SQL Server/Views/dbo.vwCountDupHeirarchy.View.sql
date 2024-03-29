USE [HASTDB]
GO
/****** Object:  View [dbo].[vwCountDupHeirarchy]    Script Date: 03/12/2018 14:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwCountDupHeirarchy]

AS


WITH H AS 
(
SELECT	
	
			 ISNULL([class], 0) AS classID			
			, ISNULL(verFamilyID, 0) AS familyID
			, ISNULL(verGenusID, 0) AS genusID
			, ISNULL(verSpeciesID, 0) AS speciesID
			
				 
		FROM
	
			checkup AS c		
			LEFT JOIN vwHastDupVerificationLast AS h ON c.hastSN = h.SN
WHERE
	c.collectorID IS NOT NULL

) 

SELECT	
	GROUPING_ID(classID, familyID,genusID, speciesID) AS groupset
			,  classID			
			,  familyID
			,  genusID
			,  speciesID
			, COUNT(*) AS summary, 
			COUNT(DISTINCT familyID) AS sumFamily,
			COUNT(DISTINCT genusID) AS sumGenus, 
			COUNT(DISTINCT speciesID) AS sumSpecies	
				 
		FROM
	
			H

GROUP BY CUBE(classID, familyID, genusID, speciesID)
GO
