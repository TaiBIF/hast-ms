﻿
Partial Class MasterPages_HastMainC
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        SiteMapDataSource1.SiteMapProvider = "HastC"

    End Sub

End Class

