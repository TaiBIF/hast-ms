
Partial Class HAST_MasterPages_ContentC
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        SiteMapDataSource1.SiteMapProvider = "HastC"
    End Sub
End Class

