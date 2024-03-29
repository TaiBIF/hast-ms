USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prAcDuplicationsList]    Script Date: 03/12/2018 15:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prAcDuplicationsList]

	@SN INT

AS

	/* 以清單方式顯示複份資料 */

SELECT

	d.SN
	, d.dupID
	, d.dupNo AS 複份號
		, specimens.specimenOrderNum AS 館號
	, d.greenhouse AS 溫室栽培
	, d.preparationDate AS 壓製日期
	, d.lifeForm AS 生長型
	, d.plantH AS 植株高度
	, d.flowerID
		, flower.flower AS 花期
	, d.flowerColor AS 花色
	, d.fruitsID
		, fruits.fruits AS 果期
	, d.fruitColor AS 果色
	, d.sexChar AS 性狀
	, d.addChar AS 其他描述

/*
	, DNANo
	, nameComment, dataCategory
	, statusID
	, creationOperator
	, creationDate
	, updateDate
	, dataReviser
*/


FROM
	
	duplications AS d
	LEFT JOIN flower ON d.flowerID = flower.flowerID
	LEFT JOIN fruits ON d.fruitsID = fruits.fruitsID
	LEFT JOIN specimens ON d.dupID = specimens.dupID

WHERE

	d.SN = @SN

ORDER BY

	d.dupNo
GO
