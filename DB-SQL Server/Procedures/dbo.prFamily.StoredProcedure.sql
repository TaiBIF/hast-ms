USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prFamily]    Script Date: 03/12/2018 15:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prFamily]
	
	@classID INT = NULL
AS
	
SELECT 
	
	familyID
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
	family
	LEFT JOIN classX on family.class = classX.classID
WHERE
	--classID = @classID
	(COALESCE(classID, ISNULL(classID,1)) = COALESCE(NULLIF(@classID,0), ISNULL(classID,1)))
GO
