USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prImageDynaQuery]    Script Date: 03/12/2018 15:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prImageDynaQuery]
	/*
		檢查影像資料查結果是否多於一個綱class
		動態查詢影像
		含複份及鑑訂資料至相同欄位
		網頁使用
		
	*/

	@scientificName NVARCHAR(128) = NULL
	--, @collectorID INT = NULL
	--, @collectionNum INT = NULL
	--	,@collectionNumEnd INT = NULL
	, @photoDate DATETIME = NULL
	, @photoDateEnd DATETIME = NULL
	, @collectionMonth INT = NULL	--採集月份
	
	--, @specimenOrderNum INT = NULL
	--	, @specimenOrderNumEnd INT = NULL
	, @familyID INT = NULL
	, @genusID INT = NULL
	, @speciesID INT =NULL
	
	, @countryNo INT = NULL
	, @provinceNo INT = NULL
	, @hsienNo INT = NULL
	, @townNo INT = NULL
	, @parkNo INT =NULL

	, @location NVARCHAR(20) = NULL
	--, @altCompare INT = 0   --處理海拔高度的比較 "=":0 , ">=":1, "<=":2, "Between":3 
	--, @alt INT = NULL
	--, @altx INT = NULL
	, @authorID INT = NULL
	, @publicWeb BIT = 1   --控制瀏灠範圍，直接在網頁程式中設定參數

	, @checkFamilyCount BIT = 0 --是否檢查結果集共分多少科 預設值為非檢查

	,@debug int = 0

AS

	SET NOCOUNT ON

DECLARE

	@intErrorCode int
	, @charQuery NVARCHAR(4000)
	, @charWhere NVARCHAR(4000)
	
	--, @charClass NVARCHAR(1000)
    , @charFamilyCount NVARCHAR(1000)
	--, @charGenus NVARCHAR(1000)
	--, @charSpecies NVARCHAR(1000)
	--, @charSpeciesCount NVARCHAR(1000)
	, @charHierarchy NVARCHAR(4000)
	
	
	IF 
			@scientificName IS NULL
		-- AND @collectorID IS NULL
		-- AND @collectionNum IS NULL
		-- AND	@collectionNumEnd IS NULL
		-- AND @collectionDate IS NULL
		-- AND @collectionDateEnd IS NULL
		AND @photoDate IS NULL
		AND @photoDateEnd IS NULL		
		AND @collectionMonth IS NULL   --拍攝月份
		-- AND @specimenOrderNum IS NULL
		-- AND	@specimenOrderNumEnd IS NULL
		AND @familyID IS NULL
		AND @genusID IS NULL
		AND @speciesID IS NULL	
		AND @countryNo IS NULL
		AND @provinceNo IS NULL
		AND @hsienNo IS NULL
		AND @townNo IS NULL
		AND @parkNo IS NULL
		-- AND (@location IS NULL OR @location = '台灣' or @location = '台灣')
		AND @location IS NULL
		-- AND @alt IS NULL
		-- AND @altx IS NULL
		AND @authorID IS NULL

		BEGIN
			SELECT 
				@intErrorCode = @@Error
				
				, @charQuery = 'SELECT  ' 
						+ ' SN, imageCode, ' 
						+ ' collectorID, collectNum1, collectNum2, collectionDate, '
						+ ' collectorName, nameC, collectionFLNo, collectionLFNo, collectionFLCNo, '
						+ ' countryNo, provinceNo, hsienNo, townNo, localityID, parkNo, '
						+ ' WGS84Lng, + WGS84Lat, alt, altx, elevation, '
						+ ' country,countryC,districtE, districtC, '
						+ ' localityDescE, localityDescC, location, '
						+ ' classID, familyID, genusID, speciesID, '
						+ ' classE, classC, familyE, familyC, genusE, genusC, speciesE, speciesC, '
						+ ' verFullTaxonName, verificationNo, verifierName, verifierNameFL ' --GPSInfo, '
						+ ' imgAuthorID, authorC, authorLF, authorLFC1, photoDate, publicWeb '
						+ ' FROM vwImageDetail '						
						+ ' WHERE 1<>1 '
									
				, @charHierarchy = 
					+ ' SELECT GROUPING_ID(classID, familyID, genusID, speciesID) AS groupset, '
					+ '	classID,  familyID, genusID,  speciesID, ' 
					+ '	MAX(imageCode)AS imageCode, COUNT(*) AS summary, '
					+ '	COUNT(DISTINCT familyID) AS sumFamily, '
					+ '	COUNT(DISTINCT genusID) AS sumGenus, '
					+ '	COUNT(DISTINCT speciesID) AS sumSpecies	'
					+ '	FROM vwImageDetail '																			
					+ ' WHERE 1<>1 '
					+ ' GROUP BY CUBE(classID, familyID, genusID, speciesID)'
								
		END
	
	ELSE
		/*
		IF @scientificName LIKE '%[-]%'

			BEGIN		
				RETURN;
			END

		ELSE 
		*/
		SELECT 
				@intErrorCode = @@Error
				, @charQuery = 'SELECT  ' 
						+ ' SN, imageCode, ' 
						+ ' collectorID, collectNum1, collectNum2, collectionDate, '
						+ ' collectorName, nameC, collectionFLNo, collectionLFNo, collectionFLCNo, '
						+ ' countryNo, provinceNo, hsienNo, townNo, localityID, parkNo, '
						+ ' WGS84Lng, + WGS84Lat, alt, altx, elevation, '
						+ ' country,countryC,districtE, districtC, '
						+ ' localityDescE, localityDescC, location, '						 
						+ ' classID, familyID, genusID, speciesID, '
						+ ' classE, classC, familyE, familyC, genusE, genusC, speciesE, speciesC, '
						+ ' verFullTaxonName, verificationNo, verifierName, verifierNameFL ' --GPSInfo, '
						+ ' imgAuthorID, authorC, authorLF, authorLFC1, photoDate, publicWeb '
						+ ' FROM vwImageDetail '						
		
				, @charWhere = ''

				-- 找出結果集中的taxon
				/*
				, @charClass = 'SELECT classID, classE, classC, '
								+ ' COUNT(*) AS summary FROM vwImageDetail '

				, @charSpeciesCount = ' SELECT c.familyID, c.familyE, c.familyC, COUNT(*) AS summary '
									+ ' FROM ( SELECT DISTINCT familyID, familyE, familyC, SpeciesID FROM vwImageDetail '		
				*/
									
				, @charHierarchy = 
					+ ' SELECT GROUPING_ID(classID, familyID, genusID, speciesID) AS groupset, '
					+ '	classID,  familyID, genusID,  speciesID, ' 
					+ '	MAX(imageCode)AS imageCode, COUNT(*) AS summary, '
					+ '	COUNT(DISTINCT familyID) AS sumFamily, '
					+ '	COUNT(DISTINCT genusID) AS sumGenus, '
					+ '	COUNT(DISTINCT speciesID) AS sumSpecies	'
					+ '	FROM vwImageDetail '	
	
	IF @intErrorCode = 0 AND @scientificName IS NOT NULL
		BEGIN
			SET @charWhere =  @charWhere + N' AND verFullTaxonName LIKE ' +  QUOTENAME('%' + @scientificName + '%', '''') 
		SELECT @intErrorCode = @@Error
	END	

	IF @intErrorCode = 0 AND @authorID IS NOT NULL
		BEGIN
			SET @charWhere =  @charWhere + N' AND imgAuthorID = ' + CAST(@authorID AS CHAR)
		SELECT @intErrorCode = @@Error
	END	

	IF @intErrorCode = 0 AND @photoDate IS NOT NULL
		BEGIN
			--SET @charWhere =  @charWhere + N' AND collectionDate = ' + QUOTENAME(CAST(@collectionDate AS CHAR), '''')
			IF @intErrorCode = 0 AND @photoDateEnd IS NOT NULL
				BEGIN
					SET @charWhere =  @charWhere + N' AND collectionDate BETWEEN ' 
									+ QUOTENAME(CAST(@photoDate AS CHAR), '''') + N' AND '
									+ QUOTENAME(CAST(@photoDateEnd AS CHAR), '''')
					SELECT @intErrorCode = @@Error
				END
			ELSE
				SET @charWhere =  @charWhere + N' AND collectionDate = ' + QUOTENAME(CAST(@photoDate AS CHAR), '''')
				
		SELECT @intErrorCode = @@Error
	END

	IF @intErrorCode = 0 AND @collectionMonth IS NOT NULL
		BEGIN
			SET @charWhere = @charWhere + N' AND DATEPART(mm, photoDate) = ' 
							+ CAST(@collectionMonth AS CHAR)
			SELECT @intErrorCode = @@Error
		END
	
	IF @intErrorCode = 0 AND @familyID IS NOT NULL
		BEGIN
			SET @charWhere =  @charWhere + N' AND familyID = ' + CAST(@familyID AS CHAR)  
		SELECT @intErrorCode = @@Error
	END	

	IF @intErrorCode = 0 AND @genusID IS NOT NULL
		BEGIN
			SET @charWhere =  @charWhere + N' AND genusID = ' + CAST(@genusID AS CHAR)
		SELECT @intErrorCode = @@Error
	END	

	IF @intErrorCode = 0 AND @speciesID IS NOT NULL
		BEGIN
			SET @charWhere =  @charWhere + N' AND speciesID = ' + CAST(@speciesID AS CHAR)
	 		SELECT @intErrorCode = @@Error
	END	

	IF @intErrorCode = 0 AND @countryNo IS NOT NULL
		BEGIN
			SET @charWhere =  @charWhere + N' AND countryNo = ' + CAST(@countryNo AS CHAR)
		SELECT @intErrorCode = @@Error
	END	

	IF @intErrorCode = 0 AND @provinceNo IS NOT NULL
		BEGIN
			SET @charWhere =  @charWhere + N' AND provinceNo = ' + CAST(@provinceNo AS CHAR)
		SELECT @intErrorCode = @@Error
	END	

	IF @intErrorCode = 0 AND @hsienNo IS NOT NULL
		BEGIN
			SET @charWhere =  @charWhere + N' AND hsienNo = ' + CAST(@hsienNo AS CHAR)
		SELECT @intErrorCode = @@Error
	END	

	IF @intErrorCode = 0 AND @townNo IS NOT NULL
		BEGIN
			SET @charWhere =  @charWhere + N' AND townNo = ' + CAST(@townNo AS CHAR)
		SELECT @intErrorCode = @@Error
	END	

	IF @intErrorCode = 0 AND @parkNo IS NOT NULL
		BEGIN
			SET @charWhere =  @charWhere + N' AND parkNo = ' + CAST(@parkNo AS CHAR)
		SELECT @intErrorCode = @@Error
	END	

	IF @intErrorCode = 0 AND @location IS NOT NULL
		BEGIN
			SET @charWhere =  @charWhere + N' AND location LIKE ' + QUOTENAME('%' + @location + '%', '''')
		SELECT @intErrorCode = @@Error
	END

	IF @intErrorCode = 0 AND @publicWeb = 1  
		BEGIN
			SET @charWhere =  @charWhere + N' AND publicWeb = ' + CAST(@publicWeb AS CHAR)
		SELECT @intErrorCode = @@Error
	END	

IF @debug <> 0 SELECT @charWhere charWhere

IF @intErrorCode = 0 AND LEN(@charWhere)> 0
		BEGIN
			SET @charQuery = @charQuery + ' WHERE speciesID IS NOT NULL ' + @charWhere

			IF @checkFamilyCount = 1
				BEGIN		
					SET @charFamilyCount =  'SELECT count(DISTINCT familyID) FROM vwImageDetail '
						 + ' WHERE speciesID IS NOT NULL ' + @charWhere		
				END
ELSE
	BEGIN	
		/*
		SET @charClass = @charClass + ' WHERE speciesID IS NOT NULL ' + @charWhere
		+ ' GROUP BY classID , classE, classC ORDER BY classID '		
		*/		
		
		SET @charHierarchy += ' WHERE speciesID IS NOT NULL ' 
							+ @charWhere 								
							+ ' GROUP BY CUBE(classID, familyID, genusID, speciesID)'
	
		SET @charHierarchy = ' WITH H AS ( '
							+ @charHierarchy
							+ ' ) '								
							+ ' SELECT '
							+ ' ROW_NUMBER() OVER(ORDER BY groupset) AS rownum, '
							+ ' groupset, H.classID, C.classE, C.classC, '
							+ ' H.familyID, F.familyE, F.familyC, '
							+ ' H.genusID, G.genusE, G.genusC, '
							+ ' H.speciesID, S.speciesE, S.speciesC, '
							+ ' imageCode, '
							+ ' summary, sumFamily, sumGenus, sumSpecies '								
							+ ' FROM H '
							+ ' LEFT JOIN species AS S ON H.speciesID = S.speciesID '
        					+ ' LEFT JOIN family AS F ON H.familyID = F.familyID '
							+ ' LEFT JOIN genus AS G ON H.genusID = G.genusID '
							+ ' LEFT JOIN [class] AS C ON H.classID = C.classID '																								
							+ ' WHERE (groupset = 0 OR groupset = 1 OR groupset = 3 OR groupset = 7)'
							+ ' AND H.classID IS NOT NULL '
							+ ' ORDER BY groupset'
		END
	
	SELECT @intErrorCode = @@Error 
END


IF @debug <> 0 SELECT @charQuery Query

IF @intErrorCode = 0
	BEGIN
		IF @checkFamilyCount = 1
			BEGIN		
				EXEC (@charFamilyCount)				
			END
		ELSE
		
			BEGIN
				
				--SELECT @charQuery
				
				EXEC (@charQuery)

				EXEC (@charHierarchy)
			END
		
		SELECT @intErrorCode = @@Error
	END


RETURN @intErrorCode
GO
