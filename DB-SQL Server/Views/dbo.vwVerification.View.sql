USE [HASTDB]
GO
/****** Object:  View [dbo].[vwVerification]    Script Date: 03/12/2018 14:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  VIEW [dbo].[vwVerification]

AS

	/*
	訂正資料
	*/

SELECT

	SN
	, verificationDate
	, familyID
	, genusID
	, speciesID
	, verifierId
	, verificationNo
	, unformedVdate

FROM

	verification

WHERE

	verificationNo > 0
GO
