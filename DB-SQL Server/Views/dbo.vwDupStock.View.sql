USE [HASTDB]
GO
/****** Object:  View [dbo].[vwDupStock]    Script Date: 03/12/2018 14:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwDupStock]

AS
			/* 複份庫存 - 還未交換出的*/

SELECT 	
		d.CKSN
		, d.blnBored
		, d.blnDestroyed
		, d.blnNoFlwFruit
		, d.storedSiteID
		, d.voidDate
		, d.cNote
		, d.storedSite
		, d.SN
		, d.specimenOrderNum
		, d.cCollectorID
		, d.cCollectNum1
		, d.cCollectNum2
		, d.cCollector
		, d.cCollector2
		, d.classID
		, d.familyID
		, d.genusID
		, d.speciesID
		, d.familyE
		, d.familyC
		, d.genusE
		, d.genusC
		, d.speciesE
		, d.speciesC
		, d.loca
		 
FROM

	vwDupAll AS d
	LEFT JOIN exchangeDetail ON d.CKSN = exchangeDetail.CKSN

WHERE

	exchangeDetail.CKSN IS NULL
GO
