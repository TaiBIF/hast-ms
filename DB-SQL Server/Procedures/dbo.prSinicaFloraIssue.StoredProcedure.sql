USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prSinicaFloraIssue]    Script Date: 03/12/2018 15:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prSinicaFloraIssue]

AS

WITH C
AS (
SELECT
	sfi.listID
	, sfi.speciesID
	, sfi.issuedMonth
--	, wholePlant	
	, imageCode
	, CASE
		WHEN wholePlant = 1 THEN 4
		WHEN flower = 1 THEN 5
		WHEN fruit = 1 THEN 2
		WHEN leaf = 1 THEN 1
		WHEN seed = 1 THEN 0
		WHEN stem = 1 THEN -1
		WHEN [root] = 1 THEN -2
		WHEN sorus = 1 THEN 3
		ELSE 3 
	END AS rating
		
	
	
FROM
	sinicaFloraIssue AS sfi 
	INNER JOIN areaCollection AS ac ON sfi.listID = ac.listID
	INNER JOIN images AS i ON ac.SN = i.SN
WHERE
	issuedMonth = DATEPART(month, GETDATE())
	AND imgAuthorID <> 90
)


SELECT
	C.imageCode
	, c.listID
	, c.speciesID
	, speciesC
	, speciesE
	--,  distributionC
	--, locationC
	, CharacteristicC
	, LEFT(CharacteristicC,80) + (CASE 
							WHEN LEN(noteC) > 80 THEN '...'
							ELSE ''
						END )
		AS noteAbstractC
FROM
	C 
	INNER JOIN (	
		SELECT TOP 100 PERCENT
			listID
			, imageCode
			, speciesID
			, issuedMonth
			, rating
			, ROW_NUMBER() OVER(
			PARTITION BY speciesID ORDER BY rating DESC)
			AS sequence
		FROM C 

		ORDER BY speciesID, rating DESC
		) AS tempRating ON C.imageCode = tempRating.imageCode
		
	INNER JOIN vwSinicaFlora AS sf ON c.listID = sf.listID


WHERE tempRating.sequence = 1
GO
