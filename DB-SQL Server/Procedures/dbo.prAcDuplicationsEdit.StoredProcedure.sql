USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prAcDuplicationsEdit]    Script Date: 03/12/2018 15:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prAcDuplicationsEdit]

	@dupID  INT = NULL

AS


SELECT

	*

FROM

	duplications

WHERE

	dupID = @dupID
GO
