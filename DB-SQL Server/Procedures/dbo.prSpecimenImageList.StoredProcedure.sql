USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prSpecimenImageList]    Script Date: 03/12/2018 15:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prSpecimenImageList]
	
	@firstDiskNo INT = 0 --起始光碟編號
	, @lastDiskNo INT = 0 --結束光碟編號

AS	

	--依輸入光碟號，列出標本影像清單

select 
	diskNo
	, si.specimenOrderNum
	--, v.familyID
	--, f.familyID
	, FamilyE 
	, genusE
	, speciesE

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
	
	si.diskNo  BETWEEN  @firstDiskNo AND @lastDiskNo

ORDER BY
	
	diskNo
	, s.specimenOrderNum
GO
