Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration


Partial Class Mgm_secure_LoanM
    Inherits System.Web.UI.Page

    Dim dv As New DataView
    Dim SDSSql As New SqlDataSource
    Dim strConnectionstring As String

    Private Sub DBConnection()

        strConnectionstring = WebConfigurationManager.ConnectionStrings("HASTDBConnectionString").ConnectionString

    End Sub





    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        Dim paramPurposeID As New ControlParameter("purposeID", TypeCode.Int16, "DDLPurpose", "SelectedValue")
        paramPurposeID.Direction = Data.ParameterDirection.Input

        Dim paramCheckIn As New ControlParameter("checkIn", "DDLCheckIn", "SelectedValue")
        paramCheckIn.Direction = Data.ParameterDirection.Input

        Dim paramIsNative As New ControlParameter("isNative", "DDLNative", "SelectedValue")
       
        DBConnection()

        SqlDSLoanTo.ConnectionString = strConnectionstring
        SqlDSLoanTo.SelectCommandType = SqlDataSourceCommandType.StoredProcedure
        SqlDSLoanTo.SelectCommand = "prInvoice"



        If Not IsPostBack Then


            SqlDSLoanTo.SelectParameters.Add(paramPurposeID)
            SqlDSLoanTo.SelectParameters.Add(paramIsNative)
            SqlDSLoanTo.SelectParameters.Add(paramCheckIn)
            '------------------









        End If

        'dv = SqlDSLoanTo.Select(New DataSourceSelectArguments)
        'dv.Sort = "signingDate"
        'GridView1.DataSource = dv
        'GridView1.DataBind()




    End Sub
End Class
