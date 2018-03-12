Imports System.Web.Configuration
Imports System.Data
Imports System.Data.SqlClient

Partial Class Begonia_BegoniaList
    Inherits System.Web.UI.Page

    Dim strSelectCommand As String
    'Dim sqlDS As SqlDataSource
    Dim strFilter As String

    Protected Sub DBSelect()    ' 資料查詢

        strSelectCommand = "SELECT speciesID, speciesE, speciesC, sectionName, distribution, continent, epithetN FROM vwSpeciesDetail "
        strSelectCommand = strSelectCommand & " WHERE genusID = 1007  ORDER BY speciesE "

        'sqlDS = New SqlDataSource

        SDSBegoniaList.ConnectionString = WebConfigurationManager.ConnectionStrings("ScientificNameConnectionString").ConnectionString

        'strSelectCommand = strSelectCommand & strCondition

        SDSBegoniaList.SelectCommand = strSelectCommand
        SDSBegoniaList.ID = "SDSBegoniaList"
        '設定為DataSet模式
        SDSBegoniaList.DataSourceMode = SqlDataSourceMode.DataSet

    End Sub

    Protected Sub QueryCondition()   '設定查詢條件

        strFilter = " epithetN LIKE '{0}' + '%' "

        If DDListSection.SelectedValue <> "" Then
            strFilter = strFilter & " AND sectionName = '{1}'"
        End If

        If DDListContinent.SelectedValue <> "" Then
            strFilter = strFilter & " AND continent = '{2}'"
        End If

        If DDListDistribution.SelectedValue <> "" Then
            strFilter = strFilter & " AND distribution = '{3}'"
        End If

        If TextBox1.Text <> "" Then
            strFilter = strFilter & " AND (speciesE like '%' + '{4}' + '%' OR speciesC like '%' + '{4}' + '%')"
        End If

        SDSBegoniaList.FilterExpression = strFilter

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Try


            DBSelect()
            QueryCondition()

            If Not IsPostBack Then

                SiteMapDataSource1.SiteMapProvider = "TWFloraC"


                'sqlDS = New SqlDataSource

                '==設定查詢參數================================================
                Dim ctrlEpithet As New ControlParameter
                ctrlEpithet.Name = "paramPre"
                ctrlEpithet.Type = TypeCode.String
                ctrlEpithet.DefaultValue = "%"
                ctrlEpithet.ControlID = DDLEpithet.ID

                Dim ctrlParamSectionName As New ControlParameter
                ctrlParamSectionName.Name = "paramSection"
                ctrlParamSectionName.Type = TypeCode.String
                ctrlParamSectionName.DefaultValue = "%"
                ctrlParamSectionName.ControlID = DDListSection.ID

                Dim ctrlParamContinent As New ControlParameter
                ctrlParamContinent.Name = "paramContinent"
                ctrlParamContinent.Type = TypeCode.String
                ctrlParamContinent.DefaultValue = "%"
                ctrlParamContinent.ControlID = DDListContinent.ID

                Dim ctrlParamDistribution As New ControlParameter
                ctrlParamDistribution.Name = "paramDistribution"
                ctrlParamDistribution.Type = TypeCode.String
                ctrlParamDistribution.DefaultValue = "%"
                ctrlParamDistribution.ControlID = DDListDistribution.ID

                Dim ctrlParamText As New ControlParameter
                ctrlParamText.Name = "paramText"
                ctrlParamText.Type = TypeCode.String
                ctrlParamText.DefaultValue = "%"
                ctrlParamText.ControlID = TextBox1.ID

                SDSBegoniaList.FilterParameters.Add(ctrlEpithet)
                SDSBegoniaList.FilterParameters.Add(ctrlParamSectionName)
                SDSBegoniaList.FilterParameters.Add(ctrlParamContinent)
                SDSBegoniaList.FilterParameters.Add(ctrlParamDistribution)
                SDSBegoniaList.FilterParameters.Add(ctrlParamText)

                '=======================================================================

                DBSelect()
                QueryCondition()

                GridView1.DataSourceID = SDSBegoniaList.ID
                GridView1.AllowSorting = True
                GridView1.AllowPaging = True
                GridView1.PageSize = 20

                '非同步Callback模式
                GridView1.EnableSortingAndPagingCallbacks = True
                '分頁按鈕位置
                GridView1.PagerSettings.Position = PagerPosition.TopAndBottom
                '分頁對齊
                GridView1.PagerStyle.HorizontalAlign = HorizontalAlign.Center
                '分頁模式
                GridView1.PagerSettings.Mode = PagerButtons.NextPreviousFirstLast
                '分頁按鈕圖形
                GridView1.PagerSettings.FirstPageImageUrl = "~/images/btnFirst.gif"
                GridView1.PagerSettings.PreviousPageImageUrl = "~/images/btnPrevious.gif"
                GridView1.PagerSettings.NextPageImageUrl = "~/images/btnNext.gif"
                GridView1.PagerSettings.LastPageImageUrl = "~/images/btnLast.gif"

            End If

            GridView1.DataBind()    '沒加這行，數字碼分頁無用

        Catch ex As SqlException

            Response.Write("File not found!")

        Catch ex As Exception

            Response.Write("File not found!")


        End Try


    End Sub

    Protected Sub BtnReset_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnReset.Click

        '重設查詢選項
        DDListSection.SelectedValue = ""
        DDListContinent.SelectedValue = ""
        DDListDistribution.SelectedValue = ""
        DDLEpithet.SelectedValue = ""

        TextBox1.Text = ""

    End Sub


    Protected Sub GridView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.DataBound

        '顯示目前分頁索引
        Dim buttonPagerRow As GridViewRow = GridView1.BottomPagerRow
        buttonPagerRow.CssClass = "pagerRow"
        'Dim bottonPagerNo As New Label()
        'bottonPagerNo.Text = "Page " & (GridView1.PageIndex + 1) & " of " & GridView1.PageCount.ToString

        Dim myLiteral As New Literal()
        myLiteral.Text = "Page " & (GridView1.PageIndex + 1) & " of " & GridView1.PageCount.ToString
        myLiteral.Text = myLiteral.Text & "<BR />"

        buttonPagerRow.Cells(0).Controls.Add(myLiteral)



        ' MsgBox(GridView1.PageIndex.ToString & "," & pTen.ToString & "," & nTen.ToString)

        '動態建立數字分頁按鈕
        Dim nowPage As Integer


        nowPage = GridView1.PageIndex

        Dim pTen, nTen As Integer 'pTen:前10頁  nTen:後10頁
        If (nowPage - 9) > 0 Then
            pTen = nowPage - 10
            If (GridView1.PageCount - nowPage) < 9 Then
                nTen = GridView1.PageCount
            Else
                nTen = nowPage + 10
            End If
        Else
            pTen = 0
            If (GridView1.PageCount - nowPage) < 9 Then
                nTen = GridView1.PageCount
            Else
                nTen = nowPage + 10
            End If
        End If




        Dim x As Decimal   ' 10位數
        x = Decimal.Floor(nowPage / 10)

        ' 加入"往前10頁"
        If (nowPage <= 9) Then
        Else
            Dim pagePTen As New LinkButton()
            pagePTen.Text = "<< prev 10 pages|"
            pagePTen.ID = pagePTen.ToString + "pTen"
            pagePTen.CommandArgument = pTen
            AddHandler pagePTen.Click, AddressOf PagePTen_Click
            buttonPagerRow.Cells(0).Controls.Add(pagePTen)
        End If

        '加入數字頁碼
        Dim k As Integer = 0

        If GridView1.PageCount <= 10 Then

            For k = 0 To (GridView1.PageCount - 1) '取第1頁至總頁面數
                Dim PageNo As New LinkButton()
                PageNo.Text = Convert.ToString(k + 1)
                PageNo.ID = (PageNo.ToString() + k.ToString())
                PageNo.CommandArgument = k.ToString()
                AddHandler PageNo.Click, AddressOf PageNo_Click
                buttonPagerRow.Cells(0).Controls.Add(PageNo)
            Next k

        Else

            If nowPage < 10 Then
            Else
            End If

            Dim j As Integer
            For j = 0 To 9 '取第1頁至總頁面數

                k = (x * 10) + j

                If k < GridView1.PageCount Then
                    Dim PageNo As New LinkButton()
                    PageNo.Text = Convert.ToString(k + 1)
                    PageNo.ID = (PageNo.ToString() + k.ToString())
                    PageNo.CommandArgument = k.ToString()
                    AddHandler PageNo.Click, AddressOf PageNo_Click
                    buttonPagerRow.Cells(0).Controls.Add(PageNo)
                Else

                    Exit For

                End If

            Next j

        End If



        '加入"往後10頁"
        'If ((GridView1.PageCount - nowPage) <= 9) Then
        If (GridView1.PageCount - (x * 10)) > 10 Then
            Dim pageNTen As New LinkButton()
            pageNTen.Text = "|next 10 pages >>"
            pageNTen.ID = pageNTen.ToString + "nTen"
            pageNTen.CommandArgument = nTen
            AddHandler pageNTen.Click, AddressOf PageNTen_Click
            buttonPagerRow.Cells(0).Controls.Add(pageNTen)
        End If


        ''動態建立數字分頁按鈕
        'Dim i As Integer
        'Dim nowPage As Integer

        'nowPage = GridView1.PageIndex

        'Dim pTen, nTen As Integer
        'If (nowPage - 9) > 0 Then
        '    pTen = nowPage - 10
        '    If (GridView1.PageCount - nowPage) < 9 Then
        '        nTen = GridView1.PageCount
        '    Else
        '        nTen = nowPage + 10
        '    End If
        'Else
        '    pTen = 0
        '    If (GridView1.PageCount - nowPage) < 9 Then
        '        nTen = GridView1.PageCount
        '    Else
        '        nTen = nowPage + 10
        '    End If
        'End If

        '' 加入"往前10頁"
        'If (nowPage <= 0) Then
        'Else
        '    Dim pagePTen As New LinkButton()
        '    pagePTen.Text = "<< prev 10 pages|"
        '    pagePTen.ID = pagePTen.ToString + "pTen"
        '    pagePTen.CommandArgument = pTen
        '    AddHandler pagePTen.Click, AddressOf PagePTen_Click
        '    buttonPagerRow.Cells(0).Controls.Add(pagePTen)
        'End If

        ''加入數字頁碼
        'For i = (nowPage + 0) To (nowPage + 9)
        '    'For i = 0 To GridView1.PageCount - 1
        '    'Dim PageNo As New LinkButton()
        '    If (i + 10) >= GridView1.PageCount Then '假如現在頁面+10比總頁數多
        '        Dim j As Integer
        '        For j = (GridView1.PageCount - 10) To (GridView1.PageCount - 1) '取最後10頁
        '            If GridView1.PageCount < 10 Then '假如總頁面<10

        '                Dim k As Integer
        '                For k = 0 To (GridView1.PageCount - 1) '取第1頁至總頁面數
        '                    Dim PageNo As New LinkButton()
        '                    PageNo.Text = Convert.ToString(k + 1)
        '                    PageNo.ID = (PageNo.ToString() + k.ToString())
        '                    PageNo.CommandArgument = k.ToString()
        '                    AddHandler PageNo.Click, AddressOf PageNo_Click
        '                    buttonPagerRow.Cells(0).Controls.Add(PageNo)
        '                Next k
        '                Exit For
        '            Else
        '                Dim PageNo As New LinkButton()
        '                PageNo.Text = Convert.ToString(j + 1)
        '                PageNo.ID = (PageNo.ToString() + j.ToString())
        '                PageNo.CommandArgument = j.ToString()
        '                AddHandler PageNo.Click, AddressOf PageNo_Click
        '                buttonPagerRow.Cells(0).Controls.Add(PageNo)
        '            End If
        '        Next j
        '        Exit For
        '    Else
        '        If i < 4 Then '假如頁碼在1-5頁

        '            Dim k As Integer
        '            For k = 0 To 9 '(GridView1.PageCount - 1) '取第1頁至總頁面數
        '                Dim PageNo As New LinkButton()
        '                PageNo.Text = Convert.ToString(k + 1)
        '                PageNo.ID = (PageNo.ToString() + k.ToString())
        '                PageNo.CommandArgument = k.ToString()
        '                AddHandler PageNo.Click, AddressOf PageNo_Click
        '                buttonPagerRow.Cells(0).Controls.Add(PageNo)
        '            Next k
        '            Exit For


        '        Else '假如頁碼在5頁以後，開始動，但將本頁保持在中間

        '            'Dim PageNo As New LinkButton()
        '            'PageNo.Text = Convert.ToString(i + 1)
        '            'PageNo.ID = (PageNo.ToString() + i.ToString())
        '            'PageNo.CommandArgument = i.ToString()
        '            'AddHandler PageNo.Click, AddressOf PageNo_Click
        '            'buttonPagerRow.Cells(0).Controls.Add(PageNo)

        '            Dim PageNo As New LinkButton()
        '            PageNo.Text = Convert.ToString((i - 4) + 1)
        '            PageNo.ID = (PageNo.ToString() + i.ToString())
        '            PageNo.CommandArgument = (i - 4).ToString()
        '            AddHandler PageNo.Click, AddressOf PageNo_Click
        '            buttonPagerRow.Cells(0).Controls.Add(PageNo)
        '        End If
        '    End If
        'Next i

        ''加入"往後10頁"
        'If ((GridView1.PageCount - nowPage) <= 9) Then
        'Else
        '    Dim pageNTen As New LinkButton()
        '    pageNTen.Text = "|next 10 pages >>"
        '    pageNTen.ID = pageNTen.ToString + "nTen"
        '    pageNTen.CommandArgument = nTen
        '    AddHandler pageNTen.Click, AddressOf PageNTen_Click
        '    buttonPagerRow.Cells(0).Controls.Add(pageNTen)
        'End If

        'botton.Text = "Page " & (GridView1.PageIndex + 1) & " of " & GridView1.PageCount.ToString

    End Sub

    Protected Sub PageNo_Click(ByVal sender As Object, ByVal e As EventArgs)

        GridView1.PageIndex = CType(CType(sender, LinkButton).CommandArgument, Integer)

    End Sub

    Protected Sub PagePTen_Click(ByVal sender As Object, ByVal e As EventArgs)

        GridView1.PageIndex = CType(CType(sender, LinkButton).CommandArgument, Integer)

    End Sub



    Protected Sub PageNTen_Click(ByVal sender As Object, ByVal e As EventArgs)

        GridView1.PageIndex = CType(CType(sender, LinkButton).CommandArgument, Integer)

    End Sub




End Class
