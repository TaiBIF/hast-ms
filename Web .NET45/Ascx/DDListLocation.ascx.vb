Imports System.Web.Configuration
Imports System.Data

Partial Class Ascx_DDListLocation
    Inherits System.Web.UI.UserControl

    Dim dv As New DataView
    Dim SDSSql As New SqlDataSource
    Dim strConnectionstring As String
    Private _language As String

    Public Sub Reset()

        DDListCountry.SelectedValue = ""
        DDListProvince.SelectedValue = ""
        DDListHsien.SelectedValue = ""
        DDListTown.SelectedValue = ""
        DDListPark.SelectedValue = ""

        DDListCountry.Items.Clear()
        DDListProvince.Items.Clear()
        DDListHsien.Items.Clear()
        DDListTown.Items.Clear()

        FillCountryList()

    End Sub

    Public Property language() As String '設定頁面語言
        Get
            Select Case Right((Request.FilePath), 6).ToLower
                Case "e.aspx"
                    _language = "En"
                Case Else
                    _language = "Ch"
            End Select
            Return _language
        End Get
        Set(ByVal value As String)

        End Set
    End Property


    Public Property countryNo() As String
        Get
            Return DDListCountry.SelectedValue
        End Get
        Set(ByVal value As String)
            DDListCountry.SelectedValue = value
        End Set
    End Property

    Public Property provinceNo() As String
        Get
            Return DDListProvince.SelectedValue
        End Get
        Set(ByVal value As String)
            DDListProvince.SelectedValue = value
        End Set
    End Property

    Public Property hsienNo() As String
        Get
            Return DDListHsien.SelectedValue
        End Get
        Set(ByVal value As String)
            DDListTown.SelectedValue = value
        End Set
    End Property


    Public Property townNo() As String
        Get
            Return DDListTown.SelectedValue
        End Get
        Set(ByVal value As String)
            DDListTown.SelectedValue = value
        End Set
    End Property

    Public Property parkNo() As String
        Get
            Return DDListPark.SelectedValue
        End Get
        Set(ByVal value As String)
            DDListPark.SelectedValue = value
        End Set
    End Property



    Private Sub DBConnection()

        strConnectionstring = WebConfigurationManager.ConnectionStrings("HASTDBConnectionString").ConnectionString

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If language = "Ch" Then
            LabelCountry.Text = "國家"
            LabelAdminDivision.Text = "行政區"
            LabelPark.Text = "國家公園/保護區"
        Else
            LabelCountry.Text = "Country"
            LabelAdminDivision.Text = "Administrative Division"
            LabelPark.Text = "National Park"
        End If



        If Not IsPostBack Then

            FillCountryList()

            DBConnection()

            '--------------------------------
            SDSSql.ConnectionString = strConnectionstring
            SDSSql.SelectCommand = "SELECT parkNo, parkC, parkE, parkE + ' ' + ISNULL(parkC,'') AS parkExpr FROM nationalPark ORDER BY parkExpr"

            DDListPark.Items.Add("")
            DDListPark.Items.Item(0).Value = ""

            dv = SDSSql.Select(New DataSourceSelectArguments)

            If language = "Ch" Then
                For i = 1 To dv.Count
                    DDListPark.Items.Add(dv.Item(i - 1).Item("parkExpr"))
                    DDListPark.Items.Item(i).Value = dv.Item(i - 1).Item("parkNo")
                Next
            Else
                For i = 1 To dv.Count
                    DDListPark.Items.Add(dv.Item(i - 1).Item("parkE"))
                    DDListPark.Items.Item(i).Value = dv.Item(i - 1).Item("parkNo")
                Next
            End If
            
            DDListPark.SelectedValue = ""


        End If

    End Sub

    Protected Sub FillCountryList()

        DBConnection()

        '--------------------------------
        SDSSql.ConnectionString = strConnectionstring


        'SDSSql.SelectCommand = "SELECT countryNo, country, countryC, country + ' '  + countryC AS countryExpr FROM country ORDER BY country"

        SDSSql.SelectCommand = "SELECT DISTINCT country.countryNo, country, countryC, country + ' '  + countryC AS countryExpr FROM country INNER JOIN hast ON country.countryNo = hast.countryNo ORDER BY country"

        'SDSSql.SelectCommandType = SqlDataSourceCommandType.StoredProcedure
        'SDSSql.SelectCommand = "prSpecies"

        DDListCountry.Items.Add("")
        DDListCountry.Items.Item(0).Value = ""

        dv = SDSSql.Select(New DataSourceSelectArguments)

        If language = "Ch" Then
            For i = 1 To dv.Count
                DDListCountry.Items.Add(dv.Item(i - 1).Item("countryExpr"))
                DDListCountry.Items.Item(i).Value = dv.Item(i - 1).Item("countryNo")
            Next
        Else
            For i = 1 To dv.Count
                DDListCountry.Items.Add(dv.Item(i - 1).Item("country"))
                DDListCountry.Items.Item(i).Value = dv.Item(i - 1).Item("countryNo")
            Next
        End If
       
        DDListCountry.SelectedValue = ""

    End Sub


    Protected Sub DDListCountry_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDListCountry.SelectedIndexChanged

        DDListProvince.Items.Clear()
        DDListHsien.Items.Clear()
        DDListTown.Items.Clear()

        DBConnection()
        SDSSql.ConnectionString = strConnectionstring
        SDSSql.SelectCommandType = SqlDataSourceCommandType.StoredProcedure
        SDSSql.SelectCommand = "prProvince"

        SDSSql.SelectParameters.Add("countryNo", DDListCountry.SelectedValue)

        If DDListCountry.SelectedValue <> "" Then

            DDListProvince.Items.Add("")
            DDListProvince.Items.Item(0).Value = ""

            dv = SDSSql.Select(New DataSourceSelectArguments)
            dv.Sort = "provinceE"

            If language = "Ch" Then
                For i As Integer = 1 To dv.Count
                    DDListProvince.Items.Add(dv.Item(i - 1).Item("provinceExpr"))
                    DDListProvince.Items.Item(i).Value = dv.Item(i - 1).Item("provinceNo")
                Next
            Else
                For i As Integer = 1 To dv.Count
                    DDListProvince.Items.Add(dv.Item(i - 1).Item("provinceE"))
                    DDListProvince.Items.Item(i).Value = dv.Item(i - 1).Item("provinceNo")
                Next
            End If

        End If

    End Sub

    Protected Sub DDListProvince_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDListProvince.SelectedIndexChanged

        DDListHsien.Items.Clear()
        DDListTown.Items.Clear()

        DBConnection()
        SDSSql.ConnectionString = strConnectionstring
        SDSSql.SelectCommandType = SqlDataSourceCommandType.StoredProcedure
        SDSSql.SelectCommand = "prHsien"

        SDSSql.SelectParameters.Add("provinceNo", DDListProvince.SelectedValue)

        If DDListProvince.SelectedValue <> "" Then

            DDListHsien.Items.Add("")
            DDListHsien.Items.Item(0).Value = ""

            dv = SDSSql.Select(New DataSourceSelectArguments)
            dv.Sort = "hsienCityE"

            If language = "Ch" Then
                For i As Integer = 1 To dv.Count
                    DDListHsien.Items.Add(dv.Item(i - 1).Item("hsienCityExpr"))
                    DDListHsien.Items.Item(i).Value = dv.Item(i - 1).Item("hsienNo")
                Next
            Else
                For i As Integer = 1 To dv.Count
                    DDListHsien.Items.Add(dv.Item(i - 1).Item("hsienCityE"))
                    DDListHsien.Items.Item(i).Value = dv.Item(i - 1).Item("hsienNo")
                Next
            End If
            

        End If

    End Sub

    Protected Sub DDListHsien_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDListHsien.SelectedIndexChanged

        DDListTown.Items.Clear()

        DBConnection()
        SDSSql.ConnectionString = strConnectionstring
        SDSSql.SelectCommandType = SqlDataSourceCommandType.StoredProcedure
        SDSSql.SelectCommand = "prTown"

        SDSSql.SelectParameters.Add("hsienNo", DDListHsien.SelectedValue)

        If DDListHsien.SelectedValue <> "" Then

            DDListTown.Items.Add("")
            DDListTown.Items.Item(0).Value = ""

            dv = SDSSql.Select(New DataSourceSelectArguments)
            dv.Sort = "hsiangTownE"

            If language = "Ch" Then
                For i As Integer = 1 To dv.Count
                    DDListTown.Items.Add(dv.Item(i - 1).Item("hsiangTownExpr"))
                    DDListTown.Items.Item(i).Value = dv.Item(i - 1).Item("townNo")
                Next
            Else
                For i As Integer = 1 To dv.Count
                    DDListTown.Items.Add(dv.Item(i - 1).Item("hsiangTownE"))
                    DDListTown.Items.Item(i).Value = dv.Item(i - 1).Item("townNo")
                Next
            End If

           

        End If

    End Sub

End Class
