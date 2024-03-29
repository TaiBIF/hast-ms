USE [HASTDB]
GO
/****** Object:  View [dbo].[vwGenusList]    Script Date: 03/12/2018 14:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW  [dbo].[vwGenusList]
AS
SELECT 
	familyID
	, genusID
	, genusE
	, genusC	
	
FROM
	genus
WHERE
	genusID IN
	(
	 SELECT DISTINCT
		genusID
	FROM
		vwSpeciesLIST
	)
GO
