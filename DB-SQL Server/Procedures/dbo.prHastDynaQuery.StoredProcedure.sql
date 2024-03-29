USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prHastDynaQuery]    Script Date: 03/12/2018 15:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prHastDynaQuery]

	/*
		動態查詢
		含複份及鑑訂資料至相同欄位
		網頁使用
		
	*/

	@scientificName NVARCHAR(128) = NULL	
	, @collectorID INT = NULL
	, @collectionNum INT = NULL
		,@collectionNumEnd INT = NULL
	, @collectionDate DATETIME = NULL
		, @collectionDateEnd DATETIME = NULL
	, @collectionMonth INT = NULL	--採集月份
	
	, @specimenOrderNum INT = NULL
		, @specimenOrderNumEnd INT = NULL
	, @SN INT = NULL
	, @familyID INT = NULL
	, @genusID INT = NULL
	, @speciesID INT =NULL
	
	, @countryNo INT = NULL
	, @provinceNo INT = NULL
	, @hsienNo INT = NULL
	, @townNo INT = NULL
	, @parkNo INT =NULL

	, @location NVARCHAR(20) = NULL
	, @altCompare INT = 0   --處理海拔高度的比較 "=":0 , ">=":1, "<=":2, "Between":3 
	, @alt INT = NULL
	, @altx INT = NULL

	,@debug int = 0

AS

	SET NOCOUNT ON

DECLARE

	@intErrorCode int
	, @charQuery NVARCHAR(4000)
	, @charWhere NVARCHAR(4000)
	, @charHast NVARCHAR(30)	--來源資料表
	
	IF 
			@scientificName IS NULL
		AND @collectorID IS NULL
		AND @collectionNum IS NULL
		AND	@collectionNumEnd IS NULL
		AND @collectionDate IS NULL
		AND @collectionDateEnd IS NULL		
		AND @collectionMonth IS NULL
		AND @specimenOrderNum IS NULL
		AND	@specimenOrderNumEnd IS NULL
		AND @SN IS NULL
		AND @familyID IS NULL
		AND @genusID IS NULL
		AND @speciesID IS NULL	
		AND @countryNo IS NULL
		AND @provinceNo IS NULL
		AND @hsienNo IS NULL
		AND @townNo IS NULL
		AND @parkNo IS NULL
		AND (@location IS NULL OR @location = '台灣' or @location = '台灣')
		AND @alt IS NULL
		AND @altx IS NULL
		BEGIN
			SELECT 
				@intErrorCode = @@Error
				
				, @charQuery = 'SELECT TOP 3000 ' 
						+ 'SN, dupID, vwHastDupVerificationWeb.specimenOrderNum, listID, ' 
						+ 'sf.specimenOrderNum AS imageFile, '
						+ 'collectorID, collectNum1, collectNum2, collectionDate, '
						+ 'collectorName, nameC, collectionFLNo, collectionLFNo, collectionFLCNo, '
						+ 'countryNo, provinceNo, hsienNo, townNo, localityID, parkNo, '
						+ 'WGS84Lng, + WGS84Lat, alt, altx, elevation, '
						+ 'country ,countryC,districtE, districtC, localityDescE, localityDescC, location, '
						+ 'verfamilyID, verGenusID, verSpeciesID, '
						+ 'verFamilyE, verFamilyC, verGenusE, verGenusC, verSpeciesE, verSpeciesC, '
						+ 'verFullTaxonName, verificationNo, verifierName, verifierNameFL ' 
						-- GPSInfo '
						+ 'FROM vwHastDupVerificationWeb '
						+ 'LEFT JOIN specImgFile AS sf ON vwHastDupVerificationWeb.specimenOrderNum '
						+ ' = sf.specimenOrderNum '
						+ 'WHERE 1<>1 '
				
				
		END
	
	ELSE
		/*
		IF @scientificName LIKE '%[-]%'
			BEGIN
					

				RETURN;
			END
	
		ELSE
		*/
		IF 
				@scientificName IS NULL		
				AND @familyID IS NULL
				AND @genusID IS NULL
				AND @speciesID IS NULL
				
				BEGIN
					SELECT
						@charHast = 'vwHastDupVerificationLast'			
					END			
				ELSE	
					SELECT
						@charHast = 'vwHastDupVerificationWeb'
						

			SELECT 
				@intErrorCode = @@Error
				, @charQuery = 'SELECT TOP 3000 ' 
						+ 'SN, dupID, HastSpecimens.specimenOrderNum, listID, ' 
						+ 'sf.specimenOrderNum AS imageFile, '
						+ 'collectorID, collectNum1, collectNum2, collectionDate, '
						+ 'collectorName, nameC, collectionFLNo, collectionLFNo, collectionFLCNo, '
						+ 'countryNo, provinceNo, hsienNo, townNo, localityID, parkNo, '
						+ 'WGS84Lng, + WGS84Lat, alt, altx, elevation, '
						+ 'country, countryC,districtE, districtC, localityDescE, localityDescC, location, '
						+ 'verfamilyID, verGenusID, verSpeciesID, '
						+ 'verFamilyE, verFamilyC, verGenusE, verGenusC, verSpeciesE, verSpeciesC, '
						+ 'verFullTaxonName, verificationNo, verifierName, verifierNameFL '
						-- GPSInfo 
						-- + 'FROM vwHastDupVerificationWeb '
						+ 'FROM '
						+ @charHast
						+ ' AS HastSpecimens '
						+ 'LEFT JOIN specImgFile AS sf ON HastSpecimens.specimenOrderNum '
						+ ' = sf.specimenOrderNum  '

		
				, @charWhere = ''
	
	
	IF @intErrorCode = 0 AND @scientificName IS NOT NULL
		BEGIN
			SET @charWhere =  @charWhere + N' AND verFullTaxonName LIKE ' +  QUOTENAME('%' + @scientificName + '%', '''') 
		SELECT @intErrorCode = @@Error
	END	

	IF @intErrorCode = 0 AND @collectorID IS NOT NULL
		BEGIN
			SET @charWhere =  @charWhere + N' AND collectorID = ' + CAST(@collectorID AS CHAR)
		SELECT @intErrorCode = @@Error
	END	

	IF @intErrorCode = 0 AND @collectionNum IS NOT NULL
		BEGIN
			--SET @charWhere =  @charWhere + N' AND collectNum1 = ' + @collectionNum 
			IF @intErrorCode = 0 AND @collectionNumEnd IS NOT NULL
				BEGIN 
					SET @charWhere = @charWhere + N' AND collectNum1 BETWEEN ' 
								+ CAST(@collectionNum AS CHAR) + N' AND ' 
								+ CAST(@collectionNumEnd AS	CHAR)
					SELECT @intErrorCode = @@Error
				END	
			ELSE
				SET @charWhere =  @charWhere + N' AND collectNum1 = ' + CAST(@collectionNum AS CHAR)	
			
		SELECT @intErrorCode = @@Error
	END	

	IF @intErrorCode = 0 AND @collectionDate IS NOT NULL
		BEGIN
			--SET @charWhere =  @charWhere + N' AND collectionDate = ' + QUOTENAME(CAST(@collectionDate AS CHAR), '''')
			IF @intErrorCode = 0 AND @collectionDateEnd IS NOT NULL
				BEGIN
					SET @charWhere =  @charWhere + N' AND collectionDate BETWEEN ' 
									+ QUOTENAME(CAST(@collectionDate AS CHAR), '''') + N' AND '
									+ QUOTENAME(CAST(@collectionDateEnd AS CHAR), '''')
					SELECT @intErrorCode = @@Error
				END
			ELSE
				SET @charWhere =  @charWhere + N' AND collectionDate = ' + QUOTENAME(CAST(@collectionDate AS CHAR), '''')
				
		SELECT @intErrorCode = @@Error
	END

	IF @intErrorCode = 0 AND @collectionMonth IS NOT NULL
		BEGIN
			SET @charWhere = @charWhere + N' AND DATEPART(mm, collectionDate) = ' 
							+ CAST(@collectionMonth AS CHAR)
			SELECT @intErrorCode = @@Error
		END
	
	IF @intErrorCode = 0 AND @specimenOrderNum IS NOT NULL
		BEGIN
			--SET @charWhere =  @charWhere + N' AND  HastSpecimens.specimenOrderNum = ' 
							--	+ CAST(@specimenOrderNum AS CHAR)
			IF @intErrorCode = 0 AND @specimenOrderNumend IS NOT NULL
				BEGIN
					SET @charWhere =  @charWhere 
									+ N' AND  HastSpecimens.specimenOrderNum BETWEEN ' 
									+ CAST(@specimenOrderNum AS CHAR) + N' AND '
									+ CAST(@specimenOrderNumEnd AS CHAR) 
					SELECT @intErrorCode = @@Error
				END
			ELSE
				SET @charWhere =  @charWhere + N' AND  HastSpecimens.specimenOrderNum = ' 
								+ CAST(@specimenOrderNum AS CHAR)

		SELECT @intErrorCode = @@Error
	END

	IF @intErrorCode = 0 AND @SN IS NOT NULL
		BEGIN
			SET @charWhere =  @charWhere + N' AND SN = ' + CAST(@SN AS CHAR)  
		SELECT @intErrorCode = @@Error
	END	

	IF @intErrorCode = 0 AND @familyID IS NOT NULL
		BEGIN
			SET @charWhere =  @charWhere + N' AND verFamilyID = ' + CAST(@familyID AS CHAR)  
		SELECT @intErrorCode = @@Error
	END	

	IF @intErrorCode = 0 AND @genusID IS NOT NULL
		BEGIN
			SET @charWhere =  @charWhere + N' AND verGenusID = ' + CAST(@genusID AS CHAR)
		SELECT @intErrorCode = @@Error
	END	

	IF @intErrorCode = 0 AND @speciesID IS NOT NULL
		BEGIN
			SET @charWhere =  @charWhere + N' AND verSpeciesID = ' + CAST(@speciesID AS CHAR)
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

    IF @intErrorCode = 0 AND @altx BETWEEN 0 AND 3
		BEGIN
			IF @intErrorCode = 0 AND @alt IS NOT NULL 
				BEGIN
					--SET @charWhere =  @charWhere + N' AND alt = ' + CAST(@alt AS CHAR)
					--IF @intErrorCode = 0 AND @altx IS NOT NULL
					--	SET @charWhere = @charWhere + N' AND ' + 
					IF @intErrorCode = 0 AND @altx IS NOT NULL   
						BEGIN 
							IF @intErrorCode = 0 AND @altCompare = 3	--between的情況
								BEGIN
									SET @charWhere = @charWhere + N' AND alt <= ' + CAST(@altx AS CHAR)
										+ N' AND altx >= ' + CAST(@alt AS CHAR)
									SELECT @intErrorCode = @@Error
								END
							ELSE  --即使altx有輸入，仍然只檢查alt
								SET @charWhere = @charWhere + N' AND alt = ' + CAST(@alt AS CHAR)
											+ N' AND altx IS NULL ' 
								SELECT @intErrorCode = @@Error
						END
					ELSE
						IF @intErrorCode = 0 AND @altCompare = 0	 -- '='的情況
							BEGIN
								SET @charWhere = @charWhere + N' AND alt = ' + CAST(@alt AS CHAR)
											+ N' AND altx IS NULL ' 
											--	+ N' OR altx = ' + CAST(@alt AS CHAR)
											--	+ N' OR alt = ' + CAST(@alt AS CHAR) 
								SELECT @intErrorCode = @@Error
							END
						ELSE
							
							IF @intErrorCode = 0 AND @altCompare = 1	-- '>='的情況
								BEGIN
									SET @charWhere = @charWhere + N' AND alt >= ' + CAST(@alt AS CHAR)
									SELECT @intErrorCode = @@Error
								END
							ELSE
								IF @intErrorCode = 0 AND @altCompare = 2 -- @altCompare = 2 '<='的情況
									BEGIN
										SET @charWhere = @charWhere + N' AND alt <= ' + CAST(@alt AS CHAR)
										SELECT @intErrorCode = @@Error				
									END
								ELSE -- @altCompare = 3 'Between'的情況
									SET @charWhere = @charWhere + N' AND 0 <> 0' --避免BETWEEN只輸入alt
									SELECT @intErrorCode = @@Error
				
				--SELECT @intErrorCode = @@Error		
				END	
			ELSE
				IF @intErrorCode = 0 AND LEN(@charWhere) = 0
				BEGIN
					SET @charWhere = @charWhere + N' AND 0 <> 0' --避免只輸入altx的情況
					SELECT @intErrorCode = @@Error
				END
		END
		

	

	

IF @debug <> 0 SELECT @charWhere charWhere


--remove ' AND ' from the end of string
/*
IF @intErrorCode = 0 AND SUBSTRING(@charWhere, LEN(@charWhere) - 4, 5) = ' AND '
	BEGIN
		SET @charWhere = SUBSTRING(@charWhere, 1, LEN(@charWhere) - 5)
		SELECT @intErrorCode = @@Error
		IF @debug <> 0 SELECT @charWhere charWhere
END
*/

IF @intErrorCode = 0 AND LEN(@charWhere)> 0
BEGIN
	SET @charQuery = @charQuery 
		+ ' WHERE  HastSpecimens.specimenOrderNum IS NOT NULL AND 1 = 1 ' + @charWhere
	SELECT @intErrorCode = @@Error
END

IF @debug <> 0
	SELECT @charQuery Query

-- get vwHastDupVerification

IF @intErrorCode = 0
BEGIN
	EXEC (@charQuery)
	--select @charquery
	SELECT @intErrorCode = @@Error
END


RETURN @intErrorCode
GO
