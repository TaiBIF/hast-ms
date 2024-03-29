USE [HASTDB]
GO
/****** Object:  View [dbo].[vwSpeciesWeb]    Script Date: 03/12/2018 14:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwSpeciesWeb]
AS
SELECT 
	genusID
	, speciesID
	, speciesE
	, speciesC	
FROM
	species
WHERE
	speciesID IN
	(
	 SELECT DISTINCT
		speciesID
	FROM
		vwSpeciesLIST
	)
GO
