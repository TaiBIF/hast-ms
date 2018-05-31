USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prSinicaFloraList]    Script Date: 03/12/2018 15:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prSinicaFloraList]

AS

SELECT
	listID
	, classID
	, classE
	, classC
	, familyID
	, familyE
	, familyC
	, speciesID
	, speciesE
	, speciesC
FROM
	vwSinicaFlora
GO
