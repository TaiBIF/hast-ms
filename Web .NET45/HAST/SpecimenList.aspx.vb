Imports System.Web.Configuration
Imports System.Drawing
Imports System.Data
Imports System.Data.SqlClient
Imports HAST

Partial Class HAST_SpecimenList
    Inherits System.Web.UI.Page

    Dim intDataCount As Integer



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Try

            SDSSpecimensList.ConnectionString = WebConfigurationManager.ConnectionStrings("HASTDBConnectionString").ConnectionString
            SDSSpecimensList.SelectCommandType = SqlDataSourceCommandType.StoredProcedure



          
            SDSSpecimensList.SelectCommand = "prSpecimensList"
                    HyperLinkRequery.NavigateUrl = "~/Specimens/SpecimenQueryC.aspx"


     



            '檢查是否有不合法字元

            


            If Not IsPostBack Then

                'GridView1.AllowSorting = True

                'Dim strCheckInput() As String = {}

                

                setGridViewStyle()
                'setFields()



                GridViewSpecimens.DataSourceID = SDSSpecimensList.ID



            End If




            '由於TemplateField不支援回呼calback，所以callback後就不在cache中，要重新設定
            '故把setField放在Not IsPostBack 判斷式外
            GridViewSpecimens.Columns.Clear()
            setFields()


            'GridView1.DataSourceID = SDSSpecimensList.ID


            GridViewSpecimens.DataBind()


        Catch ex As SqlException

            Response.Write("File not found!")

        Catch ex As Exception

            Response.Write("File not found!")


        End Try







    End Sub



    Protected Sub setGridViewStyle()    '設定Gridview外觀樣式

        GridViewSpecimens.AutoGenerateColumns = False

        ' 設定Row的鍵值
        Dim KeyNames() As String = {"listID"}
        GridViewSpecimens.DataKeyNames = KeyNames

        ' 設定Gridviewspeciemn的屬性
        GridViewSpecimens.AllowSorting = True
        GridViewSpecimens.Font.Size = 10
        GridViewSpecimens.GridLines = GridLines.Both
        GridViewSpecimens.AllowPaging = True
        GridViewSpecimens.PageSize = 20


        '非同步callback模式
        GridViewSpecimens.EnableSortingAndPagingCallbacks = False

        '分頁位置
        GridViewSpecimens.PagerSettings.Position = PagerPosition.Bottom
        '分頁對齊
        GridViewSpecimens.PagerStyle.HorizontalAlign = HorizontalAlign.Center
        '分頁模式
        GridViewSpecimens.PagerSettings.Mode = PagerButtons.NextPreviousFirstLast
        '分頁按鈕圖形
        GridViewSpecimens.PagerSettings.FirstPageImageUrl = "~/images/btnFirst.gif"
        GridViewSpecimens.PagerSettings.PreviousPageImageUrl = "~/images/btnPrevious.gif"
        GridViewSpecimens.PagerSettings.NextPageImageUrl = "~/images/btnNext.gif"
        GridViewSpecimens.PagerSettings.LastPageImageUrl = "~/images/btnLast.gif"


        '
        'GridViewSpecimens.HeaderStyle.BackColor = Color.Tan
        GridViewSpecimens.HeaderStyle.CssClass = "specimen_list_header"

        'GridViewSpecimens.RowStyle.BackColor = Color.LightGoldenrodYellow
        GridViewSpecimens.RowStyle.CssClass = "specimen_list_row"
        GridViewSpecimens.AlternatingRowStyle.CssClass = "specimen_list_alterrow"
        GridViewSpecimens.PagerStyle.CssClass = "specimen_list_pager"
        'GridViewSpecimens.AlternatingRowStyle.BackColor = Color.PaleGoldenrod
        'GridViewSpecimens.HeaderStyle.ForeColor = Color.Black
        'GridViewSpecimens.PagerStyle.BackColor = Color.Goldenrod
        '設定選擇列顏色
        GridViewSpecimens.SelectedRowStyle.BackColor = Color.LightBlue

    End Sub


    Private Sub setFields()




        ' 建立HyperLinkField
        Dim specimenOrderNumField As New HyperLinkField
        ' 建立設定DataNavigateUrlFields值之字串陣列
        Dim strSpecimenOrderNum As String() = New String() {"specimenOrderNum"}

        specimenOrderNumField.DataTextField = "specimenOrderNum"
        specimenOrderNumField.DataNavigateUrlFields = strSpecimenOrderNum
        specimenOrderNumField.DataNavigateUrlFormatString = "~/Specimens/SpecimenDetailC.aspx?specimenOrderNum={0}"
        specimenOrderNumField.Target = "_blank"
        specimenOrderNumField.HeaderText = "館號"
        specimenOrderNumField.SortExpression = "specimenOrderNum"
        specimenOrderNumField.ItemStyle.Width = "50"



        Dim SNField As New HyperLinkField
        If Session("RequestPage") = "HastQuery" Then

            ' 建立設定DataNavigateUrlFields值之字串陣列
            Dim strSN As String() = New String() {"SN"}

            SNField.DataTextField = "SN"
            SNField.DataNavigateUrlFields = strSN
            SNField.DataNavigateUrlFormatString = "~/Specimens/SpecimenDetailC.aspx?SN={0}"
            SNField.HeaderText = "系統ID"
            SNField.SortExpression = "SN"
            SNField.Target = "_Blank"
        End If




        ' 建立BoundField
        Dim elevationField As New BoundField


        elevationField.DataField = "elevation"
        elevationField.HeaderText = "海拔(m)"
        elevationField.ItemStyle.Wrap = True '換行
        elevationField.ItemStyle.HorizontalAlign = HorizontalAlign.Right
        elevationField.SortExpression = "alt"
        elevationField.ItemStyle.Width = "45"


        ' 建立TemplateField
        Dim templateFieldFamily As New TemplateField
        Dim templateFieldGenus As New TemplateField
        Dim templateFieldSpecies As New TemplateField
        Dim templateFieldCollector As New TemplateField
        Dim templateFieldLocation As New TemplateField

        Dim templateFieldImageFile As New TemplateField
        Dim templateFieldGPSInfo As New TemplateField





        templateFieldFamily.ItemTemplate = New GridViewTemplate(DataControlRowType.DataRow, "Family")
        templateFieldGenus.ItemTemplate = New GridViewTemplate(DataControlRowType.DataRow, "Genus")
        templateFieldSpecies.ItemTemplate = New GridViewTemplate(DataControlRowType.DataRow, "Species")
        templateFieldCollector.ItemTemplate = New GridViewTemplate(DataControlRowType.DataRow, "Collector")
        templateFieldLocation.ItemTemplate = New GridViewTemplate(DataControlRowType.DataRow, "Location")
        templateFieldImageFile.ItemTemplate = New GridViewTemplate(DataControlRowType.DataRow, "ImageFile")
        templateFieldGPSInfo.ItemTemplate = New GridViewTemplate(DataControlRowType.DataRow, "GPSInfo")

        templateFieldFamily.HeaderText = "科名"
        templateFieldFamily.SortExpression = "verFamilyE"

        templateFieldGenus.HeaderText = "屬名"
        templateFieldGenus.SortExpression = "verGenusE"

        templateFieldSpecies.HeaderText = "學名 / 中文名"
        templateFieldSpecies.SortExpression = "verSpeciesE"
        templateFieldSpecies.ItemStyle.Width = "260"

        templateFieldCollector.HeaderText = "採集者"
        templateFieldCollector.SortExpression = "collectionFLNo"
        templateFieldCollector.ItemStyle.Width = "150"

        templateFieldLocation.HeaderText = "採集地點"
        templateFieldLocation.ItemStyle.Width = "80"

        templateFieldGPSInfo.HeaderText = "GPS Info."
        templateFieldGPSInfo.ItemStyle.Width = "85"
        templateFieldGPSInfo.ItemStyle.HorizontalAlign = HorizontalAlign.Left



        '將欄位加入GridView
        GridViewSpecimens.Columns.Add(specimenOrderNumField)

        If Session("RequestPage") = "HastQuery" Then
            GridViewSpecimens.Columns.Add(SNField)
        End If


        GridViewSpecimens.Columns.Add(templateFieldImageFile)

        GridViewSpecimens.Columns.Add(templateFieldFamily)
        GridViewSpecimens.Columns.Add(templateFieldGenus)
        GridViewSpecimens.Columns.Add(templateFieldSpecies)
        GridViewSpecimens.Columns.Add(templateFieldCollector)
        GridViewSpecimens.Columns.Add(templateFieldLocation)


        GridViewSpecimens.Columns.Add(elevationField)
        GridViewSpecimens.Columns.Add(templateFieldGPSInfo)


    End Sub

    Public Class GridViewTemplate
        Implements ITemplate

        Private templateType As DataControlRowType
        Private columnName As String

        Public Sub New(ByVal type As DataControlRowType, ByVal colname As String)
            templateType = type
            columnName = colname
        End Sub


        Public Sub InstantiateIn(ByVal Container As System.Web.UI.Control) Implements System.Web.UI.ITemplate.InstantiateIn

            If (templateType = DataControlRowType.DataRow) Then
                '建立樣板欄位型態
                'Dim labelFamilyE As New Label()
                'Dim labelFamilyC As New Label()
                'Dim labelgenusE As New Label()
                'Dim labelgenusC As New Label()
                'Dim labelSpecies As New Label()
                'Dim labelCollectionNum As New Label()
                'Dim labelNameC As New Label()
                'Dim labelCollectionDate As New Label()
                Dim litFamily As New Literal()
                Dim litGenus As New Literal()
                Dim litSpecies As New Literal()
                Dim litCollector As New Literal()
                Dim litLocation As New Literal()

                Dim hyperLinkImageFile As New HyperLink
                Dim litGPSInfo As New Literal()

                '指定樣板欄位的資料繫結事件
                Select Case columnName

                    Case "Family"
                        'AddHandler labelFamilyE.DataBinding, AddressOf Me.familyE_DataBinding
                        'container.Controls.Add(labelFamilyE)
                        AddHandler litFamily.DataBinding, AddressOf Me.family_DataBinding
                        Container.Controls.Add(litFamily)
                    Case "Genus"
                        AddHandler litGenus.DataBinding, AddressOf Me.genus_DataBinding
                        Container.Controls.Add(litGenus)
                    Case "Species"
                        AddHandler litSpecies.DataBinding, AddressOf Me.species_DataBinding
                        Container.Controls.Add(litSpecies)
                    Case "Collector"
                        AddHandler litCollector.DataBinding, AddressOf Me.collector_DataBinding
                        Container.Controls.Add(litCollector)
                    Case "Location"
                        AddHandler litLocation.DataBinding, AddressOf Me.location_DataBinding
                        Container.Controls.Add(litLocation)
                    Case "ImageFile"
                        AddHandler hyperLinkImageFile.DataBinding, AddressOf Me.imageFile_DataBinding
                        Container.Controls.Add(hyperLinkImageFile)

                    Case "GPSInfo"
                        AddHandler litGPSInfo.DataBinding, AddressOf Me.GPSInfo_DataBinding
                        Container.Controls.Add(litGPSInfo)

                End Select

            End If
        End Sub


        ' 樣板的DataBind
        Protected Sub family_DataBinding(ByVal sender As Object, ByVal e As EventArgs)

            '   Dim labelFamilyE As Label = CType(sender, Label)
            '  Dim labelFamilyC As Label = CType(sender, Label)
            Dim litFamily As Literal = CType(sender, Literal)
            '取得GridViewRow(包含Label控制項)
            'Dim row As GridViewRow = CType(labelFamilyE.NamingContainer, GridViewRow)
            Dim row As GridViewRow = CType(litFamily.NamingContainer, GridViewRow)
            '取得資料繫結
            litFamily.Text = DataBinder.Eval(row.DataItem, "verFamilyE").ToString & _
                  " <br />" & DataBinder.Eval(row.DataItem, "verFamilyC").ToString
        End Sub

        Protected Sub genus_DataBinding(ByVal sender As Object, ByVal e As EventArgs)

            Dim litGenus As Literal = CType(sender, Literal)
            Dim row As GridViewRow = CType(litGenus.NamingContainer, GridViewRow)
            '取得資料繫結
            litGenus.Text = DataBinder.Eval(row.DataItem, "verGenusE").ToString & _
                  " <br />" & DataBinder.Eval(row.DataItem, "verGenusC").ToString

        End Sub

        Protected Sub species_DataBinding(ByVal sender As Object, ByVal e As EventArgs)

            Dim litSpecies As Literal = CType(sender, Literal)
            Dim row As GridViewRow = CType(litSpecies.NamingContainer, GridViewRow)
            '取得資料繫結
            litSpecies.Text = DataBinder.Eval(row.DataItem, "verSpeciesE").ToString & _
                  " <br />" & DataBinder.Eval(row.DataItem, "verSpeciesC").ToString

        End Sub

        Protected Sub collector_DataBinding(ByVal sender As Object, ByVal e As EventArgs)

            Dim litCollector As Literal = CType(sender, Literal)
            Dim row As GridViewRow = CType(litCollector.NamingContainer, GridViewRow)
            '取得資料繫結
            litCollector.Text = DataBinder.Eval(row.DataItem, "collectionFLNo").ToString & _
                    "<br />" & DataBinder.Eval(row.DataItem, "nameC").ToString & _
                    "&nbsp;" & String.Format("{0:d}", DataBinder.Eval(row.DataItem, "collectionDate"))
            '  "<br />" & Format(DataBinder.Eval(row.DataItem, "collectionDate").ToString, "{0:dd-MMM-yyyy}")


        End Sub

        Protected Sub location_DataBinding(ByVal sender As Object, ByVal e As EventArgs)

            Dim litLocation As Literal = CType(sender, Literal)
            Dim row As GridViewRow = CType(litLocation.NamingContainer, GridViewRow)
            '取得資料繫結



            Select Case HttpContext.Current.Session("RequestPage")
                Case "HastQuery"
                    litLocation.Text = DataBinder.Eval(row.DataItem, "countryC").ToString & _
                                     " <br />" & DataBinder.Eval(row.DataItem, "districtC").ToString & _
                                     " <br />" & DataBinder.Eval(row.DataItem, "localityDescC").ToString & _
                                     " <br />" & DataBinder.Eval(row.DataItem, "localityDescE").ToString
                Case Else
                    litLocation.Text = DataBinder.Eval(row.DataItem, "countryC").ToString & _
                                     " <br />" & DataBinder.Eval(row.DataItem, "districtC").ToString
            End Select



        End Sub

        Protected Sub imageFile_DataBinding(ByVal sender As Object, ByVal e As EventArgs)

            Dim hyperLinkImageFile As HyperLink = CType(sender, HyperLink)
            Dim row As GridViewRow = CType(hyperLinkImageFile.NamingContainer, GridViewRow)



            Dim strHyperLinkImage As String = ""
            '取得資料繫結


            If Not (DataBinder.Eval(row.DataItem, "imageFile").ToString) = "" Then

                strHyperLinkImage = "http://gissrv1.sinica.edu.tw/lizardtech/iserv/calcrgn?cat=plant_sid&item=S_"
                strHyperLinkImage = strHyperLinkImage & DataBinder.Eval(row.DataItem, "imageFile").ToString.PadLeft(6, "0")
                strHyperLinkImage = strHyperLinkImage & ".SID&style=default/view.xsl&wid=800&hei=800&browser=win_ns6&plugin=false"

                'hyperLinkImageFile.Text = "image"
                hyperLinkImageFile.ImageUrl = "~/images/specimens_icon40.png"
                hyperLinkImageFile.ToolTip = "Image of specimen"
                hyperLinkImageFile.NavigateUrl = strHyperLinkImage
                hyperLinkImageFile.Target = "_blank"

            End If




        End Sub

        Protected Sub GPSInfo_DataBinding(ByVal sender As Object, ByVal e As EventArgs)

            Dim litGPSInfo As Literal = CType(sender, Literal)
            Dim row As GridViewRow = CType(litGPSInfo.NamingContainer, GridViewRow)

            If Not (DataBinder.Eval(row.DataItem, "WGS84Lng").ToString) = "" Then

                litGPSInfo.Text = LatitudeDMS(DataBinder.Eval(row.DataItem, "WGS84Lat")) + ", " + LongitudeDMS(DataBinder.Eval(row.DataItem, "WGS84Lng"))
            End If

        End Sub


    End Class


    Protected Sub GridViewSpecimens_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewSpecimens.DataBound

        'LabelDataCount.Text = intDataCount.ToString

        '顯示目前分頁索引
        Dim buttonPagerRow As GridViewRow = GridViewSpecimens.BottomPagerRow

        If buttonPagerRow Is Nothing Then
            Exit Sub '假如沒有按鈕列，則離開按鈕建立程序
        Else

            buttonPagerRow.CssClass = "pagerRow"

            'Dim bottonPagerNo As New Label()
            'bottonPagerNo.Text = "Page " & (GridView1.PageIndex + 1) & " of " & GridView1.PageCount.ToString

            Dim myLiteral As New Literal()
            myLiteral.Text = "Page " & (GridViewSpecimens.PageIndex + 1) & " of " & GridViewSpecimens.PageCount.ToString
            myLiteral.Text = myLiteral.Text & "<BR />"

            buttonPagerRow.Cells(0).Controls.Add(myLiteral)

            '動態建立數字分頁按鈕
            'Dim i As Integer
            Dim nowPage As Integer

            nowPage = GridViewSpecimens.PageIndex

            Dim pTen, nTen As Integer 'pTen:前10頁  nTen:後10頁
            If (nowPage - 9) > 0 Then
                pTen = nowPage - 10
                If (GridViewSpecimens.PageCount - nowPage) < 9 Then
                    nTen = GridViewSpecimens.PageCount
                Else
                    nTen = nowPage + 10
                End If
            Else
                pTen = 0
                If (GridViewSpecimens.PageCount - nowPage) < 9 Then
                    nTen = GridViewSpecimens.PageCount
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

            If GridViewSpecimens.PageCount <= 10 Then

                For k = 0 To (GridViewSpecimens.PageCount - 1) '取第1頁至總頁面數
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

                    If k < GridViewSpecimens.PageCount Then
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
            'If ((GridViewSpecimens.PageCount - nowPage) <= 9) Then
            If (GridViewSpecimens.PageCount - (x * 10)) > 10 Then
                Dim pageNTen As New LinkButton()
                pageNTen.Text = "|next 10 pages >>"
                pageNTen.ID = pageNTen.ToString + "nTen"
                pageNTen.CommandArgument = nTen
                AddHandler pageNTen.Click, AddressOf PageNTen_Click
                buttonPagerRow.Cells(0).Controls.Add(pageNTen)
            End If


        End If


        'For i = (nowPage + 0) To (nowPage + 9)
        'For i = 0 To GridView1.PageCount - 1
        'Dim PageNo As New LinkButton()


        'If (i + 10) > GridViewSpecimens.PageCount Then '假如現在頁面+10比總頁數多
        '    Dim j As Integer
        '    For j = (GridViewSpecimens.PageCount - 10) To (GridViewSpecimens.PageCount - 1) '取最後10頁
        '        If GridViewSpecimens.PageCount < 10 Then '假如總頁面<10

        '            Dim k As Integer
        '            For k = 0 To (GridViewSpecimens.PageCount - 1) '取第1頁至總頁面數
        '                Dim PageNo As New LinkButton()
        '                PageNo.Text = Convert.ToString(k + 1)
        '                PageNo.ID = (PageNo.ToString() + k.ToString())
        '                PageNo.CommandArgument = k.ToString()
        '                AddHandler PageNo.Click, AddressOf PageNo_Click
        '                buttonPagerRow.Cells(0).Controls.Add(PageNo)
        '            Next k
        '            Exit For
        '        Else
        '            Dim PageNo As New LinkButton()
        '            PageNo.Text = Convert.ToString(j + 1)
        '            PageNo.ID = (PageNo.ToString() + j.ToString())
        '            PageNo.CommandArgument = j.ToString()
        '            AddHandler PageNo.Click, AddressOf PageNo_Click
        '            buttonPagerRow.Cells(0).Controls.Add(PageNo)
        '        End If
        '    Next j
        '    Exit For
        'Else





        'If i <= 4 Then '假如頁碼在1-5頁

        '    Dim k As Integer
        '    For k = 0 To 9 '(GridViewspcimens.PageCount - 1) '取第1頁至總頁面數
        '        Dim PageNo As New LinkButton()
        '        PageNo.Text = Convert.ToString(k + 1)
        '        PageNo.ID = (PageNo.ToString() + k.ToString())
        '        PageNo.CommandArgument = k.ToString()
        '        AddHandler PageNo.Click, AddressOf PageNo_Click
        '        buttonPagerRow.Cells(0).Controls.Add(PageNo)
        '    Next k
        '    Exit For


        'Else '假如頁碼在5頁以後，開始動，但將本頁保持在中間

        '    'Dim PageNo As New LinkButton()
        '    'PageNo.Text = Convert.ToString(i + 1)
        '    'PageNo.ID = (PageNo.ToString() + i.ToString())
        '    'PageNo.CommandArgument = i.ToString()
        '    'AddHandler PageNo.Click, AddressOf PageNo_Click
        '    'buttonPagerRow.Cells(0).Controls.Add(PageNo)

        '    Dim PageNo As New LinkButton()
        '    PageNo.Text = Convert.ToString((i - 4) + 1)
        '    PageNo.ID = (PageNo.ToString() + i.ToString())
        '    PageNo.CommandArgument = (i - 4).ToString()
        '    AddHandler PageNo.Click, AddressOf PageNo_Click
        '    buttonPagerRow.Cells(0).Controls.Add(PageNo)
        'End If
        'End If

        ' Next i



    End Sub


    Protected Sub PageNo_Click(ByVal sender As Object, ByVal e As EventArgs)

        GridViewSpecimens.PageIndex = CType(CType(sender, LinkButton).CommandArgument, Integer)

    End Sub


    Protected Sub PagePTen_Click(ByVal sender As Object, ByVal e As EventArgs)

        GridViewSpecimens.PageIndex = CType(CType(sender, LinkButton).CommandArgument, Integer)

    End Sub



    Protected Sub PageNTen_Click(ByVal sender As Object, ByVal e As EventArgs)

        GridViewSpecimens.PageIndex = CType(CType(sender, LinkButton).CommandArgument, Integer)

    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged

        If DropDownList1.SelectedValue = 0 Then
            GridViewSpecimens.PageSize = intDataCount
        Else
            '            GridViewSpecimens.AllowPaging = True
            GridViewSpecimens.PageSize = DropDownList1.SelectedValue
        End If


    End Sub

    Protected Sub SDSSpecimensList_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SDSSpecimensList.Selected

        intDataCount = e.AffectedRows

    End Sub


End Class
