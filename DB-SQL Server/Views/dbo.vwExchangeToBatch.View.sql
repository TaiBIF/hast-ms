USE [HASTDB]
GO
/****** Object:  View [dbo].[vwExchangeToBatch]    Script Date: 03/12/2018 14:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwExchangeToBatch]

AS 

SELECT
	b.batchNum as 交換批次
	, exchDate as 交換日期
	, COALESCE(inst.institutionE, institutionC) AS  交換單位
	, count(CKSN) AS 數量
FROM
	exchangeBatch AS b
	INNER JOIN exchangeDetail AS d ON b.batchNum = d.batchNum
	--INNER JOIN exchangeDept As dept ON b.deptID = dept.deptID
	INNER JOIN institution AS inst ON b.institutionID = inst.institutionID
GROUP BY 
b.batchNum
	, exchDate
	, COALESCE(inst.institutionE, institutionC)
GO
