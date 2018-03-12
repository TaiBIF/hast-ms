Imports System.Web.Configuration
Imports System.Drawing
Imports System.Data
Imports System.Data.SqlClient
Imports HAST


Partial Class HAST_QuickSearchResultC
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        SDSSpecimensList.ConnectionString = WebConfigurationManager.ConnectionStrings("HASTDBConnectionString").ConnectionString
        SDSSpecimensList.SelectCommandType = SqlDataSourceCommandType.StoredProcedure


        Dim strPlantName As String = Request.QueryString("plantName")

        strPlantName = Server.UrlDecode(strPlantName)



        If Not IsPostBack Then

            'GridView1.AllowSorting = True

            'Dim strCheckInput() As String = {}

            Dim intErrorCharSum As Integer = 0

            If strPlantName <> "" Then
                intErrorCharSum = checkChar(strPlantName)
            End If



            If intErrorCharSum >= 0 Then


                If strPlantName <> "" Then


                    Dim paramplantName As New QueryStringParameter("plantName", TypeCode.String, "plantName")
                    paramplantName.Direction = Data.ParameterDirection.Input
                    SDSSpecimensList.SelectParameters.Add(paramplantName)

                    SDSSpecimensList.SelectCommand = "prTaxonNameQuery"

                End If


            End If



            'GridViewSpecimens.HeaderStyle.BackColor = Color.Tan
            GridView1.HeaderStyle.CssClass = "specimen_list_header"

            'GridViewSpecimens.RowStyle.BackColor = Color.LightGoldenrodYellow
            GridView1.RowStyle.CssClass = "specimen_list_row"
            GridView1.AlternatingRowStyle.CssClass = "specimen_list_alterrow"
            GridView1.PagerStyle.CssClass = "specimen_list_pager"
            'GridViewSpecimens.AlternatingRowStyle.BackColor = Color.PaleGoldenrod
            'GridViewSpecimens.HeaderStyle.ForeColor = Color.Black
            'GridViewSpecimens.PagerStyle.BackColor = Color.Goldenrod
            '設定選擇列顏色
            GridView1.SelectedRowStyle.BackColor = Color.LightBlue


        End If
        GridView1.DataSource = SDSSpecimensList

        setFields()

        GridView1.DataBind()


    End Sub

    Private Sub setFields()





        ' 建立TemplateField
        'Dim templateFieldFamily As New TemplateField
        'Dim templateFieldGenus As New TemplateField
        'Dim templateFieldSpecies As New TemplateField
        'Dim templateFieldCollector As New TemplateField
        'Dim templateFieldLocation As New TemplateField

        Dim templateFieldSpecimens As New TemplateField
        Dim templateFieldImages As New TemplateField
        'Dim templateFieldGPSInfo As New TemplateField





        'templateFieldFamily.ItemTemplate = New GridViewTemplate(DataControlRowType.DataRow, "Family")
        'templateFieldGenus.ItemTemplate = New GridViewTemplate(DataControlRowType.DataRow, "Genus")
        'templateFieldSpecies.ItemTemplate = New GridViewTemplate(DataControlRowType.DataRow, "Species")
        'templateFieldCollector.ItemTemplate = New GridViewTemplate(DataControlRowType.DataRow, "Collector")
        'templateFieldLocation.ItemTemplate = New GridViewTemplate(DataControlRowType.DataRow, "Location")
        templateFieldSpecimens.ItemTemplate = New GridViewTemplate(DataControlRowType.DataRow, "specimens")
        templateFieldImages.ItemTemplate = New GridViewTemplate(DataControlRowType.DataRow, "images")
        'templateFieldGPSInfo.ItemTemplate = New GridViewTemplate(DataControlRowType.DataRow, "GPSInfo")

        templateFieldSpecimens.HeaderText = "標本"
        templateFieldImages.HeaderText = "生態影像"

        'templateFieldFamily.HeaderText = "科名"
        'templateFieldFamily.SortExpression = "verFamilyE"

        'templateFieldGenus.HeaderText = "屬名"
        'templateFieldGenus.SortExpression = "verGenusE"

        'templateFieldSpecies.HeaderText = "學名 / 中文名"
        'templateFieldSpecies.SortExpression = "verSpeciesE"
        'templateFieldSpecies.ItemStyle.Width = "260"

        'templateFieldCollector.HeaderText = "採集者"
        'templateFieldCollector.SortExpression = "collectionFLNo"
        'templateFieldCollector.ItemStyle.Width = "150"

        'templateFieldLocation.HeaderText = "採集地點"
        'templateFieldLocation.ItemStyle.Width = "80"

        'templateFieldGPSInfo.HeaderText = "GPS Info."
        'templateFieldGPSInfo.ItemStyle.Width = "85"
        'templateFieldGPSInfo.ItemStyle.HorizontalAlign = HorizontalAlign.Left



        '將欄位加入GridView


        GridView1.Columns.Add(templateFieldSpecimens)
        GridView1.Columns.Add(templateFieldImages)



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
                'Dim litFamily As New Literal()
                'Dim litGenus As New Literal()
                'Dim litSpecies As New Literal()
                'Dim litCollector As New Literal()
                'Dim litLocation As New Literal()

                Dim hyperLinkImages As New HyperLink
                Dim hyperLinkSpecimens As New HyperLink
                'Dim litGPSInfo As New Literal()

                '指定樣板欄位的資料繫結事件
                Select Case columnName

                    'Case "Family"
                    '    'AddHandler labelFamilyE.DataBinding, AddressOf Me.familyE_DataBinding
                    '    'container.Controls.Add(labelFamilyE)
                    '    AddHandler litFamily.DataBinding, AddressOf Me.family_DataBinding
                    '    Container.Controls.Add(litFamily)
                    'Case "Genus"
                    '    AddHandler litGenus.DataBinding, AddressOf Me.genus_DataBinding
                    '    Container.Controls.Add(litGenus)
                    'Case "Species"
                    '    AddHandler litSpecies.DataBinding, AddressOf Me.species_DataBinding
                    '    Container.Controls.Add(litSpecies)
                    'Case "Collector"
                    '    AddHandler litCollector.DataBinding, AddressOf Me.collector_DataBinding
                    '    Container.Controls.Add(litCollector)
                    'Case "Location"
                    '    AddHandler litLocation.DataBinding, AddressOf Me.location_DataBinding
                    '    Container.Controls.Add(litLocation)
                    Case "images"
                        AddHandler hyperLinkImages.DataBinding, AddressOf Me.images_DataBinding
                        Container.Controls.Add(hyperLinkImages)

                    Case "specimens"
                        AddHandler hyperLinkSpecimens.DataBinding, AddressOf Me.specimens_DataBinding
                        Container.Controls.Add(hyperLinkSpecimens)
                        'Case "GPSInfo"
                        '    AddHandler litGPSInfo.DataBinding, AddressOf Me.GPSInfo_DataBinding
                        '    Container.Controls.Add(litGPSInfo)

                End Select

            End If
        End Sub


        '' 樣板的DataBind
        'Protected Sub family_DataBinding(ByVal sender As Object, ByVal e As EventArgs)

        '    '   Dim labelFamilyE As Label = CType(sender, Label)
        '    '  Dim labelFamilyC As Label = CType(sender, Label)
        '    Dim litFamily As Literal = CType(sender, Literal)
        '    '取得GridViewRow(包含Label控制項)
        '    'Dim row As GridViewRow = CType(labelFamilyE.NamingContainer, GridViewRow)
        '    Dim row As GridViewRow = CType(litFamily.NamingContainer, GridViewRow)
        '    '取得資料繫結
        '    litFamily.Text = DataBinder.Eval(row.DataItem, "verFamilyE").ToString & _
        '          " <br />" & DataBinder.Eval(row.DataItem, "verFamilyC").ToString
        'End Sub

        'Protected Sub genus_DataBinding(ByVal sender As Object, ByVal e As EventArgs)

        '    Dim litGenus As Literal = CType(sender, Literal)
        '    Dim row As GridViewRow = CType(litGenus.NamingContainer, GridViewRow)
        '    '取得資料繫結
        '    litGenus.Text = DataBinder.Eval(row.DataItem, "verGenusE").ToString & _
        '          " <br />" & DataBinder.Eval(row.DataItem, "verGenusC").ToString

        'End Sub

        'Protected Sub species_DataBinding(ByVal sender As Object, ByVal e As EventArgs)

        '    Dim litSpecies As Literal = CType(sender, Literal)
        '    Dim row As GridViewRow = CType(litSpecies.NamingContainer, GridViewRow)
        '    '取得資料繫結
        '    litSpecies.Text = DataBinder.Eval(row.DataItem, "verSpeciesE").ToString & _
        '          " <br />" & DataBinder.Eval(row.DataItem, "verSpeciesC").ToString

        'End Sub

        'Protected Sub collector_DataBinding(ByVal sender As Object, ByVal e As EventArgs)

        '    Dim litCollector As Literal = CType(sender, Literal)
        '    Dim row As GridViewRow = CType(litCollector.NamingContainer, GridViewRow)
        '    '取得資料繫結
        '    litCollector.Text = DataBinder.Eval(row.DataItem, "collectionFLNo").ToString & _
        '            "<br />" & DataBinder.Eval(row.DataItem, "nameC").ToString & _
        '            "&nbsp;" & String.Format("{0:d}", DataBinder.Eval(row.DataItem, "collectionDate"))
        '    '  "<br />" & Format(DataBinder.Eval(row.DataItem, "collectionDate").ToString, "{0:dd-MMM-yyyy}")


        'End Sub

        'Protected Sub location_DataBinding(ByVal sender As Object, ByVal e As EventArgs)

        '    Dim litLocation As Literal = CType(sender, Literal)
        '    Dim row As GridViewRow = CType(litLocation.NamingContainer, GridViewRow)
        '    '取得資料繫結



        '    Select Case HttpContext.Current.Session("RequestPage")
        '        Case "HastQuery"
        '            litLocation.Text = DataBinder.Eval(row.DataItem, "countryC").ToString & _
        '                             " <br />" & DataBinder.Eval(row.DataItem, "districtC").ToString & _
        '                             " <br />" & DataBinder.Eval(row.DataItem, "localityDescC").ToString & _
        '                             " <br />" & DataBinder.Eval(row.DataItem, "localityDescE").ToString
        '        Case Else
        '            litLocation.Text = DataBinder.Eval(row.DataItem, "countryC").ToString & _
        '                             " <br />" & DataBinder.Eval(row.DataItem, "districtC").ToString
        '    End Select



        'End Sub

        Protected Sub images_DataBinding(ByVal sender As Object, ByVal e As EventArgs)

            Dim hyperLinkImages As HyperLink = CType(sender, HyperLink)
            Dim row As GridViewRow = CType(hyperLinkImages.NamingContainer, GridViewRow)

            Dim strHyperLinkImages As String = ""

            '取得資料繫結


            If (DataBinder.Eval(row.DataItem, "images").ToString) <> "1" Then

                strHyperLinkImages = "~/Photo/ImageHierarchicalC.aspx?familyID="
                strHyperLinkImages += DataBinder.Eval(row.DataItem, "familyID").ToString + "&genusID="
                strHyperLinkImages += DataBinder.Eval(row.DataItem, "genusID").ToString + "&speciesID="
                strHyperLinkImages += DataBinder.Eval(row.DataItem, "speciesID").ToString


                'hyperLinkImageFile.Text = "image"
                hyperLinkImages.ImageUrl = "~/images/leave_40.gif"
                hyperLinkImages.ToolTip = "Images of species"
                hyperLinkImages.NavigateUrl = strHyperLinkImages
                hyperLinkImages.Target = "_blank"

            End If


        End Sub


        Protected Sub specimens_DataBinding(ByVal sender As Object, ByVal e As EventArgs)

            Dim hyperLinkSpecimens As HyperLink = CType(sender, HyperLink)
            Dim row As GridViewRow = CType(hyperLinkSpecimens.NamingContainer, GridViewRow)

            Dim strHyperLinkSpecimens As String = ""

            If (DataBinder.Eval(row.DataItem, "specimens").ToString) <> "0" Then

                strHyperLinkSpecimens = "~/Specimens/SpecimenListC.aspx?speciesID="
                strHyperLinkSpecimens = strHyperLinkSpecimens & DataBinder.Eval(row.DataItem, "speciesID").ToString


                'hyperLinkImageFile.Text = "image"
                hyperLinkSpecimens.ImageUrl = "~/images/specimens_icon40.png"
                hyperLinkSpecimens.ToolTip = "Specimens of species"
                hyperLinkSpecimens.NavigateUrl = strHyperLinkSpecimens
                hyperLinkSpecimens.Target = "_blank"

            End If

        End Sub

        'Protected Sub GPSInfo_DataBinding(ByVal sender As Object, ByVal e As EventArgs)

        '    Dim litGPSInfo As Literal = CType(sender, Literal)
        '    Dim row As GridViewRow = CType(litGPSInfo.NamingContainer, GridViewRow)

        '    If Not (DataBinder.Eval(row.DataItem, "WGS84Lng").ToString) = "" Then

        '        litGPSInfo.Text = LatitudeDMS(DataBinder.Eval(row.DataItem, "WGS84Lat")) + ", " + LongitudeDMS(DataBinder.Eval(row.DataItem, "WGS84Lng"))
        '    End If

        'End Sub


    End Class

End Class
