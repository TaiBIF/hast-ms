USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prSinicaFloraImageMap]    Script Date: 03/12/2018 15:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prSinicaFloraImageMap]

	@theme INT = NULL
	, @classID INT = NULL
	

AS


--影像查詢

SET NOCOUNT ON

DECLARE @daysOfYear TABLE (days INT)

DECLARE @i SMALLINT
DECLARE @n NVARCHAR(300)

SET @i = -10
SET @n = ''

WHILE @i <= 10
	BEGIN
		INSERT @daysOfyear
		SELECT DATEPART(dayofyear,DATEADD(day, @i, GETDATE())) 
			
		SET @i = @i +1
		
	END



-- 條件
DECLARE @charTheme VARCHAR(100)
DECLARE @charQuery VARCHAR(2000)


SELECT @charTheme = CASE @theme
	WHEN 1 THEN ' AND (flower = 1 OR pistillateFlower = 1 OR staminateFlower = 1 ) '
	WHEN 2 THEN ' AND leaf = 1 '
	WHEN 3 THEN ' AND (fruit = 1 OR seed = 1 )'
	WHEN 4 THEN ' AND f.classID = ' + cast(@classID AS VARCHAR)  + ' '
	ELSE ' '
	END
	

SELECT @charQuery = 
					'SELECT  min(imageCode) AS imgCode,  f.classID, f.familyID, vwImageDetail.speciesID, f.speciesE, f.speciesC, C.listID ' + 
					--' authorC , publicWeb, vwImageDetail.SN , photoDate ' +
					' FROM ' +
					' vwSinicaFlora AS f ' +
					' INNER JOIN areaCollection AS C ON f.listID = C.listID ' + 
					' INNER JOIN vwImageDetail ON C.SN = vwImageDetail.SN ' +
					--' INNER JOIN areaCollection on vwImageDetail.SN = areaCollection.SN ' +
				
					--' INNER JOIN areaSpeciesList ON areaSpeciesList.listID = areaCollection.listID ' +	
					--' INNER JOIN vwSinicaFlora AS f on vwImageDetail.SN = .SN ' +
					' WHERE ' +
					--speciesID = @speciesID
					--areaCollection.listID = @lID
					--' areaID =2 ' +
					' publicWeb = 1 ' 
					--AND WGS84Lng IS NOT NULL
	
	
SELECT @charQuery = @charQuery + @charTheme	+ ' GROUP BY f.classID, f.familyID, vwImageDetail.speciesID, f.speciesE, f.speciesC, C.listID '

--SELECT  (@charQuery)
	
EXEC (@charQuery)
GO
