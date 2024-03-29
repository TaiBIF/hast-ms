USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prSpecimenImageCount]    Script Date: 03/12/2018 15:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prSpecimenImageCount]

	@category INT = 0
	, @firstDiskNo INT = 0 --起始光碟編號
	, @lastDiskNo INT = 0  --結束光碟編號

AS

	--依分類群統計標本影像張數

select 
	
	FamilyE
	, 
	CASE
		WHEN @category = 1 THEN genusE
		WHEN @category = 2 THEN genusE
	END 
	AS genusE
	,
	CASE
		WHEN @category = 2 THEN speciesE
	END
	AS speciesE		
	
	, count(*) AS total

FROM 

	specImgFile AS si 
	LEFT JOIN specimens AS s ON si.specimenOrderNum = s.specimenOrderNum
	LEFT JOIN duplications AS d ON s.dupID = d.dupID
	LEFT JOIN hast AS h ON d.SN = h.SN
	LEFT JOIN vwVerificationLast AS v ON h.SN = v.SN
	
	LEFT JOIN family AS f ON v.familyID = f.familyID
	LEFT JOIN genus AS g ON v.genusID = g.genusID
	LEFT JOIN species AS sp ON v.speciesID = sp.speciesID

WHERE 

	si.diskNo BETWEEN @firstDiskNo AND @lastDiskNo

GROUP BY
	
	
	familyE
	,
	CASE
		WHEN @category = 1 THEN genusE
		WHEN @category = 2 THEN genusE
	END
	,
	CASE
		WHEN @category = 2 THEN speciesE
	END
	--, genusE
	--, speciesE

ORDER BY
	
	
	familyE
	,
	CASE
		WHEN @category = 1 THEN genusE
		WHEN @category = 2 THEN genusE
	END
	,
	CASE
		WHEN @category = 2 THEN speciesE
	END
GO
