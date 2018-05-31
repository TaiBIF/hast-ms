USE [HASTDB]
GO
/****** Object:  View [dbo].[vwCheckup]    Script Date: 03/12/2018 14:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  VIEW [dbo].[vwCheckup]  	
AS
	/*checkup程式中的表單資料來源*/
SELECT
	collectorID,
	collectNum1,
	collectNum2,
	CKSN,
	ckDate,
	blnBored,
	blnDestroyed,
	blnNoFlwFruit,
	storedSiteID,
	voidDate
FROM
	checkup
GO
