Imports System.Web.Configuration
Imports System.Data

Partial Class Mgm_secure_HastQuery
    Inherits System.Web.UI.Page
    Dim strConnectionstring As String

    Dim dv As New DataView
    Dim SDSCollector As New SqlDataSource
    Dim SDSFamily As New SqlDataSource
    'Dim SDSGenus As New SqlDataSource
    'Dim SDSSpecies As New SqlDataSource
    'Dim SDSCountry As New SqlDataSource
    'Dim SDSProvince As New SqlDataSource
    'Dim SDSHsien As New SqlDataSource
    'Dim SDSTown As New SqlDataSource
    'Dim SDSPark As New SqlDataSource
    Dim SDSSql As New SqlDataSource


    Sub DBConnection()

        strConnectionstring = WebConfigurationManager.ConnectionStrings("HASTDBConnectionString").ConnectionString
    End Sub


    Sub ResetQuery()

        DDListGenus.Items.Clear()
        DDListSpecies.Items.Clear()

        DDListProvince.Items.Clear()
        DDListHsien.Items.Clear()
        DDListTown.Items.Clear()

    End Sub


    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click

        Session("RequestPage") = "HastQuery"    '設定sesseion，用以判定是否由本網頁傳入


        Dim strRedirectUrl As String

        strRedirectUrl = "~/specimens/specimenListC.aspx?"

        If TextBoxScientificName.Text.Trim <> "" Then
            strRedirectUrl = strRedirectUrl & "&scientificName=" & TextBoxScientificName.Text.Trim
        End If

        If DDListCollector.SelectedValue <> "" Then
            strRedirectUrl = strRedirectUrl & "&collectorID=" & DDListCollector.SelectedValue
        End If

        If TextBoxCollectionNum.Text.Trim <> "" Then
            strRedirectUrl = strRedirectUrl & "&collectionNum=" & TextBoxCollectionNum.Text.Trim
        End If

        If TextBoxCollectionNumEnd.Text.Trim <> "" Then
            strRedirectUrl = strRedirectUrl & "&collectionNumEnd=" & TextBoxCollectionNumEnd.Text.Trim
        End If

        If TextBoxCollectionDate.Text.Trim <> "" Then
            strRedirectUrl = strRedirectUrl & "&collectionDate=" & TextBoxCollectionDate.Text.Trim
        End If

        If TextBoxCollectionDateEnd.Text.Trim <> "" Then
            strRedirectUrl = strRedirectUrl & "&collectionDateEnd=" & TextBoxCollectionDateEnd.Text.Trim
        End If

        If DDListCollectionMonth.SelectedValue <> "" Then
            strRedirectUrl = strRedirectUrl & "&collectionMonth=" & DDListCollectionMonth.SelectedValue
        End If

        If TextBoxSpecimenOrderNum.Text.Trim <> "" Then
            strRedirectUrl = strRedirectUrl & "&specimenOrderNum=" & TextBoxSpecimenOrderNum.Text.Trim
        End If

        If TextBoxSpecimenOrderNumEnd.Text.Trim <> "" Then
            strRedirectUrl = strRedirectUrl & "&specimenOrderNumEnd=" & TextBoxSpecimenOrderNumEnd.Text.Trim
        End If

        If DDListFamily.SelectedValue <> "" Then
            strRedirectUrl = strRedirectUrl & "&familyID=" & DDListFamily.SelectedValue
        End If

        If DDListGenus.SelectedValue <> "" Then
            strRedirectUrl = strRedirectUrl & "&genusID=" & DDListGenus.SelectedValue
        End If

        If DDListSpecies.SelectedValue <> "" Then
            strRedirectUrl = strRedirectUrl & "&speciesID=" & DDListSpecies.SelectedValue
        End If

        If DDListCountry.SelectedValue <> "" Then
            strRedirectUrl = strRedirectUrl & "&countryNo=" & DDListCountry.SelectedValue
        End If

        If DDListProvince.SelectedValue <> "" Then
            strRedirectUrl = strRedirectUrl & "&provinceNo=" & DDListProvince.SelectedValue
        End If

        If DDListHsien.SelectedValue <> "" Then
            strRedirectUrl = strRedirectUrl & "&hsienNo=" & DDListHsien.SelectedValue
        End If

        If DDListTown.SelectedValue <> "" Then
            strRedirectUrl = strRedirectUrl & "&townNo=" & DDListTown.SelectedValue
        End If

        If DDListPark.SelectedValue <> "" Then
            strRedirectUrl = strRedirectUrl & "&parkNo=" & DDListPark.SelectedValue
        End If

        If TextBoxLocation.Text.Trim <> "" Then
            strRedirectUrl = strRedirectUrl & "&location=" & TextBoxLocation.Text.Trim
        End If

        Dim x As Integer
        For x = 0 To 3
            If DDListAltCompare.SelectedValue = x.ToString Then
                strRedirectUrl = strRedirectUrl & "&altCompare=" & DDListAltCompare.SelectedValue
            End If
        Next

        If TextBoxAlt.Text.Trim <> "" Then
            strRedirectUrl = strRedirectUrl & "&alt=" & TextBoxAlt.Text.Trim
        End If

        If TextBoxAltx.Text.Trim <> "" Then
            strRedirectUrl = strRedirectUrl & "&altx=" & TextBoxAltx.Text.Trim
        End If

        Response.Redirect(strRedirectUrl)


    End Sub


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            DBConnection()
            SDSCollector.ConnectionString = strConnectionstring
            SDSCollector.SelectCommandType = SqlDataSourceCommandType.Text
            SDSCollector.SelectCommand = "SELECT pid, nameLFC1 FROM vwPersonName WHERE collector = 1 ORDER BY nameLFC1"

            DDListCollector.Items.Add("")
            DDListCollector.Items.Item(0).Value = ""

            dv = SDSCollector.Select(New DataSourceSelectArguments)

            Dim i As Integer

            For i = 1 To dv.Count
                DDListCollector.Items.Add(dv.Item(i - 1).Item("nameLFC1"))
                DDListCollector.Items.Item(i).Value = dv.Item(i - 1).Item("pid")
            Next
            DDListCollector.SelectedValue = ""


            '------------------
            SDSFamily.ConnectionString = strConnectionstring
            SDSFamily.SelectCommand = "SELECT familyID, familyExpr FROM vwFamily  ORDER BY familyExpr"

            DDListFamily.Items.Add("")
            DDListFamily.Items.Item(0).Value = ""

            dv = SDSFamily.Select(New DataSourceSelectArguments)

            For i = 1 To dv.Count
                DDListFamily.Items.Add(dv.Item(i - 1).Item("familyExpr"))
                DDListFamily.Items.Item(i).Value = dv.Item(i - 1).Item("familyID")
            Next
            DDListFamily.SelectedValue = ""



            '--------------------------------
            SDSSql.ConnectionString = strConnectionstring
            SDSSql.SelectCommand = "SELECT countryNo, country FROM country ORDER BY country"

            DDListCountry.Items.Add("")
            DDListCountry.Items.Item(0).Value = ""

            dv = SDSSql.Select(New DataSourceSelectArguments)

            For i = 1 To dv.Count
                DDListCountry.Items.Add(dv.Item(i - 1).Item("country"))
                DDListCountry.Items.Item(i).Value = dv.Item(i - 1).Item("countryNo")
            Next
            DDListCountry.SelectedValue = ""


            '--------------------------------
            SDSSql.ConnectionString = strConnectionstring
            SDSSql.SelectCommand = "SELECT parkNo, parkE + ' ' + ISNULL(parkC,'') AS parkExpr FROM nationalPark ORDER BY parkExpr"

            DDListPark.Items.Add("")
            DDListPark.Items.Item(0).Value = ""

            dv = SDSSql.Select(New DataSourceSelectArguments)

            For i = 1 To dv.Count
                DDListPark.Items.Add(dv.Item(i - 1).Item("parkExpr"))
                DDListPark.Items.Item(i).Value = dv.Item(i - 1).Item("parkNo")
            Next
            DDListPark.SelectedValue = ""



            'DDLCollector.DataSourceID = SDSCollector.ID
        End If





    End Sub

    Protected Sub DDListFamily_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDListFamily.SelectedIndexChanged

        DDListGenus.Items.Clear()
        DDListSpecies.Items.Clear()


        DBConnection()
        SDSSql.ConnectionString = strConnectionstring
        SDSSql.SelectCommand = "SELECT genusID, genusExpr,familyID FROM vwGenus WHERE familyID = @familyID ORDER BY genusExpr"

        SDSSql.SelectParameters.Add("familyID", DDListFamily.SelectedValue)

        If DDListFamily.SelectedValue <> "" Then

            DDListGenus.Items.Add("")
            DDListGenus.Items.Item(0).Value = ""

            dv = SDSSql.Select(New DataSourceSelectArguments)

            For i As Integer = 1 To dv.Count
                DDListGenus.Items.Add(dv.Item(i - 1).Item("genusExpr"))
                DDListGenus.Items.Item(i).Value = dv.Item(i - 1).Item("genusID")
            Next

        End If

    End Sub


    Protected Sub DDListGenus_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDListGenus.SelectedIndexChanged

        DDListSpecies.Items.Clear()

        DBConnection()
        SDSSql.ConnectionString = strConnectionstring

        SDSSql.SelectCommand = "SELECT DISTINCT vwSpecies.speciesID, speciesExpr, vwSpecies.genusID FROM vwSpecies INNER JOIN verification ON vwSpecies.speciesID = verification.speciesID WHERE vwSpecies.genusID = @genusID  ORDER BY speciesExpr"

        SDSSql.SelectParameters.Add("genusID", DDListGenus.SelectedValue)
        'SDSSql.SelectParameters.Add("familyID", DDLFamily.SelectedValue)

        DDListSpecies.Items.Add("")
        DDListSpecies.Items.Item(0).Value = ""

        If DDListGenus.SelectedValue <> "" Then

            dv = SDSSql.Select(New DataSourceSelectArguments)

            For i As Integer = 1 To dv.Count
                DDListSpecies.Items.Add(dv.Item(i - 1).Item("speciesExpr"))
                DDListSpecies.Items.Item(i).Value = dv.Item(i - 1).Item("speciesID")
            Next

        End If

    End Sub



    Protected Sub DDListCountry_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDListCountry.SelectedIndexChanged

        DDListProvince.Items.Clear()
        DDListHsien.Items.Clear()
        DDListTown.Items.Clear()

        DBConnection()
        SDSSql.ConnectionString = strConnectionstring
        SDSSql.SelectCommand = "SELECT provinceNo, provinceE + ' ' + ISNULL(provinceC,'') AS provinceExpr, countryNo FROM province WHERE countryNo = @countryNo ORDER BY provinceExpr"

        SDSSql.SelectParameters.Add("countryNo", DDListCountry.SelectedValue)

        If DDListCountry.SelectedValue <> "" Then

            DDListProvince.Items.Add("")
            DDListProvince.Items.Item(0).Value = ""

            dv = SDSSql.Select(New DataSourceSelectArguments)

            For i As Integer = 1 To dv.Count
                DDListProvince.Items.Add(dv.Item(i - 1).Item("provinceExpr"))
                DDListProvince.Items.Item(i).Value = dv.Item(i - 1).Item("provinceNo")
            Next

        End If

    End Sub

    Protected Sub DDListProvince_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDListProvince.SelectedIndexChanged

        'DDListProvince.Items.Clear()
        DDListHsien.Items.Clear()
        DDListTown.Items.Clear()

        DBConnection()
        SDSSql.ConnectionString = strConnectionstring
        SDSSql.SelectCommand = "SELECT hsienNo, hsienCityE + ' ' + ISNULL(hsienCityC,'') AS hsienExpr, provinceNo FROM hsienCity WHERE provinceNo = @provinceNo ORDER BY hsienExpr"

        SDSSql.SelectParameters.Add("provinceNo", DDListProvince.SelectedValue)

        If DDListProvince.SelectedValue <> "" Then

            DDListHsien.Items.Add("")
            DDListHsien.Items.Item(0).Value = ""

            dv = SDSSql.Select(New DataSourceSelectArguments)

            For i As Integer = 1 To dv.Count
                DDListHsien.Items.Add(dv.Item(i - 1).Item("hsienExpr"))
                DDListHsien.Items.Item(i).Value = dv.Item(i - 1).Item("hsienNo")
            Next

        End If

    End Sub

    Protected Sub DDListHsien_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDListHsien.SelectedIndexChanged

        'DDListProvince.Items.Clear()
        'DDListHsien.Items.Clear()
        DDListTown.Items.Clear()

        DBConnection()
        SDSSql.ConnectionString = strConnectionstring
        SDSSql.SelectCommand = "SELECT townNo, hsiangTownE + ' ' + ISNULL(hsiangTownC,'') AS townExpr, hsienNo FROM hsiangTown WHERE hsienNo = @hsienNo ORDER BY townExpr"

        SDSSql.SelectParameters.Add("hsienNo", DDListHsien.SelectedValue)

        If DDListHsien.SelectedValue <> "" Then

            DDListTown.Items.Add("")
            DDListTown.Items.Item(0).Value = ""

            dv = SDSSql.Select(New DataSourceSelectArguments)

            For i As Integer = 1 To dv.Count
                DDListTown.Items.Add(dv.Item(i - 1).Item("townExpr"))
                DDListTown.Items.Item(i).Value = dv.Item(i - 1).Item("townNo")
            Next

        End If

    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click

        TextBoxScientificName.Text = ""
        TextBoxCollectionNum.Text = ""
        TextBoxCollectionNumEnd.Text = ""
        TextBoxCollectionDate.Text = ""
        TextBoxCollectionDateEnd.Text = ""
        TextBoxLocation.Text = ""
        TextBoxAlt.Text = ""
        TextBoxAltx.Text = ""
        TextBoxSpecimenOrderNum.Text = ""
        TextBoxSpecimenOrderNumEnd.Text = ""

        DDListCollector.SelectedValue = ""
        DDListFamily.SelectedValue = ""
        DDListGenus.SelectedValue = ""
        DDListSpecies.SelectedValue = ""
        DDListCountry.SelectedValue = ""
        DDListCollectionMonth.SelectedValue = "0"

        DDListProvince.SelectedValue = ""
        DDListHsien.SelectedValue = ""
        DDListTown.SelectedValue = ""
        DDListPark.SelectedValue = ""
        DDListAltCompare.SelectedValue = "0"

        ResetQuery()



    End Sub

End Class
