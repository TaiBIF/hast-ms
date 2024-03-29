USE [HASTDB]
GO
/****** Object:  View [dbo].[vwVerificationLastNo]    Script Date: 03/12/2018 14:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  VIEW [dbo].[vwVerificationLastNo]

AS

	/*找出最後一筆鑑訂的鑑訂序*/
SELECT

	SN AS LSN
	, MAX(verificationNo) AS lastVerificationNo

FROM

	verification

GROUP BY

	SN
GO
