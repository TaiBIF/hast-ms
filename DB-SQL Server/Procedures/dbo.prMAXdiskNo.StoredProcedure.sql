USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prMAXdiskNo]    Script Date: 03/12/2018 15:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prMAXdiskNo]

as

SELECT

	MAX(diskNo) 

From

	specImgFile
GO
