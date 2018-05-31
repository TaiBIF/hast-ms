USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prPrntLabelCollectorMinMax]    Script Date: 03/12/2018 15:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prPrntLabelCollectorMinMax]

	@collectorID int,
	@minNum int,
	@maxNum int

AS

SELECT *

FROM

	vwHASTDetail


WHERE

	vwHASTDetail.hCID = @collectorID
	and vwHASTDetail.hCNum1 between @minNum and @maxNum
GO
