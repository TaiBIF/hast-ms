Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration

Partial Class Mgm_Project_FloraAreaSelect
    Inherits System.Web.UI.Page

    Dim strConnectionString As String

    Private Sub DBConnection()

        strConnectionString = WebConfigurationManager.ConnectionStrings("HASTDBConnectionString").ConnectionString

    End Sub


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load



        If Context.User.IsInRole("Power User") Then
            DDListArea.Visible = True
            Button1.Visible = True
        Else
            DDListArea.Visible = False
            Button1.Visible = False
        End If

        If Not IsPostBack Then

            '==設定查詢參數================================================

            Dim SDSSql As SqlDataSource
            Dim dv As DataView


            DBConnection()
            SDSSql = New SqlDataSource

            SDSSql.ConnectionString = strConnectionString
            SDSSql.SelectCommandType = SqlDataSourceCommandType.Text

            '-----------------------------
            SDSSql.SelectCommand = "SELECT areaID, nLocalityC FROM vwAreaList ORDER BY nLocalityC"

            DDListArea.Items.Add("")
            DDListArea.Items.Item(0).Value = ""

            dv = SDSSql.Select(New DataSourceSelectArguments)
            dv.Sort = "nLocalityC"

            For i = 1 To dv.Count
                DDListArea.Items.Add(dv.Item(i - 1).Item("nLocalityC"))
                DDListArea.Items.Item(i).Value = dv.Item(i - 1).Item("areaID")
            Next

            DDListArea.SelectedValue = ""


        End If

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click

        Dim strUrl As String
        strUrl = "~/Mgm/Project/FloraAreaC.aspx?areaID=" & DDListArea.SelectedValue
        Response.Redirect(strUrl)

    End Sub

End Class
