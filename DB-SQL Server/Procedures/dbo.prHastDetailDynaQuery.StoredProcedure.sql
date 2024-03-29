USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prHastDetailDynaQuery]    Script Date: 03/12/2018 15:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prHastDetailDynaQuery]

	/*
		動態查詢
		詳細標本標籤資料
		網頁使用
		
	*/

	@SN	INT = NULL
	, @specimenOrderNum INT = NULL
	,@debug int = 0

AS

	SET NOCOUNT ON

DECLARE

	@intErrorCode int
	, @charQuery NVARCHAR(4000)
	, @charWhere NVARCHAR(4000)

	IF 		
			@specimenOrderNum IS NULL
		AND @SN IS NULL		
		BEGIN
			SELECT 				
				@intErrorCode = @@Error
				, @charQuery = 'SELECT DISTINCT ' 
								+ ' SN, vwHASTWeb.specimenOrderNum, preparationDate, preparation, '
								+ ' sf.specimenOrderNum AS imageFile, '
								+ ' lifeForm, plantH, flowerColor, fruitColor, sexChar, '
								+ ' addChar, addCharC, exchangeDept, exchangeTo, collectionDate, '
								+ ' companion, companionE, collectionFLNo, collectionFLCNo, WGS84Lng, WGS84Lat, ' --GPSInfo, '
								+ ' alt, altx, elevation, country, countryC, districtE, districtC, '										
								+ ' localityDescE, localityDescC, veget, topography, habitat, '
								+ ' vwHastWeb.note, noteE, '								
								+ ' flower, fruits, naturalnessStatus, lightIntensity, humidity, '
								+ ' abundance, projectName, trophicData, verOFamilyE, verOFamilyC, '
								+ ' verOGenusE, verOGenusC, verOSpeciesE, verOSpeciesC, verOspeciesID, verifierOName, '
								+ ' verifierONameFL, verODate '
								+ ' FROM vwHASTWeb '
								+ ' LEFT JOIN specImgFile AS sf ON vwHastWeb.specimenOrderNum '
								+ ' = sf.specimenOrderNum '
								+ ' WHERE 1 <> 1 '			
		END

	ELSE

		SELECT 				
				@intErrorCode = @@Error
				, @charQuery = 'SELECT DISTINCT ' 
								+ ' SN, vwHASTWeb.specimenOrderNum, preparationDate, preparation, '
								+ ' sf.specimenOrderNum AS imageFile, '
								+ ' lifeForm, plantH, flowerColor, fruitColor, sexChar, '
								+ ' addChar, addCharC, exchangeDept, exchangeTo, collectionDate, '
								+ ' companion, companionE, collectionFLNo, collectionFLCNo,  WGS84Lng, WGS84Lat, ' --GPSInfo, '
								+ ' alt, altx, elevation, country, countryC, districtE, districtC, '										
								+ ' localityDescE, '  
								+ '	CASE WHEN LEN(localityDescC) = 0 THEN localityDescE ELSE localityDescC END AS localityDescC, ' 
								+ 'veget, topography, habitat, ' 
								+ ' vwHastWeb.note, noteE, '
								+ ' flower, fruits, naturalnessStatus, lightIntensity, humidity, '
								+ ' abundance, projectName, trophicData, verOFamilyE, verOFamilyC, '
								+ ' verOGenusE, verOGenusC, verOSpeciesE, verOSpeciesC, verOspeciesID, verifierOName, '
								+ ' verifierONameFL, verODate '
								+ ' FROM vwHASTWeb '
								+ ' LEFT JOIN specImgFile AS sf ON vwHastWeb.specimenOrderNum '
								+ ' = sf.specimenOrderNum '

				, @charWhere = ''

	
	IF @intErrorCode = 0 AND @specimenOrderNum IS NOT NULL
		BEGIN
			SET @charWhere =  @charWhere + N' AND  vwHastWeb.specimenOrderNum = ' 
								+ CAST(@specimenOrderNum AS CHAR)
		SELECT @intErrorCode = @@Error
	END	

	IF @intErrorCode = 0 AND @SN IS NOT NULL
		BEGIN
			SET @charWhere =  @charWhere + N' AND  vwHastWeb.SN = ' 
								+ CAST(@SN AS CHAR)
		SELECT @intErrorCode = @@Error
	END	

	IF @debug <> 0 SELECT @charWhere charWhere

	IF @intErrorCode = 0 AND LEN(@charWhere)> 0
	BEGIN
		SET @charQuery = @charQuery 
			+ ' WHERE 1 = 1 ' + @charWhere
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
