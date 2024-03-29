USE [HASTDB]
GO
/****** Object:  View [dbo].[vwExchangeFromCount]    Script Date: 03/12/2018 14:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwExchangeFromCount]

AS


SELECT 
	
	COALESCE(inst.institutionE, institutionC) AS 交換單位
	--, t.exchangeTo 
	--, d.exchangeDept
	, count(*) AS 數量
	 
FROM
duplications AS d
INNER JOIN hast as h ON  d.SN = h.sn
INNER JOIN specimens AS s on d.dupID = s.dupId
--LEFT JOIN exchangeDept AS dep ON  d.exchangeDept = dep.deptAbber
LEFT JOIN institution AS inst ON d.exchangeDept = inst.institutionAbbr
LEFT JOIN exchangeTo AS t ON d.exchangeID = t.exchangeID
INNER JOIN vwHastDupVerificationLast AS v ON s.specimenOrderNum = v.specimenOrderNum


WHERE
(

d.exchangeID = 3
)
AND
(
d.exchangeID is not null
and d.exchangeDept is not null
and institutionAbbr is not null
and verfamilyID is not null
)

GROUP BY COALESCE(inst.institutionE, institutionC)
GO
