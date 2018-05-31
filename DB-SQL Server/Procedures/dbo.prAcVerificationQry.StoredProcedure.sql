USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prAcVerificationQry]    Script Date: 03/12/2018 15:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prAcVerificationQry]
	
	@ID INT = NULL

AS

SELECT 
	
	*
	
FROM 

	verification

WHERE
	ID=@ID
	--(COALESCE(ID, ISNULL(ID,1)) = COALESCE(NULLIF(@ID,0), ISNULL(ID,1)))
GO
