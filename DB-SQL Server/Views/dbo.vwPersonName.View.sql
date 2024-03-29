USE [HASTDB]
GO
/****** Object:  View [dbo].[vwPersonName]    Script Date: 03/12/2018 14:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwPersonName]
AS
SELECT
	pid
	, lastName
	, firstName
	, nameC
	, nameAbbr
	, Collector
	, Identifier
	, ImageAuthor
	, lastName + 
		CASE
			WHEN firstName IS NULL THEN ''
			ELSE ', ' +firstName 
		END
		AS nameLF

	, lastName +
		CASE
			WHEN firstName IS NULL THEN '' +
				CASE
					WHEN nameC IS NULL THEN ''
					ELSE ' ' + nameC
				END
			ELSE ', ' +firstName + 
				CASE
					WHEN nameC IS NULL THEN ''
					ELSE ' ' + nameC
				END
		END
		AS nameLFC1

	, lastName + 
		CASE
			WHEN firstName IS NULL THEN '' +
				CASE
					WHEN nameC IS NULL THEN ''
					ELSE ' (' + nameC + ')'
				END
			ELSE ', ' +firstName + 
				CASE
					WHEN nameC IS NULL THEN ''
					ELSE ' (' + nameC + ')'
				END
		END 
	AS nameLFC2

	,   CASE 
			WHEN firstName IS NULL THEN '' 
			ELSE firstName + ' '
	    END
		  + lastName 
	AS nameFL

	,   CASE 
			WHEN firstName IS NULL THEN '' 
			ELSE firstName + ' '
	    END
		  + lastName +
		CASE
			WHEN nameC IS NULL THEN ''
			ELSE ' ' + nameC
		END
	AS nameFLC1
	
	,   CASE 
			WHEN firstName IS NULL THEN '' 
			ELSE firstName + ' '
	    END
		  + lastName +
		CASE
			WHEN nameC IS NULL THEN ''
			ELSE ' (' + nameC + ')'
		END 
	AS nameFLC2

From
	person
GO
