
Partial Class Mgm_progress_SImageCount
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click

        If Me.TextBoxFirstDiskNo.Text = "" Or Me.TextBoxLastDiskNo.Text = "" Then

            Me.HyperLink1.Visible = False
        Else
            Me.HyperLink1.Visible = True

        End If

        Me.HyperLink1.NavigateUrl = "~/Mgm/progress/SImageList.aspx?firstDiskNo=" & Me.TextBoxFirstDiskNo.Text & Chr(38) & "lastDiskNo=" & Me.TextBoxLastDiskNo.Text

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Me.TextBoxFirstDiskNo.Text = "" Or Me.TextBoxLastDiskNo.Text = "" Then

            Me.HyperLink1.Visible = False

        End If

        If Not IsPostBack Then
            Me.HyperLink1.Visible = False
        End If

    End Sub

End Class
