
Partial Class Mgm_secure_LoanDetailM
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load


        ''Dim paramInstitution As New ControlParameter("checkIn", "DDLCheckIn", "SelectedValue")
        ''paramInstitution.Direction = Data.ParameterDirection.Input

        'If Not IsPostBack Then



        '    SqlDsAddress.SelectParameters.Add(paramInstitution)





        'End If

        If Request.QueryString.Count = 0 Then

            DetailsViewList.Visible = False
            HyperLink2.Visible = False
        Else
            DetailsViewList.Visible = True
            HyperLink2.Visible = True

        End If




    End Sub

    Protected Sub DropDownList1_DataBound(sender As Object, e As EventArgs)


        'CType(FormView1.FindControl("DropDownList1"), DropDownList).Items.Add("")


    End Sub

    Protected Sub NewButton_Click(sender As Object, e As EventArgs)



        DetailsViewList.Visible = False
        GridView1.Visible = False
        GridView2.Visible = False
        HyperLink2.Visible = False

    End Sub
End Class
