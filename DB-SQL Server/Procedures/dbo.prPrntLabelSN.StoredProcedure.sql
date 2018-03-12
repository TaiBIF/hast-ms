USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prPrntLabelSN]    Script Date: 03/12/2018 15:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[prPrntLabelSN]

	

AS

/* 列印指定系統代碼之標籤 */


SELECT *
	
FROM

	vwHASTDetail	


WHERE 

	vwHASTDetail.SN in 
(7032,
7463,
7737,
8798,
12297,
12727,
14411,
14496,
15303,
21561,
24995,
25652,
25684,
25700,
26093,
26749,
42000,
47551,
49995,
50301,
50533,
50626,
50627,
50628,
50629,
50630,
50631,
50632,
50633,
51564,
51565,
53252,
54114,
55633,
55686,
61915,
70368,
72911,
75947,
80310,
90122)


ORDER BY vwHASTDetail.SN
GO
