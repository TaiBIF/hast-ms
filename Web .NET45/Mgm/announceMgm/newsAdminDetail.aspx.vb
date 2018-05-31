Imports System.Data
Imports System.Data.SqlClient



Partial Class Mgm_announceMgm_newsAdminDetail
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Request.QueryString("action") = "Insert" Then

            DetailsView1.DefaultMode = DetailsViewMode.Insert
            btnConfirm.Text = "新增"
            CType(DetailsView1.FindControl("LabelNewsEditor"), Label).Text = Context.User.Identity.Name

        Else
            btnConfirm.Text = "更新"
        End If




    End Sub

    Protected Sub btnConfirm_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnConfirm.Click

        Try
            If DetailsView1.CurrentMode = DetailsViewMode.Edit Then

                CType(DetailsView1.FindControl("LabelNewsEditor"), Label).Text = Context.User.Identity.Name
                DetailsView1.UpdateItem(True)

            ElseIf DetailsView1.CurrentMode = DetailsViewMode.Insert Then

                DetailsView1.InsertItem(True)

            End If


            Response.Redirect("newsAdmin.aspx")

        Catch ex As SqlException

            Response.Write("<br />" + "<br />" + ex.Message + "<br>")

        End Try
    End Sub

    Protected Sub DetailsView1_ModeChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DetailsView1.ModeChanged

        If DetailsView1.CurrentMode = DetailsViewMode.Edit Then
            btnConfirm.Text = "更新"
        ElseIf DetailsView1.CurrentMode = DetailsViewMode.Insert Then
            btnConfirm.Text = "新增"
        End If


    End Sub

    Protected Sub brnCanncel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles brnCanncel.Click
        'If DetailsView1.CurrentMode = DetailsViewMode.Edit Then

        '    DetailsView1.UpdateItem(False)

        'ElseIf DetailsView1.CurrentMode = DetailsViewMode.Insert Then

        '    DetailsView1.InsertItem(False)

        'End If

        Response.Redirect(Request.Url.AbsoluteUri)



    End Sub
End Class
