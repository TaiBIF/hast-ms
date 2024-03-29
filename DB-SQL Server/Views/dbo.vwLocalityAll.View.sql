USE [HASTDB]
GO
/****** Object:  View [dbo].[vwLocalityAll]    Script Date: 03/12/2018 14:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  VIEW [dbo].[vwLocalityAll]
AS
(
SELECT

	'nationalPark' AS sourceTable
	, parkNo AS oLocalityID
	, parkE AS nLocalityE
	, parkC AS nLocalityC

FROM
	nationalPark
)

UNION

(
SELECT
	'locality' AS sourceTable
	, localityID AS oLocalityID
	, locality AS nLocalityE
	, localityC AS nLocalityC 
FROM
	locality
)
GO
