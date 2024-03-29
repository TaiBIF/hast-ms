USE [HASTDB]
GO
/****** Object:  View [dbo].[vwCheckLoanList]    Script Date: 03/12/2018 14:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwCheckLoanList]
	
AS
	/*查詢借出記錄中，以採集者採集號為記錄而缺館號的資料*/
	
SELECT DISTINCT
	l.collector
	, l.collectNum
	, s.specimenOrderNum
	, CAST(h.collectNum1 AS CHAR) + ' ' + nameLFC1  AS collectorNum
	, f.familyE
	, speciesExpr
	, invoiceID
	
FROM
	loanList AS l
	INNER JOIN hast AS h ON l.collectNum = CAST(h.collectNum1 AS CHAR)
	INNER JOIN vwPersonName AS p on h.collectorID = p.pid
	INNER JOIN duplications AS d ON h.SN = d.SN
	INNER JOIN specimens AS s ON  d.dupID = s.dupID
	INNER JOIN vwVerificationLast AS v ON h.SN = v.SN
	LEFT JOIN vwSpeciesList AS sp ON v.speciesID = sp.speciesID
	INNER JOIN family AS f ON v.familyID = f.familyID
WHERE
	l.specimenOrderNum IS NULL
GO
