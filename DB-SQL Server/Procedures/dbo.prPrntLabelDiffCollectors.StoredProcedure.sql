USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prPrntLabelDiffCollectors]    Script Date: 03/12/2018 15:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prPrntLabelDiffCollectors]

	@CollectorID1 int = Null,
	@CollectorID2 int = Null,
	@CollectorID3 int = Null,
	@CollectorID4 int = Null,
	@CollectorID5 int = Null,
	@CollectorID6 int = Null,
	@CollectorID7 int = Null,
	@CollectorID8 int = Null,

	@Num1 int = Null,
	@Num2 int = Null,
	@Num3 int = Null,
	@Num4 int = Null,
	@Num5 int = Null,
	@Num6 int = Null,
	@Num7 int = Null,
	@Num8 int = Null

AS

SELECT *

FROM

	vwHASTDetail


WHERE
		
	(
		hCID = @collectorID1 
	and hCNum1 = @Num1
	)

	or
	(
		hCID = @collectorID2
	and hCNum1 = @Num2
	)

	or
	(
		hCID = @collectorID3
	and hCNum1 = @Num3
	)

	or
	(
		hCID = @collectorID4
	and hCNum1 = @Num4
	)

	or
	(
		hCID = @collectorID5
	and hCNum1 = @Num5
	)

	or
	(
		hCID = @collectorID6
	and hCNum1 = @Num6
	)

	or
	(
		hCID = @collectorID7
	and hCNum1 = @Num7
	)

	or
	(
		hCID = @collectorID8
	and hCNum1 = @Num8
	)
GO
