Imports System.Data
Imports System.Data.SqlClient

Partial Class Mgm_Project_speciesDescription
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim dv As DataView


        If Not IsPostBack Then

            dv = New DataView

            If Request.QueryString("speciesID") <> "" Then

                dv = SDSDescription.Select(New DataSourceSelectArguments)

                If dv.Count = 0 Then
                    FormView2.DefaultMode = FormViewMode.Insert
                End If

                If Request.QueryString("areaID") <> "" Then

                    dv = SDSDistributionArea.Select(New DataSourceSelectArguments)

                    If dv.Count = 0 Then
                        FormView3.DefaultMode = FormViewMode.Insert
                    End If

                End If

            End If


        End If




    End Sub

    Protected Sub FormView2_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles FormView2.ItemInserting
        'Dim paramScientificName As New QueryStringParameter("scientificName", TypeCode.String, "scientificName")
        SDSDescription.InsertParameters.Item("speciesID").DefaultValue = Request.QueryString("speciesID")
        'SDSSpecimensList.SelectParameters.Add(paramScientificName)

    End Sub

    Protected Sub FormView3_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles FormView3.ItemInserting

        SDSDistributionArea.InsertParameters.Item("speciesID").DefaultValue = Request.QueryString("speciesID")
        SDSDistributionArea.InsertParameters.Item("areaID").DefaultValue = Request.QueryString("areaID")

    End Sub

    Protected Sub FormView3_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormView3.ItemInserted

        FormView3.DefaultMode = FormViewMode.ReadOnly
        FormView3.DataBind()

    End Sub

    Protected Sub FormView3_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormView3.ItemUpdated

        FormView3.DataBind()

    End Sub

    Protected Sub FormView2_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormView2.ItemUpdated

        FormView2.DataBind()

    End Sub

    Protected Sub FormView2_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormView2.ItemInserted

        FormView2.DefaultMode = FormViewMode.ReadOnly
        FormView2.DataBind()

    End Sub
End Class
