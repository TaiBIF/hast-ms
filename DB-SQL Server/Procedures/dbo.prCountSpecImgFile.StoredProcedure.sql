USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prCountSpecImgFile]    Script Date: 03/12/2018 15:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[prCountSpecImgFile]

as

SELECT

	 count(*) AS totalSpcimenImg

From

	specImgFile
GO
