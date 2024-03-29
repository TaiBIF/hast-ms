USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prAcTypeSpecimen]    Script Date: 03/12/2018 15:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prAcTypeSpecimen]

AS

	/*
	用於模式標本管理的標本詳細資料
	僅列出最後一次鑑訂資料	
	*/

SELECT
 
	*

FROM

	vwTypeDetail
	Left JOIN vwVerificationLastNo ON vwTypeDetail.SN = vwVerificationLastNo.LSN

WHERE

	vwTypeDetail.verificationNo = vwVerificationLastNo.lastVerificationNo

ORDER BY

	typeCateID, 
	verFamilyE, 
	verGenusE, 
	verSpeciesE
GO
