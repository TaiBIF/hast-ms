Imports System.Data
Imports System.Data.SqlClient

Partial Class Mgm_secure_speciesM
    Inherits System.Web.UI.Page

    Dim speciesEValid As Boolean


    Protected Sub FormView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormView1.DataBound

        If FormView1.CurrentMode = FormViewMode.Edit Then

            CType(FormView1.FindControl("updateDateTextBox"), TextBox).Text = Now
            CType(FormView1.FindControl("reviewerTextBox"), TextBox).Text = Context.User.Identity.Name

        ElseIf FormView1.CurrentMode = FormViewMode.Insert Then

            CType(FormView1.FindControl("genusIDTextBox"), TextBox).Text = Request.QueryString("genusID")

            CType(FormView1.FindControl("recordDateTextBox"), TextBox).Text = Now
            CType(FormView1.FindControl("dataRecorderTextBox"), TextBox).Text = Context.User.Identity.Name

        End If

    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click


        If FormView1.CurrentMode = FormViewMode.Insert Then

            CType(FormView1.FindControl("CustomValidator1"), CustomValidator).IsValid = True

        End If

        FormView1.ChangeMode(FormViewMode.ReadOnly)

        'If GridView1.EditIndex <> -1 Then
        btnUpdate.Visible = True
        btnUpdate.Text = "編輯"
        'End If


        btnInsert.Visible = True
        btnInsert.Text = "新增"

        btnCancel.Visible = False

    End Sub

    Protected Sub btnInsert_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsert.Click

        If btnInsert.Text = "新增" Then

            Try
                btnInsert.Text = "確定"
                FormView1.ChangeMode(FormViewMode.Insert)

                btnUpdate.Visible = False
                btnCancel.Visible = True

            Catch ex As SqlException

                Response.Write(ex.Message + "<br>")

            End Try

        Else

            If speciesEValid = True Then

                Try

                    FormView1.InsertItem(True)
                    btnInsert.Text = "新增"

                    btnUpdate.Visible = True
                    btnCancel.Visible = False

                    GridView1.DataBind()

                Catch ex As SqlException


                End Try


            End If

        End If

    End Sub

    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click


        If btnUpdate.Text = "編輯" Then

            btnUpdate.Text = "確定"
            FormView1.ChangeMode(FormViewMode.Edit)

            btnInsert.Visible = False
            btnCancel.Visible = True

        Else

            btnUpdate.Text = "編輯"
            FormView1.UpdateItem(True)

            btnInsert.Visible = True
            btnCancel.Visible = False

            GridView1.DataBind()



        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then


            btnUpdate.Text = "編輯"
            btnUpdate.Visible = False
            btnInsert.Text = "新增"

            btnCancel.Visible = False

        End If

    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged

        btnUpdate.Visible = True
        btnUpdate.Text = "編輯"

    End Sub

    Protected Sub CustomValidator1_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs)

        args.IsValid = True
        CType(FormView1.FindControl("CustomValidator1"), CustomValidator).ErrorMessage = ""

        If Trim(CType(FormView1.FindControl("speciesETextBox0"), TextBox).Text) = "" Then

            args.IsValid = False
            CType(FormView1.FindControl("CustomValidator1"), CustomValidator).ErrorMessage = "必填！"
            Exit Sub

        End If



        Dim dv As Data.DataView
        Dim sqlDS As New SqlDataSource

        speciesEValid = True

        sqlDS.ConnectionString = "Data Source=g6;Initial Catalog=ScientificName;Integrated Security=True"

        sqlDS.SelectCommand = "SELECT speciesE FROM species"  ' WHERE genusID = " & Request.QueryString("genusID")

        dv = sqlDS.Select(New DataSourceSelectArguments)


        Dim txtSpeciesE As String

        For i As Integer = 0 To dv.Count - 1
            txtSpeciesE = dv.Item(i).Item(0).ToString
            If LCase(txtSpeciesE) = LCase(args.Value) Then
                args.IsValid = False
                speciesEValid = False
                CType(FormView1.FindControl("CustomValidator1"), CustomValidator).ErrorMessage = "學名已存在！"
                Exit For
            End If
        Next

    End Sub

    Protected Sub TextBox2_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub

End Class
