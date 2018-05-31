Imports System.Web.Configuration
Imports System.Data
Imports System.Data.SqlClient


Partial Class Photo_ImageDetailC
    Inherits System.Web.UI.Page

    Dim dv, dvImage As Data.DataView

    Public Function GetImageFilePath(ByVal imageCode As String) As String

        Return ImageFilePath.GetImageFilePath(imageCode, "Album")

    End Function

    'Protected Sub DataList1_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList1.ItemDataBound

    '    If Context.User.IsInRole("Power User") Then

    '        CType(e.Item.FindControl("Hyperlink1"), HyperLink).Visible = True

    '    Else

    '        CType(e.Item.FindControl("Hyperlink1"), HyperLink).Visible = False

    '    End If

    'End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

       

        Try


            If Not IsPostBack Then

                Dim strSlectImage As String

                strSlectImage = "SELECT SN, imageCode, authorFL,authorC, photoDate, " & _
                        "familyE, familyC, genusE, genusC, speciesID, speciesE, speciesC, collectionLFNo, collectionFLCNo, " & _
                        " countryC, country, districtC, districtE, localityDescC, localityDescE, " & _
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
                    dvImage = SDSImage.Select(New DataSourceSelectArguments)


                    If dv.Count = 0 Then
                        'CType(DataList1.Items(0).FindControl("HyperLinkCollectorNo"), HyperLink).Visible = False
                        CType(FormView1.FindControl("HyperLinkCollectorNo"), HyperLink).Visible = False

                    Else

                        'CType(DataList1.Items(0).FindControl("HyperLinkCollectorNo"), HyperLink).Visible = True
                        CType(FormView1.FindControl("HyperLinkCollectorNo"), HyperLink).Visible = True

                        Dim strHyperLink As String
                        strHyperLink = "~/Specimens/SpecimenListC.aspx?SN="
                        strHyperLink = strHyperLink & dvImage.Item(0).Item("SN").ToString
                        'CType(DataList1.Items(0).FindControl("HyperLinkCollectorNo"), HyperLink).Visible = True
                        'CType(DataList1.Items(0).FindControl("HyperLinkCollectorNo"), HyperLink).NavigateUrl = strHyperLink
                        'CType(DataList1.Items(0).FindControl("HyperLinkCollectorNo"), HyperLink).Target = "_blank"

                        CType(FormView1.FindControl("HyperLinkCollectorNo"), HyperLink).Visible = True
                        CType(FormView1.FindControl("HyperLinkCollectorNo"), HyperLink).NavigateUrl = strHyperLink
                        CType(FormView1.FindControl("HyperLinkCollectorNo"), HyperLink).Target = "_blank"

                        'Session("RequestPage") = "imageDetail"                    

                    End If

                    dv.Dispose()


                    '填入影像主題
                    Dim strImageSubject As String = ""
                    If dvImage.Item(0).Item("wholePlant").ToString = "1" Then
                        strImageSubject += "全株, "
                    End If

                    If dvImage.Item(0).Item("root").ToString = "1" Then
                        strImageSubject += "根, "
                    End If

                    If dvImage.Item(0).Item("stem").ToString = "1" Then
                        strImageSubject += "莖, "
                    End If

                    If dvImage.Item(0).Item("leaf").ToString = "1" Then
                        strImageSubject += "葉, "
                    End If

                    If dvImage.Item(0).Item("flower").ToString = "1" Then
                        strImageSubject += "花, "
                    End If

                    If dvImage.Item(0).Item("fruit").ToString = "1" Then
                        strImageSubject += "果實, "
                    End If

                    If dvImage.Item(0).Item("seed").ToString = "1" Then
                        strImageSubject += "種子, "
                    End If

                    If dvImage.Item(0).Item("sorus").ToString = "1" Then
                        strImageSubject += "孢子囊群, "
                    End If

                    If dvImage.Item(0).Item("pistillateFlower").ToString = "1" Then
                        strImageSubject += "雌花, "
                    End If

                    If dvImage.Item(0).Item("staminateFlower").ToString = "1" Then
                        strImageSubject += "雄花, "
                    End If

                    strImageSubject = strImageSubject.Trim

                    If Right(strImageSubject, 1) = "," Then
                        strImageSubject = Left(strImageSubject, (Len(strImageSubject) - 1))
                    End If

                    CType(FormView1.FindControl("LabelSubject"), Label).Text = strImageSubject





                    dvImage.Dispose()



                End If


            End If

        Catch ex As SqlException

            Response.Write("File not found!")

        Catch ex As Exception

            Response.Write("File not found!")


        End Try


    End Sub

    Protected Sub FormView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormView1.DataBound

        If Request.QueryString("imageCode") <> "" Then

            If Context.User.IsInRole("Power User") Then

                CType(FormView1.FindControl("Hyperlink1"), HyperLink).Visible = True

            Else

                CType(FormView1.FindControl("Hyperlink1"), HyperLink).Visible = False

            End If
        End If
    End Sub
    
    
    Protected Sub btnErrorReport_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        'Session("ReportItem") = Request.Url.AbsoluteUri.Split("?"c)(1).ToString
        Session("ReportItem") = Request.Url.AbsoluteUri.ToString
        Dim s_url As String
        s_url = "~/ErrorReportC.aspx" '+ Request.Url.AbsoluteUri.Split("?"c)(1)
        'Response.Redirect(s_url)
        Response.Write("<script>window.open('../ErrorReportC.aspx','newwindow','height=600, width=820')</script>")



    End Sub
End Class
