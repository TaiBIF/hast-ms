Imports System.Drawing
Imports System.Drawing.Imaging
Imports Subgurim.Controles
Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration

Partial Class Mgm_Project_EditSpeciesCharacteristics
    Inherits System.Web.UI.Page

    Dim dv As Data.DataView
    Dim dv0, dv1, dv2, dv3 As DataView

    Private dsSpeciesCharacters As New DataSet
    Private dataAdapter As New SqlDataAdapter


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        DBBind()

    End Sub

    Protected Sub DBBind()

        Dim intClass As Integer
        Dim txtSpecies As String


        Dim txtCharacteristcsList As String



        Try

            Dim connSetting As ConnectionStringSettings = WebConfigurationManager.ConnectionStrings("HASTDBConnectionString")
            Dim conn As SqlConnection = New SqlConnection(connSetting.ConnectionString)

            Dim strSQL As String = ""
            Dim sqlCommand As New SqlCommand

            Dim InsertCommand As New SqlCommand



            strSQL = "prSpeciesCharacteristics"

            If Request.QueryString("speciesID") <> "" Then
                Dim paramSpeciesID As New SqlParameter("speciesID", SqlDbType.Int)
                paramSpeciesID.Direction = Data.ParameterDirection.Input
                paramSpeciesID.Value = Request.QueryString("speciesID")
                sqlCommand.Parameters.Add(paramSpeciesID)
            End If


            sqlCommand.CommandText = strSQL
            sqlCommand.Connection = conn
            sqlCommand.CommandType = CommandType.StoredProcedure



            If Request.QueryString("speciesID") <> "" Or Request.QueryString("lID") <> "" Then
                'If Request.QueryString("speciesID") <> "" Then
                'If Request.QueryString("lID") <> "" Then   若 request page 則改檢查lID

                dataAdapter = New SqlDataAdapter
                dataAdapter.SelectCommand = sqlCommand

                conn.Open()
                dataAdapter.Fill(dsSpeciesCharacters)

                '學名資料
                dv0 = New DataView
                dv0.Table = dsSpeciesCharacters.Tables(0)


                intClass = dv0.Item(0).Row(0)
                txtSpecies = dv0.Item(0).Row(2)
                Label1.Text = txtSpecies



                dv3 = New DataView
                dv3.Table = dsSpeciesCharacters.Tables(3)

                '特徵值陣列轉字串
                txtCharacteristcsList = "," & dv3.Item(0).Row(0) & ","
                txtCharacteristcsList = Replace(txtCharacteristcsList, " ", "")


                'If txtCharacteristcsList.Contains(",25,") Or intClass = 1 Then '蕨類
                If intClass = 1 Then '蕨類
                    plantCate.Items.FindByValue(25).Selected = True

                    LabelFlowerColor.Visible = False
                    LabelPetal.Visible = False
                    LabelPerianth.Visible = False
                    LabelAnthotaxy.Visible = False
                    LabelInflorescene.Visible = False
                    LabelFruit.Visible = False

                    flowerColor.Visible = False
                    petal.Visible = False
                    perianth.Visible = False
                    anthotaxy.Visible = False
                    inflorescene.Visible = False
                    fruit.Visible = False

                    '蕨類特徵填入
                    If txtCharacteristcsList.Contains(",27,") Then
                        perispore.Items.FindByValue(27).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",29,") Then
                        perispore.Items.FindByValue(29).Selected = True
                    End If

                    If txtCharacteristcsList.Contains(",31,") Then
                        perisporeType.Items.FindByValue(31).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",32,") Then
                        perisporeType.Items.FindByValue(32).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",33,") Then
                        perisporeType.Items.FindByValue(33).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",34,") Then
                        perisporeType.Items.FindByValue(34).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",35,") Then
                        perisporeType.Items.FindByValue(35).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",36,") Then
                        perisporeType.Items.FindByValue(36).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",37,") Then
                        perisporeType.Items.FindByValue(37).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",38,") Then
                        perisporeType.Items.FindByValue(38).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",39,") Then
                        perisporeType.Items.FindByValue(39).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",40,") Then
                        perisporeType.Items.FindByValue(40).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",41,") Then
                        perisporeType.Items.FindByValue(41).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",42,") Then
                        perisporeType.Items.FindByValue(42).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",43,") Then
                        perisporeType.Items.FindByValue(43).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",44,") Then
                        perisporeType.Items.FindByValue(44).Selected = True
                    End If


                    'ElseIf txtCharacteristcsList.Contains(",26,") OrElse intClass = 2 OrElse 3 OrElse 4 Then '開花植物
                ElseIf intClass = 2 OrElse 3 OrElse 4 Then '開花植物
                    plantCate.Items.FindByValue(26).Selected = True

                    LabelPerispore.Visible = False
                    LabelPerisporeType.Visible = False

                    perispore.Visible = False
                    perisporeType.Visible = False

                    '開花植物特徵填入
                    '   花色
                    If txtCharacteristcsList.Contains(",51,") Then
                        flowerColor.Items.FindByValue(51).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",52,") Then
                        flowerColor.Items.FindByValue(52).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",53,") Then
                        flowerColor.Items.FindByValue(53).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",54,") Then
                        flowerColor.Items.FindByValue(54).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",55,") Then
                        flowerColor.Items.FindByValue(55).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",56,") Then
                        flowerColor.Items.FindByValue(56).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",57,") Then
                        flowerColor.Items.FindByValue(57).Selected = True
                    End If

                    '   花瓣
                    If txtCharacteristcsList.Contains(",58,") Then
                        petal.Items.FindByValue(58).Selected = True
                    ElseIf txtCharacteristcsList.Contains(",59,") Then
                        petal.Items.FindByValue(59).Selected = True
                    End If

                    '   花被裂片數
                    If txtCharacteristcsList.Contains(",60,") Then
                        perianth.Items.FindByValue(60).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",61,") Then
                        perianth.Items.FindByValue(61).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",62,") Then
                        perianth.Items.FindByValue(62).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",63,") Then
                        perianth.Items.FindByValue(63).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",64,") Then
                        perianth.Items.FindByValue(64).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",65,") Then
                        perianth.Items.FindByValue(65).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",66,") Then
                        perianth.Items.FindByValue(66).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",67,") Then
                        perianth.Items.FindByValue(67).Selected = True
                    End If

                    '   花序形態
                    If txtCharacteristcsList.Contains(",68,") Then
                        anthotaxy.Items.FindByValue(68).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",69,") Then
                        anthotaxy.Items.FindByValue(69).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",70,") Then
                        anthotaxy.Items.FindByValue(70).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",71,") Then
                        anthotaxy.Items.FindByValue(71).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",72,") Then
                        anthotaxy.Items.FindByValue(72).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",73,") Then
                        anthotaxy.Items.FindByValue(73).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",74,") Then
                        anthotaxy.Items.FindByValue(74).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",75,") Then
                        anthotaxy.Items.FindByValue(75).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",76,") Then
                        anthotaxy.Items.FindByValue(76).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",77,") Then
                        anthotaxy.Items.FindByValue(77).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",78,") Then
                        anthotaxy.Items.FindByValue(78).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",79,") Then
                        anthotaxy.Items.FindByValue(79).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",80,") Then
                        anthotaxy.Items.FindByValue(80).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",90,") Then
                        anthotaxy.Items.FindByValue(90).Selected = True
                    End If

                    '   花期
                    If txtCharacteristcsList.Contains(",91,") Then
                        inflorescene.Items.FindByValue(91).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",92,") Then
                        inflorescene.Items.FindByValue(92).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",93,") Then
                        inflorescene.Items.FindByValue(93).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",94,") Then
                        inflorescene.Items.FindByValue(94).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",95,") Then
                        inflorescene.Items.FindByValue(95).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",96,") Then
                        inflorescene.Items.FindByValue(96).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",97,") Then
                        inflorescene.Items.FindByValue(97).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",98,") Then
                        inflorescene.Items.FindByValue(98).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",99,") Then
                        inflorescene.Items.FindByValue(99).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",100,") Then
                        inflorescene.Items.FindByValue(100).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",101,") Then
                        inflorescene.Items.FindByValue(101).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",102,") Then
                        inflorescene.Items.FindByValue(102).Selected = True
                    End If

                    '   果實形態
                    If txtCharacteristcsList.Contains(",103,") Then
                        fruit.Items.FindByValue(103).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",104,") Then
                        fruit.Items.FindByValue(104).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",105,") Then
                        fruit.Items.FindByValue(105).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",106,") Then
                        fruit.Items.FindByValue(106).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",107,") Then
                        fruit.Items.FindByValue(107).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",108,") Then
                        fruit.Items.FindByValue(108).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",109,") Then
                        fruit.Items.FindByValue(109).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",110,") Then
                        fruit.Items.FindByValue(110).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",111,") Then
                        fruit.Items.FindByValue(111).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",112,") Then
                        fruit.Items.FindByValue(112).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",113,") Then
                        fruit.Items.FindByValue(113).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",114,") Then
                        fruit.Items.FindByValue(114).Selected = True
                    End If
                    If txtCharacteristcsList.Contains(",115,") Then
                        fruit.Items.FindByValue(115).Selected = True
                    End If

                End If


                '共用特徵填入
                '   莖
                If txtCharacteristcsList.Contains(",131,") Then
                    stem.Items.FindByValue(131).Selected = True
                End If
                If txtCharacteristcsList.Contains(",132,") Then
                    stem.Items.FindByValue(132).Selected = True
                End If
                If txtCharacteristcsList.Contains(",133,") Then
                    stem.Items.FindByValue(133).Selected = True
                End If
                If txtCharacteristcsList.Contains(",134,") Then
                    stem.Items.FindByValue(134).Selected = True
                End If
                If txtCharacteristcsList.Contains(",135,") Then
                    stem.Items.FindByValue(135).Selected = True
                End If

                '   習性
                If txtCharacteristcsList.Contains(",3,") Then
                    habitation.Items.FindByValue(3).Selected = True
                End If
                If txtCharacteristcsList.Contains(",4,") Then
                    habitation.Items.FindByValue(4).Selected = True
                End If
                If txtCharacteristcsList.Contains(",5,") Then
                    habitation.Items.FindByValue(5).Selected = True
                End If
                If txtCharacteristcsList.Contains(",6,") Then
                    habitation.Items.FindByValue(6).Selected = True
                End If
                If txtCharacteristcsList.Contains(",7,") Then
                    habitation.Items.FindByValue(7).Selected = True
                End If
                If txtCharacteristcsList.Contains(",8,") Then
                    habitation.Items.FindByValue(8).Selected = True
                End If

                '   葉序
                If txtCharacteristcsList.Contains(",121,") Then
                    phyllotaxy.Items.FindByValue(121).Selected = True
                End If
                If txtCharacteristcsList.Contains(",122,") Then
                    phyllotaxy.Items.FindByValue(122).Selected = True
                End If
                If txtCharacteristcsList.Contains(",123,") Then
                    phyllotaxy.Items.FindByValue(123).Selected = True
                End If
                If txtCharacteristcsList.Contains(",124,") Then
                    phyllotaxy.Items.FindByValue(124).Selected = True
                End If
                If txtCharacteristcsList.Contains(",125,") Then
                    phyllotaxy.Items.FindByValue(125).Selected = True
                End If
                If txtCharacteristcsList.Contains(",126,") Then
                    phyllotaxy.Items.FindByValue(126).Selected = True
                End If
                If txtCharacteristcsList.Contains(",127,") Then
                    phyllotaxy.Items.FindByValue(127).Selected = True
                End If
                If txtCharacteristcsList.Contains(",128,") Then
                    phyllotaxy.Items.FindByValue(128).Selected = True
                End If
                If txtCharacteristcsList.Contains(",129,") Then
                    phyllotaxy.Items.FindByValue(129).Selected = True
                End If

                '   葉
                If txtCharacteristcsList.Contains(",10,") Then
                    leaf.Items.FindByValue(10).Selected = True
                ElseIf txtCharacteristcsList.Contains(",12,") Then
                    leaf.Items.FindByValue(12).Selected = True
                End If


                '   複葉形態
                If txtCharacteristcsList.Contains(",116,") Then
                    compoundLeaf.Items.FindByValue(116).Selected = True
                ElseIf txtCharacteristcsList.Contains(",117,") Then
                    compoundLeaf.Items.FindByValue(117).Selected = True
                ElseIf txtCharacteristcsList.Contains(",118,") Then
                    compoundLeaf.Items.FindByValue(118).Selected = True
                ElseIf txtCharacteristcsList.Contains(",119,") Then
                    compoundLeaf.Items.FindByValue(119).Selected = True
                End If

                '   羽狀複葉形態
                If txtCharacteristcsList.Contains(",13,") Then
                    pinnate.Items.FindByValue(13).Selected = True
                End If
                If txtCharacteristcsList.Contains(",14,") Then
                    pinnate.Items.FindByValue(14).Selected = True
                End If
                If txtCharacteristcsList.Contains(",15,") Then
                    pinnate.Items.FindByValue(15).Selected = True
                End If
                If txtCharacteristcsList.Contains(",16,") Then
                    pinnate.Items.FindByValue(16).Selected = True
                End If
                If txtCharacteristcsList.Contains(",17,") Then
                    pinnate.Items.FindByValue(17).Selected = True
                End If
                If txtCharacteristcsList.Contains(",18,") Then
                    pinnate.Items.FindByValue(18).Selected = True
                End If
                If txtCharacteristcsList.Contains(",19,") Then
                    pinnate.Items.FindByValue(19).Selected = True
                End If
                If txtCharacteristcsList.Contains(",20,") Then
                    pinnate.Items.FindByValue(20).Selected = True
                End If



                conn.Close()
                conn.Dispose()

            End If

        Catch ex As SqlException

            Response.Write("File not found!")

        Catch ex As Exception

            Response.Write("File not found!")

        End Try

    End Sub


    
    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click

        Dim strOptions As String
        strOptions = ""

        Dim characteristics As New ArrayList()

        Dim j As Integer

        j = 0
        For i = 0 To stem.Items.Count - 1
            If stem.Items(i).Selected Then
                j += stem.Items(i).Value
            End If
        Next

        For i = 0 To habitation.Items.Count - 1
            If habitation.Items(i).Selected Then
                j += habitation.Items(i).Value
            End If
        Next

        For i = 0 To flowerColor.Items.Count - 1
            If flowerColor.Items(i).Selected Then
                j += flowerColor.Items(i).Value
            End If
        Next

        For i = 0 To perianth.Items.Count - 1
            If perianth.Items(i).Selected Then
                j += perianth.Items(i).Value
            End If
        Next

        For i = 0 To anthotaxy.Items.Count - 1
            If anthotaxy.Items(i).Selected Then
                j += anthotaxy.Items(i).Value
            End If
        Next

        For i = 0 To inflorescene.Items.Count - 1
            If inflorescene.Items(i).Selected Then
                j += inflorescene.Items(i).Value
            End If
        Next

        For i = 0 To fruit.Items.Count - 1
            If fruit.Items(i).Selected Then
                j += fruit.Items(i).Value
            End If
        Next

        For i = 0 To phyllotaxy.Items.Count - 1
            If phyllotaxy.Items(i).Selected Then
                j += phyllotaxy.Items(i).Value
            End If
        Next

        For i = 0 To pinnate.Items.Count - 1
            If pinnate.Items(i).Selected Then
                j += pinnate.Items(i).Value
            End If
        Next

        For i = 0 To perispore.Items.Count - 1
            If perispore.Items(i).Selected Then
                j += perispore.Items(i).Value
            End If
        Next

        For i = 0 To perisporeType.Items.Count - 1
            If perisporeType.Items(i).Selected Then
                j += perisporeType.Items(i).Value
            End If
        Next

        For i = 0 To plantCate.Items.Count - 1
            If plantCate.Items(i).Selected Then
                j += plantCate.Items(i).Value
            End If
        Next

        For i = 0 To petal.Items.Count - 1
            If petal.Items(i).Selected Then
                j += petal.Items(i).Value
            End If
        Next


        For i = 0 To leaf.Items.Count - 1
            If leaf.Items(i).Selected Then
                j += leaf.Items(i).Value
            End If
        Next

        For i = 0 To compoundLeaf.Items.Count - 1
            If compoundLeaf.Items(i).Selected Then
                j += compoundLeaf.Items(i).Value
            End If
        Next

        '============================================================
        If j <> 0 Then


            For i = 0 To stem.Items.Count - 1
                If stem.Items(i).Selected Then
                    strOptions += stem.Items(i).Value + ","
                    characteristics.Add(stem.Items(i).Value)
                End If
            Next

            For i = 0 To habitation.Items.Count - 1
                If habitation.Items(i).Selected Then
                    strOptions += habitation.Items(i).Value + ","
                    characteristics.Add(habitation.Items(i).Value)
                End If
            Next

            For i = 0 To flowerColor.Items.Count - 1
                If flowerColor.Items(i).Selected Then
                    strOptions += flowerColor.Items(i).Value + ","
                    characteristics.Add(flowerColor.Items(i).Value)
                End If
            Next

            For i = 0 To perianth.Items.Count - 1
                If perianth.Items(i).Selected Then
                    strOptions += perianth.Items(i).Value + ","
                    characteristics.Add(perianth.Items(i).Value)
                End If
            Next

            For i = 0 To anthotaxy.Items.Count - 1
                If anthotaxy.Items(i).Selected Then
                    strOptions += anthotaxy.Items(i).Value + ","
                    characteristics.Add(anthotaxy.Items(i).Value)
                End If
            Next

            For i = 0 To inflorescene.Items.Count - 1
                If inflorescene.Items(i).Selected Then
                    strOptions += inflorescene.Items(i).Value + ","
                    characteristics.Add(inflorescene.Items(i).Value)
                End If
            Next

            For i = 0 To fruit.Items.Count - 1
                If fruit.Items(i).Selected Then
                    strOptions += fruit.Items(i).Value + ","
                    characteristics.Add(fruit.Items(i).Value)
                End If
            Next

            For i = 0 To phyllotaxy.Items.Count - 1
                If phyllotaxy.Items(i).Selected Then
                    strOptions += phyllotaxy.Items(i).Value + ","
                    characteristics.Add(phyllotaxy.Items(i).Value)
                End If
            Next

            j = 0
            For i = 0 To pinnate.Items.Count - 1
                If pinnate.Items(i).Selected Then
                    strOptions += pinnate.Items(i).Value + ","
                    characteristics.Add(pinnate.Items(i).Value)
                End If
            Next

            For i = 0 To perispore.Items.Count - 1
                If perispore.Items(i).Selected Then
                    strOptions += perispore.Items(i).Value + ","
                    characteristics.Add(perispore.Items(i).Value)
                End If
            Next

            For i = 0 To perisporeType.Items.Count - 1
                If perisporeType.Items(i).Selected Then
                    strOptions += perisporeType.Items(i).Value + ","
                    characteristics.Add(perisporeType.Items(i).Value)
                End If
            Next

            For i = 0 To plantCate.Items.Count - 1
                If plantCate.Items(i).Selected Then
                    strOptions += plantCate.Items(i).Value + ","
                    characteristics.Add(plantCate.Items(i).Value)
                End If
            Next

            For i = 0 To petal.Items.Count - 1
                If petal.Items(i).Selected Then
                    strOptions += petal.Items(i).Value + ","
                    characteristics.Add(petal.Items(i).Value)
                End If
            Next

            For i = 0 To leaf.Items.Count - 1
                If leaf.Items(i).Selected Then
                    strOptions += leaf.Items(i).Value + ","
                    characteristics.Add(leaf.Items(i).Value)
                End If
            Next

            For i = 0 To compoundLeaf.Items.Count - 1
                If compoundLeaf.Items(i).Selected Then
                    strOptions += compoundLeaf.Items(i).Value + ","
                    characteristics.Add(compoundLeaf.Items(i).Value)
                End If
            Next

        End If

        If Len(strOptions) > 0 Then
            strOptions = Left(strOptions, Len(strOptions) - 1)

            Dim connSetting As ConnectionStringSettings = WebConfigurationManager.ConnectionStrings("HASTDBConnectionString")
            Dim conn As SqlConnection = New SqlConnection(connSetting.ConnectionString)

            Dim strSQL As String = ""
            Dim InsertCommand As New SqlCommand

            strSQL = "prSpeciesCharacteristicsEdit"

            Dim charact As Integer

            Try

                conn.Open()

                Dim paramSpeciesID As New SqlParameter("speciesID", SqlDbType.Int)
                paramSpeciesID.Direction = Data.ParameterDirection.Input


                Dim paramCharacteristicID As New SqlParameter("characteristicID", SqlDbType.Int)
                paramCharacteristicID.Direction = Data.ParameterDirection.Input

                For Each charact In characteristics


                    If Request.QueryString("speciesID") <> "" Then

                        paramSpeciesID.Value = Request.QueryString("speciesID")
                        InsertCommand.Parameters.Add(paramSpeciesID)

                        paramCharacteristicID.Value = charact
                        InsertCommand.Parameters.Add(paramCharacteristicID)

                        InsertCommand.CommandText = strSQL
                        InsertCommand.Connection = conn
                        InsertCommand.CommandType = CommandType.StoredProcedure


                        InsertCommand.ExecuteNonQuery()

                        InsertCommand.Parameters.Clear()


                    End If

                Next charact

                InsertCommand.Dispose()
                conn.Close()
                conn.Dispose()

            Catch ex As SqlException

                Response.Write("File not found!")
            Catch ex As Exception

                Response.Write("File not found!")
            End Try



            Dim strRedirectUrl As String
            strRedirectUrl = "~/Mgm/Project/EditCharacteristicsSuccess.aspx?speciesID="
            strRedirectUrl += Request.QueryString("speciesID")
            Response.Redirect(strRedirectUrl)

        End If

    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click

        stem.SelectedIndex = -1

        compoundLeaf.SelectedIndex = -1
        habitation.SelectedIndex = -1

        flowerColor.SelectedIndex = -1


        perianth.SelectedIndex = -1
        anthotaxy.SelectedIndex = -1

        inflorescene.SelectedIndex = -1

        fruit.SelectedIndex = -1

        phyllotaxy.SelectedIndex = -1

        pinnate.SelectedIndex = -1
        perispore.SelectedIndex = -1

        perisporeType.SelectedIndex = -1

        petal.SelectedIndex = -1
        plantCate.SelectedIndex = -1

        leaf.SelectedIndex = -1

    End Sub
End Class
