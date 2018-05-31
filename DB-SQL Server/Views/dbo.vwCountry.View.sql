USE [HASTDB]
GO
/****** Object:  View [dbo].[vwCountry]    Script Date: 03/12/2018 14:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create VIEW [dbo].[vwCountry]
AS
SELECT
	country2Code
	, countryE
	, countryC
	, countryC + ' ' +countryE AS countryExpr
FROM countryISO
GO
