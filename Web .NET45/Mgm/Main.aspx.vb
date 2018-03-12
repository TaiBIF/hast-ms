
Partial Class Mgm_Main
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'CType(LoginView1.FindControl("SiteMapDataSource1"), SiteMapDataSource).SiteMapProvider = "Management"
        SiteMapDataSource1.SiteMapProvider = "Management"

    End Sub

    Protected Sub LoginView1_ViewChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles LoginView1.ViewChanged


    End Sub

End Class
