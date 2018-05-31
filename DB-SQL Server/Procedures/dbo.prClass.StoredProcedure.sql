USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prClass]    Script Date: 03/12/2018 15:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROC [dbo].[prClass] 
	
AS
	
SELECT
	classID
	, classC
	, classE
	, classE + ' ' + classC AS classExpr
FROM
	classX
GO
