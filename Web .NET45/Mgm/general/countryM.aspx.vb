
Partial Class Mgm_general_countryM

    Inherits System.Web.UI.Page


    Protected Sub FormView1_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormView1.ItemInserted

        GridView1.DataBind()

    End Sub

    Protected Sub FormView1_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewCommandEventArgs) Handles FormView1.ItemCommand

        'If e.CommandName = "Add" Then

        '    MsgBox("hihi")
        '    GridView1.DataBind()

        'End If
    End Sub

    Protected Sub FormView1_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormView1.ItemUpdated
        GridView1.DataBind()
    End Sub
End Class
