
Partial Class Mgm_secure_ScientificNameMgm
    Inherits System.Web.UI.Page

    Protected Sub btnAddGenus_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddGenus.Click

        'CType(FormView1.FindControl("lblDataRecorder"), Label).Text = CType(CType(Me.Master.FindControl("LoginView1"), LoginView).FindControl("LoginName1"), LoginName).FormatString

        CType(FormView1.FindControl("lblDataRecorder"), Label).Text = Context.User.Identity.Name
        CType(FormView1.FindControl("lblFamilyE"), Label).Text = DropDownList1.SelectedItem.Text
        CType(FormView1.FindControl("lblFamilyID"), Label).Text = DropDownList1.SelectedItem.Value


        'CType(FormView1.FindControl("txtDataRecorder"), TextBox).Text = Context.User.Identity.Name
        'CType(FormView1.FindControl("txtFamilyID"), TextBox).Text = DropDownList1.SelectedItem.Value


    End Sub

    Protected Sub CustomValidator1_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs)

        Dim dv As Data.DataView
        Dim sqlDS As New SqlDataSource

        sqlDS.ConnectionString = "Data Source=g6;Initial Catalog=ScientificName;Integrated Security=True"

        sqlDS.SelectCommand = "SELECT genusE FROM genus"

        dv = sqlDS.Select(New DataSourceSelectArguments)

        args.IsValid = True
        CType(FormView1.FindControl("CustomValidator1"), CustomValidator).ErrorMessage = ""

        Dim txtGenusE As String

        For i As Integer = 0 To dv.Count - 1
            txtGenusE = dv.Item(i).Item(0)
            If txtGenusE = args.Value Then
                args.IsValid = False
                CType(FormView1.FindControl("CustomValidator1"), CustomValidator).ErrorMessage = "屬名已存在！"
                Exit For
            End If
        Next

    End Sub


    Protected Sub btnAddSpecies_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddSpecies.Click

        FormView2.Visible = True
        FormView2.ChangeMode(FormViewMode.Insert)

        'CType(FormView2.FindControl("dataRecorderTextBox"), TextBox).Text = Context.User.Identity.Name
        'CType(FormView2.FindControl("lblGenusID"), Label).Text = Me.GridView1.SelectedDataKey.Value

        'MsgBox(Me.GridView1.SelectedRow.Cells(0).Text)

        'CType(FormView2.FindControl("lblGenusE"), Label).Text = Me.GridView1.SelectedRow.Cells(0).Text
        CType(FormView2.FindControl("dataRecorderTextBox"), TextBox).Text = Context.User.Identity.Name
        CType(FormView2.FindControl("genusIDTextBox"), TextBox).Text = Me.GridView1.SelectedDataKey.Value


    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged

        FormView2.Visible = False

    End Sub

    Protected Sub FormView2_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormView2.DataBound

        If FormView2.CurrentMode = FormViewMode.Insert Then

            CType(FormView2.FindControl("genusIDTextBox"), TextBox).Text = GridView1.SelectedDataKey.Value
            CType(FormView2.FindControl("dataRecorderTextBox"), TextBox).Text = Context.User.Identity.Name

        ElseIf FormView2.CurrentMode = FormViewMode.Edit Then

            CType(FormView2.FindControl("updateDateTextBox"), TextBox).Text = Now
            CType(FormView2.FindControl("reviewerTextBox"), TextBox).Text = Context.User.Identity.Name

        End If

    End Sub

End Class
