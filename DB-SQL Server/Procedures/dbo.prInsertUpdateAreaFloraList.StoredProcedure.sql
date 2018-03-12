USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prInsertUpdateAreaFloraList]    Script Date: 03/12/2018 15:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prInsertUpdateAreaFloraList]

	@speciesID INT = NULL
	, @listID INT = NULL

AS

	/*更新地區植物名錄*/

	

UPDATE areaSpeciesList

Set 
	speciesID = @speciesID

WHERE
	listID = @listID
GO
