USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prTaiBif]    Script Date: 03/12/2018 15:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prTaiBif]

AS
--將已經上傳taibif 的資料之館號存到taibif資料表
SELECT 
	collectionCode
INTO taibif
From
	vwTaiBif
GO
