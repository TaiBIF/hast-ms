USE [HASTDB]
GO
/****** Object:  View [dbo].[vwImageHast]    Script Date: 03/12/2018 14:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwImageHast]
AS
	/*
	
	*/
SELECT
	imageCode
	, vwHast.SN
FROM
	vwHAST
	INNER JOIN images ON vwHAST.SN = images.SN
	INNER JOIN vwVerificationLast ON vwHAST.SN = vwVerificationLast.SN
GO
