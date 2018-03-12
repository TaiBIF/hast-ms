Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration


Partial Class Mgm_secure_institutionDetailM
    Inherits System.Web.UI.Page

    Dim dv As New DataView
    Dim SDSSql As New SqlDataSource
    Dim strConnectionstring As String


    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        FormView1.DefaultMode = FormViewMode.Edit
    End Sub

    Protected Sub DropDownList1_DataBinding(sender As Object, e As EventArgs)
        'CType(FormView1.FindControl("DropDownList1"), DropDownList).Items.Add("")

    End Sub

    Private Sub DBConnection()

        strConnectionstring = WebConfigurationManager.ConnectionStrings("HASTDBConnectionString").ConnectionString

    End Sub

    Protected Sub FillCountryList()

        DBConnection()

        '------------------
        SDSSql.ConnectionString = strConnectionstring
        SDSSql.SelectCommandType = SqlDataSourceCommandType.Text
        SDSSql.SelectCommand = "SELECT Alpha2Code, countryE, countryC FROM countryISO ORDER BY countryC"

        CType(FormView1.Row.FindControl("DropDownList1"), DropDownList).Items.Add("")
        CType(FormView1.Row.FindControl("DropDownList1"), DropDownList).Items.Item(0).Value = ""


        dv = SDSSql.Select(New DataSourceSelectArguments)
        dv.Sort = "countryC"


        For i = 1 To dv.Count

           

            CType(FormView1.FindControl("DropDownList1"), DropDownList).Items.Add(dv.Item(i - 1).Item("countryE"))
            CType(FormView1.FindControl("DropDownList1"), DropDownList).Items.Item(i).Value = dv.Item(i - 1).Item("alpha2Code")
        Next


        


        'CType(FormView1.FindControl("DropDownList1"), DropDownList).SelectedValue = ""



    End Sub


    Protected Sub FormView1_DataBound(sender As Object, e As EventArgs) Handles FormView1.DataBound
        If FormView1.CurrentMode = FormViewMode.Edit Then

            '            FillCountryList()

        End If


        If FormView1.Row.RowType = DataControlRowType.EmptyDataRow Then
            FormView1.ChangeMode(FormViewMode.Insert)
        End If
       

    End Sub

   
    Protected Sub SqlDsInstitution_Selected(sender As Object, e As SqlDataSourceStatusEventArgs) Handles SqlDsInstitution.Selected
        If FormView1.CurrentMode = FormViewMode.Edit Then


            'CType(FormView1.FindControl("DropDownList1"), DropDownList).SelectedValue = e.Command.Parameters("@country2Code").Value

            'dv = SqlDsInstitution.Select( Parameter.New DataSourceSelectArguments).
            'MsgBox(dv.Table(0).Table.Rows(0).Item("country2Code"))


        End If
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim abc As Integer

        abc = Request.QueryString.Count
        If Not IsPostBack Then

            If Not Request.QueryString Is Nothing Then

                FormView1.DefaultMode = FormViewMode.Edit
            End If

           
        End If

            If abc = 0 Then

                LinkButton3.Enabled = False
                LinkButton3.Visible = False

            Else
                LinkButton3.Enabled = True
                LinkButton3.Visible = True

            LinkButton3.PostBackUrl = "~/Mgm/secure/addressM.aspx?linkTable=institution&ownerID=" + Request.QueryString("institutionID")

        End If

        HyperLink2.NavigateUrl = Request.UrlReferrer.ToString()

    End Sub
End Class
