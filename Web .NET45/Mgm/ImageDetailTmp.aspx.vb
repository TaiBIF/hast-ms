
Partial Class Mgm_ImageDetailTmp
    Inherits System.Web.UI.Page


    Public Function GetImageFilePath(ByVal imageCode As String) As String

        Return ImageFilePath.GetImageFilePath(imageCode, "Album")

    End Function

    Protected Sub DataList1_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList1.ItemDataBound

        If Context.User.IsInRole("Power User") Then

            CType(e.Item.FindControl("Hyperlink1"), HyperLink).Visible = True

        Else

            CType(e.Item.FindControl("Hyperlink1"), HyperLink).Visible = False

        End If

    End Sub


End Class
