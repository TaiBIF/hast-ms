USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prTracheophyte]    Script Date: 03/12/2018 15:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prTracheophyte]	
	
	
AS
	
SELECT 
	
	trachID
	, tracheophyte
	, tracheophyteC
						
FROM            
	tracheophyte
GO
