Imports System.Web.Configuration
Imports System.Data

Partial Class Mgm_general_SpeciesMS
    Inherits System.Web.UI.Page


    Dim dv As New DataView
    Dim SDSSql As New SqlDataSource
    Dim strConnectionstring As String
    Private _language As String


    Private Sub DBConnection()

        strConnectionstring = WebConfigurationManager.ConnectionStrings("HASTDBConnectionString").ConnectionString

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            FillFamilyList()

        End If


    End Sub

    Protected Sub FillFamilyList()

        DBConnection()

        '------------------
        SDSSql.ConnectionString = strConnectionstring
        SDSSql.SelectCommandType = SqlDataSourceCommandType.StoredProcedure
        SDSSql.SelectCommand = "prFamily"

        DDListFamily.Items.Add("")
        DDListFamily.Items.Item(0).Value = ""

        dv = SDSSql.Select(New DataSourceSelectArguments)
        dv.Sort = "familyE"

        For i = 1 To dv.Count
            DDListFamily.Items.Add(dv.Item(i - 1).Item("familyExpr"))
            DDListFamily.Items.Item(i).Value = dv.Item(i - 1).Item("familyID")
        Next

        DDListFamily.SelectedValue = ""


    End Sub

    Protected Sub DDListFamily_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDListFamily.SelectedIndexChanged

        DDListGenus.Items.Clear()
        'DDListSpecies.Items.Clear()

        DBConnection()
        SDSSql.ConnectionString = strConnectionstring
        SDSSql.SelectCommandType = SqlDataSourceCommandType.StoredProcedure
        SDSSql.SelectCommand = "prGenus"


        SDSSql.SelectParameters.Add("familyID", DDListFamily.SelectedValue)

        If DDListFamily.SelectedValue <> "" Then

            DDListGenus.Items.Add("")
            DDListGenus.Items.Item(0).Value = ""

            dv = SDSSql.Select(New DataSourceSelectArguments)
            dv.Sort = "genusE"

            For i As Integer = 1 To dv.Count
                DDListGenus.Items.Add(dv.Item(i - 1).Item("genusExpr"))
                DDListGenus.Items.Item(i).Value = dv.Item(i - 1).Item("genusID")
            Next

        End If

    End Sub

    Protected Sub btnQuery_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnQuery.Click

        Dim strRedirectUrl As String

        strRedirectUrl = "~/Mgm/general/speciesAdd.aspx?genusID=" & DDListGenus.SelectedValue.ToString
        Response.Redirect(strRedirectUrl)



    End Sub
End Class
