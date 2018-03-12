
Partial Class Mgm_secure_addressM
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load



        'If Not Request.QueryString Is Nothing Then

        '    FormView1.DefaultMode = FormViewMode.Edit

        'End If

        HyperLink2.NavigateUrl = "institutionDetailM.aspx?institutionID=" + Request.QueryString("ownerID")


    End Sub

    Protected Sub FormView1_DataBound(sender As Object, e As EventArgs) Handles FormView1.DataBound

        If FormView1.Row.RowType = DataControlRowType.EmptyDataRow Then
            FormView1.ChangeMode(FormViewMode.Insert)
        End If


    End Sub

    Protected Sub InsertButton_Click(sender As Object, e As EventArgs)

        FormView1.DefaultMode = FormViewMode.ReadOnly

    End Sub
End Class
