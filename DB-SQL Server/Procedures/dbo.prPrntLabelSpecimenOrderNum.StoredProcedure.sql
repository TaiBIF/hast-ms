USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prPrntLabelSpecimenOrderNum]    Script Date: 03/12/2018 15:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prPrntLabelSpecimenOrderNum]
	
	@specimenNo1 int = NULL
	, @specimenNo2 int = NULL
	, @specimenNo3 int = NULL
	, @specimenNo4 int = NULL
	, @specimenNo5 int = NULL
	, @specimenNo6 int = NULL

AS

SELECT *

FROM

	vwHASTDetail

WHERE 

	vwHASTDetail.specimenOrderNum in (
		@specimenNo1 
		, @specimenNo2
		, @specimenNo3
		, @specimenNo4
		, @specimenNo5
		, @specimenNo6
		)
GO
