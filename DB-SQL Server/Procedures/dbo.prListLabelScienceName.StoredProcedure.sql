USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prListLabelScienceName]    Script Date: 03/12/2018 15:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC  [dbo].[prListLabelScienceName]


	@familyID int =null
	--@genusID int = null,
	--@speciesID int =null
AS

SELECT *

FROM

	vwHASTDetail





WHERE 
	
	vwHASTDetail.familyID=@familyID
	--and hast_m.genusID=@genusID
	--and hast_m.speciesID=@speciesID
GO
