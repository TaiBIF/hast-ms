USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prSpecimensList]    Script Date: 03/12/2018 15:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prSpecimensList]

	/*
		動態查詢
		含複份及鑑訂資料至相同欄位
		網頁使用
		
	*/

	

AS

	SET NOCOUNT ON


	
	
				
			SELECT TOP 1000  
						SN, dupID, HastSpecimens.specimenOrderNum, listID,  
						sf.specimenOrderNum AS imageFile, 
						collectorID, collectNum1, collectNum2, collectionDate, 
						collectorName, nameC, collectionFLNo, collectionLFNo, collectionFLCNo, 
						countryNo, provinceNo, hsienNo, townNo, localityID, parkNo, 
						WGS84Lng, + WGS84Lat, alt, altx, elevation, 
						country, countryC,districtE, districtC, localityDescE, localityDescC, location, 
						verfamilyID, verGenusID, verSpeciesID, 
						verFamilyE, verFamilyC, verGenusE, verGenusC, verSpeciesE, verSpeciesC, 
						verFullTaxonName, verificationNo, verifierName, verifierNameFL 
						
						FROM vwHastDupVerificationLast
					
						 AS HastSpecimens 
						LEFT JOIN specImgFile AS sf ON HastSpecimens.specimenOrderNum 
						 = sf.specimenOrderNum 
						 WHERE HastSpecimens.specimenOrderNum is not null
						 AND verFamilyID IS not null
						 ORDER BY specimenOrderNum
GO
