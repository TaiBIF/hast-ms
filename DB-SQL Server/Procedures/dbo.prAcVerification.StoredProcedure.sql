USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prAcVerification]    Script Date: 03/12/2018 15:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prAcVerification]

	@SN INT

AS
	
SELECT 
		
	*

FROM verification

WHERE

	SN = @SN
	AND verificationNo =0
GO
