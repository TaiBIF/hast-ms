USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prXMLSpecimensInsert]    Script Date: 03/12/2018 15:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prXMLSpecimensInsert]

	@InsertedRowCount INT =NULL OUTPUT
	
AS
	/*
		插入尚未上傳的specimenOrderNum
	*/

SET NOCOUNT OFF

INSERT XMLSpecimensUpload(specimenOrderNum)
	
SELECT
	h.specimenOrderNum 
FROM
	vwHastDupVerificationLast AS h
	LEFT JOIN XMLSpecimensUpload AS x ON h.specimenOrderNum = x.specimenOrderNum
WHERE
	h.specimenOrderNum IS NOT NULL
	AND x.uploadDate IS NULL
	and h.creationdate < '2015-01-01'

	
SET @InsertedRowCount = @@rowcount
GO
