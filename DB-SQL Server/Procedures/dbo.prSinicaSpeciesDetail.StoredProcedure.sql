USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prSinicaSpeciesDetail]    Script Date: 03/12/2018 15:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prSinicaSpeciesDetail]

	@listID INT = NULL

AS

SELECT DISTINCT
	l.listID
	, i.speciesID
	, i.speciesE
	, i.speciesC
	, characteristicC
	, distributionC
	, nLocalityC
	, remarkC
	, noteC
FROM
	vwSinicaFlora AS l
	INNER JOIN areaCollection AS c ON l.listID = c.listID
	INNER JOIN vwImageDetail AS i ON c.SN = i.SN 
WHERE
	l.listID = @listID


SELECT
	l.listID
	, i.speciesID
	, i.speciesE
	, i.speciesC
	, imageCode
	, characteristicC
	, WGS84Lng
	, WGS84Lat
	, distributionC
	, nLocalityC
	, remarkC
	, noteC
	, i.SN
FROM
	vwSinicaFlora AS l
	INNER JOIN areaCollection AS c ON l.listID = c.listID
	INNER JOIN vwImageDetail AS i ON c.SN = i.SN 
WHERE
	l.listID = @listID


--標本列表	
SELECT DISTINCT
	h.SN
	, specimenOrderNum
	, l.listID
	, speciesID
FROM
	vwSinicaFlora AS l
	INNER JOIN areaCollection AS c ON l.listID = c.listID
	INNER JOIN vwHastDupVerificationLast AS h ON c.SN = h.SN 
WHERE
	l.listID = @listID
GO
