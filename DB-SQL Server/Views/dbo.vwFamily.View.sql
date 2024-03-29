USE [HASTDB]
GO
/****** Object:  View [dbo].[vwFamily]    Script Date: 03/12/2018 14:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[vwFamily]
AS
SELECT DISTINCT 
	class
	, familyID
	, familyE
	, familyC
	, familyE + 
		CASE 
			WHEN familyC IS NULL THEN '' 
			ELSE ' ' + family.familyC 
		END AS familyExpr
	, informal
	, classID
	, classE
	, classC
	
	
						
FROM            
	 dbo.family
	LEFT JOIN classX on family.class = classX.classID
GO
