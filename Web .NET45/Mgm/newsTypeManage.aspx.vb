Imports System.Data
Imports System.Data.SqlClient


Partial Class Mgm_secure_newsTypeManage
    Inherits System.Web.UI.Page


    Protected Sub btnInsert_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsert.Click


        'If btnInsert.Text = "新增" Then

        '    Try
        '        btnInsert.Text = "確定"
        '        FormView1.ChangeMode(FormViewMode.Insert)

        '        btnCancel.Visible = True

        '    Catch ex As SqlException

        '        Response.Write(ex.Message + "<br>")

        '    End Try

        'Else

        If CType(FormView1.FindControl("TextBoxNewstypeC"), TextBox).Text = "" Then


        Else



            Try

                FormView1.InsertItem(True)
                btnInsert.Text = "新增"


                ' btnCancel.Visible = False

                GridView1.DataBind()

            Catch ex As SqlException


            End Try

        End If

        'End If
    End Sub

   
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
End Class
