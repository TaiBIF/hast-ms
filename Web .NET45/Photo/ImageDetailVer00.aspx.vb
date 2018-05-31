Imports System.Web.Configuration


Partial Class Photo_ImageDetail
    Inherits System.Web.UI.Page


    Dim dv As Data.DataView

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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        If Not IsPostBack Then

            Dim strSlectImage As String

            strSlectImage = "SELECT SN, imageCode, imgSubject, authorFL, photoDate, familyE, familyC, genusE, genusC, speciesID, speciesE, speciesC, collectionLFNo, districtE,  " & _
                    " wholePlant, root, stem, leaf, flower, fruit, seed, sorus, pistillateFlower, staminateFlower " & _
                    " FROM vwImageDetail WHERE (imageCode = @imageCode) "

            Dim paramImageCode As New QueryStringParameter("imageCode", TypeCode.String, "imageCode")
            paramImageCode.Direction = Data.ParameterDirection.Input

            SDSImage.ConnectionString = WebConfigurationManager.ConnectionStrings("HASTDBConnectionString").ConnectionString
            SDSImage.SelectCommandType = SqlDataSourceCommandType.Text
            SDSImage.SelectCommand = strSlectImage
            SDSImage.SelectParameters.Add(paramImageCode)

            SDSSN.ConnectionString = WebConfigurationManager.ConnectionStrings("HASTDBConnectionString").ConnectionString
            SDSSN.SelectCommandType = SqlDataSourceCommandType.StoredProcedure
            SDSSN.SelectCommand = "prImageSNSpecimenOrderNum"
            SDSSN.SelectParameters.Add(paramImageCode)

            If Request.QueryString("imageCode") <> "" Then


                dv = SDSSN.Select(New DataSourceSelectArguments)

                If dv.Count = 0 Then
                    CType(DataList1.Items(0).FindControl("HyperLinkCollectorNo"), HyperLink).Visible = False

                Else
                    CType(DataList1.Items(0).FindControl("HyperLinkCollectorNo"), HyperLink).Visible = True

                    dv = SDSImage.Select(New DataSourceSelectArguments)

                    Dim strHyperLink As String
                    strHyperLink = "~/Specimens/SpecimenListC.aspx?SN="
                    strHyperLink = strHyperLink & dv.Item(0).Item("SN").ToString
                    CType(DataList1.Items(0).FindControl("HyperLinkCollectorNo"), HyperLink).Visible = True
                    CType(DataList1.Items(0).FindControl("HyperLinkCollectorNo"), HyperLink).NavigateUrl = strHyperLink
                    CType(DataList1.Items(0).FindControl("HyperLinkCollectorNo"), HyperLink).Target = "_blank"
                    'Session("RequestPage") = "imageDetail"


                End If

                dv.Dispose()

            End If



        End If



    End Sub
End Class
