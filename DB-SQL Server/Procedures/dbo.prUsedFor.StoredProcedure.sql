USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prUsedFor]    Script Date: 03/12/2018 15:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prUsedFor]

	@UpperUsedForID INT = NULL

AS
	
	/*
	用途階層查詢
	*/

SELECT
	upperUsedForID
	, usedForID
	, usedFor
FROM
	usedFor
WHERE
	upperUsedForID = @upperUsedForID
GO
