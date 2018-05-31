USE [HASTDB]
GO
/****** Object:  View [dbo].[vwAreaList]    Script Date: 03/12/2018 14:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwAreaList]

AS

SELECT
	
	 a.areaID
	, nLocalityE
	, nLocalityC

FROM
	
	area AS a
	INNER JOIN vwLocalityAll AS l ON a.sourceTable = l.sourceTable AND a.oLocalityID = l.oLocalityID
GO
