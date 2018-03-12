
Partial Class Announce_newsE
    Inherits System.Web.UI.Page


    Protected Sub GridViewNewsSubject_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewNewsSubject.SelectedIndexChanged

        DetailsViewNewsContent.Caption = "News Content"

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'DetailsViewNewsContent.HeaderRow.Visible = False


    End Sub
End Class
