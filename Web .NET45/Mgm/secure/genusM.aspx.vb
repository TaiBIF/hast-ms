
Partial Class Mgm_secure_genusM
    Inherits System.Web.UI.Page

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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        FormView1.Visible = False

        ' btnAddGenus.Enabled = True
        btnAddGenus.Enabled = False '不再提供


    End Sub

    Protected Sub btnAddGenus_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddGenus.Click

        FormView1.Visible = True

        GridView1.EditIndex = -1

        CType(FormView1.FindControl("lblDataRecorder"), Label).Text = Context.User.Identity.Name
        CType(FormView1.FindControl("lblFamilyE"), Label).Text = DropDownList1.SelectedItem.Text
        CType(FormView1.FindControl("lblFamilyID"), Label).Text = DropDownList1.SelectedItem.Value

        btnAddGenus.Enabled = False

    End Sub

    Protected Sub FormView1_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormView1.ItemInserted

        FormView1.Visible = False
        'btnAddGenus.Enabled = True
        btnAddGenus.Enabled = False '不再提供


        GridView1.DataBind()

    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged

        '  FormView1.Visible = False

    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged

        GridView1.EditIndex = -1

    End Sub

End Class
