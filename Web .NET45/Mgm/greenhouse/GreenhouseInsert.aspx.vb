
Partial Class Mgm_greenhouse_GreenhouseInsert
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            Session("collectNumA1") = Nothing
            Session("collectNumA1") = Nothing
            Session("collectNumA2") = Nothing
            Session("collectorB") = Nothing
            Session("collectNumB1") = Nothing
            Session("collectNumB2") = Nothing

        End If
    End Sub

    Protected Sub btnCopy_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        If CType(FormView1.FindControl("DDListCollectorA"), DropDownList).SelectedValue.Length <> 0 Then
            Session("collectorA") = CType(FormView1.FindControl("DDListCollectorA"), DropDownList).SelectedValue
        End If

        If CType(FormView1.FindControl("CollectNumA1TextBox"), TextBox).Text.Length <> 0 Then
            Session("collectNumA1") = CType(FormView1.FindControl("CollectNumA1TextBox"), TextBox).Text
        End If

        If CType(FormView1.FindControl("CollectNumA2TextBox"), TextBox).Text.Length <> 0 Then
            Session("collectNumA2") = CType(FormView1.FindControl("CollectNumA2TextBox"), TextBox).Text
        End If


        If CType(FormView1.FindControl("DDListCollectorB"), DropDownList).SelectedValue.Length <> 0 Then
            Session("collectorB") = CType(FormView1.FindControl("DDListCollectorB"), DropDownList).SelectedValue
        End If

        If CType(FormView1.FindControl("CollectNumB2TextBox"), TextBox).Text.Length <> 0 Then
            Session("collectNumB1") = CType(FormView1.FindControl("CollectNumB1TextBox"), TextBox).Text
        End If

        If CType(FormView1.FindControl("CollectNumB2TextBox"), TextBox).Text.Length <> 0 Then
            Session("collectNumB2") = CType(FormView1.FindControl("CollectNumB2TextBox"), TextBox).Text
        End If

    End Sub

    Protected Sub btnPaste_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        If Not Session("collectorA") Is Nothing Then
            CType(FormView1.FindControl("DDListCollectorA"), DropDownList).SelectedValue = Session("collectorA")
        End If

        If Not Session("collectNumA1") Is Nothing Then
            CType(FormView1.FindControl("CollectNumA1TextBox"), TextBox).Text = Session("collectNumA1")
        End If

        If Not Session("collectNumA2") Is Nothing Then
            CType(FormView1.FindControl("CollectNumA2TextBox"), TextBox).Text = Session("collectNumA2")
        End If

        If Not Session("collectorB") Is Nothing Then
            CType(FormView1.FindControl("DDListCollectorB"), DropDownList).SelectedValue = Session("collectorB")
        End If

        If Not Session("collectNumB1") Is Nothing Then
            CType(FormView1.FindControl("CollectNumB1TextBox"), TextBox).Text = Session("collectNumB1")
        End If

        If Not Session("collectNumB2") Is Nothing Then
            CType(FormView1.FindControl("CollectNumB2TextBox"), TextBox).Text = Session("collectNumB2")
        End If
    End Sub

End Class
