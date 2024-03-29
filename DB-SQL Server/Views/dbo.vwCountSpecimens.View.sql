USE [HASTDB]
GO
/****** Object:  View [dbo].[vwCountSpecimens]    Script Date: 03/12/2018 14:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwCountSpecimens]

AS

	/*
		groupset = 1 -- 每屬總數
		groupset = 3 -- 每科總數
	*/
SELECT GROUPING_ID(verFamilyID, verGenusID
--, verSpeciesID
, specimenOrderNum)AS groupset
	
	, verFamilyID
	--, verFamilyE
	--, verFamilyC
	, verGenusID
	--, verGenusE
	--, VerGenusC
	--, verSpeciesID	
	, COUNT(DISTINCT verFamilyID) AS sumFamily
	, COUNT(DISTINCT verGenusID) AS sumGenus
	--, COUNT(DISTINCT verSpeciesID) AS sumSpecies
	, COUNT(DISTINCT specimenOrderNum) AS sheet	
	
FROM
	vwHastDupVerificationLast
WHERE
	specimenOrderNum IS NOT NULL
	
GROUP BY CUBE(verFamilyID, verGenusID
--, verSpeciesID
, specimenOrderNum)
GO
