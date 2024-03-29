USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prFamilyAPG]    Script Date: 03/12/2018 15:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prFamilyAPG]
	
	@orderID INT = NULL
AS
	
SELECT DISTINCT
	
	f.familyID
	, f.familyE
	, f.familyC
	, f.familyE + 
		CASE 
			WHEN f.familyC IS NULL THEN '' 
			ELSE ' ' + f.familyC 
		END AS familyExpr
	, ApgIVFamilyID
	, orders.orderID
	, orders.orderE
	
						
FROM            
	family AS f
	INNER JOIN APGFamily AS A ON f.familyID = a.hFamilyID
	INNER JOIN orders on f.orderApgIVID = orders.orderID
	INNER JOIN genus ON f.familyID = genus.familyApgIVID
WHERE
	--classID = @classID
	(COALESCE(f.orderApgIVID, ISNULL(f.orderApgIVID,1)) = COALESCE(NULLIF(@orderID,0), ISNULL(f.orderApgIVID,1)))
GO
