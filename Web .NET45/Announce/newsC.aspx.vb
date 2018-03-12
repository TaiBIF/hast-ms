
Partial Class Announce_newsC
    Inherits System.Web.UI.Page

  
    Protected Sub GridViewNewsSubject_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewNewsSubject.SelectedIndexChanged

        DetailsViewNewsContent.Caption = "新聞內容"

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'DetailsViewNewsContent.HeaderRow.Visible = False

       

    End Sub
End Class
