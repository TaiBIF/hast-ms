Imports System.Web.Configuration
Imports System.Data

Partial Class Specimens_SpecimenQueryC
    Inherits System.Web.UI.Page

    Dim strConnectionstring As String

    Dim dv As New DataView
    Dim SDSCollector As New SqlDataSource
    
    Dim SDSSql As New SqlDataSource


    Sub DBConnection()

        strConnectionstring = WebConfigurationManager.ConnectionStrings("HASTDBConnectionString").ConnectionString
    End Sub



    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click

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

        If DDListScientificName1.familyID <> "" Then
            strRedirectUrl = strRedirectUrl & "&familyID=" & DDListScientificName1.familyID
        End If

        If DDListScientificName1.genusID <> "" Then
            strRedirectUrl = strRedirectUrl & "&genusID=" & DDListScientificName1.genusID
        End If

        If DDListScientificName1.speciesID <> "" Then
            strRedirectUrl = strRedirectUrl & "&speciesID=" & DDListScientificName1.speciesID
        End If

        If DDListLocation1.countryNo <> "" Then
            strRedirectUrl = strRedirectUrl & "&countryNo=" & DDListLocation1.countryNo
        End If

        If DDListLocation1.provinceNo <> "" Then
            strRedirectUrl = strRedirectUrl & "&provinceNo=" & DDListLocation1.provinceNo
        End If

        If DDListLocation1.hsienNo <> "" Then
            strRedirectUrl = strRedirectUrl & "&hsienNo=" & DDListLocation1.hsienNo
        End If

        If DDListLocation1.townNo <> "" Then
            strRedirectUrl = strRedirectUrl & "&townNo=" & DDListLocation1.townNo
        End If

        If DDListLocation1.parkNo <> "" Then
            strRedirectUrl = strRedirectUrl & "&parkNo=" & DDListLocation1.parkNo
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
            SDSSql.ConnectionString = strConnectionstring
            SDSSql.SelectCommandType = SqlDataSourceCommandType.Text
            SDSSql.SelectCommand = "SELECT pid, nameLFC1 FROM vwPersonName WHERE collector = 1 ORDER BY nameLFC1"

            DDListCollector.Items.Add("")
            DDListCollector.Items.Item(0).Value = ""

            dv = SDSSql.Select(New DataSourceSelectArguments)

            Dim i As Integer

            For i = 1 To dv.Count
                DDListCollector.Items.Add(dv.Item(i - 1).Item("nameLFC1"))
                DDListCollector.Items.Item(i).Value = dv.Item(i - 1).Item("pid")
            Next
            DDListCollector.SelectedValue = ""



            'DDLCollector.DataSourceID = SDSCollector.ID
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
      
        DDListCollectionMonth.SelectedValue = "0"

        
        DDListAltCompare.SelectedValue = "0"

        DDListScientificName1.Reset()
        DDListLocation1.Reset()


    End Sub

End Class
