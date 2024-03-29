USE [HASTDB]
GO
/****** Object:  View [dbo].[vwFamilyList]    Script Date: 03/12/2018 14:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwFamilyList]
AS

SELECT 
	[class]
	, orderID
	, familyID
	, familyE
	, familyC	
FROM
	family
WHERE
	familyID IN
	(
	 SELECT DISTINCT
		familyID
	FROM
		vwSpeciesLIST
	)
GO
