Imports System.Web.Configuration
Imports System.Drawing
Imports System.Drawing.Imaging
Imports Subgurim.Controles
Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Imports HAST


Partial Class Specimens_SpecimenDetailE
    Inherits System.Web.UI.Page

    Dim dv As Data.DataView

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        SDSHast.ConnectionString = WebConfigurationManager.ConnectionStrings("HASTDBConnectionString").ConnectionString
        SDSHast.SelectCommandType = SqlDataSourceCommandType.StoredProcedure
        SDSHast.SelectCommand = "prHastDetailDynaQuery"

        'Dim txtSqlVerification As String

        If Not IsPostBack Then
            Try
                Dim txtSqlVerification As String
                Dim txtSqlImages As String
                txtSqlVerification = "SELECT SN, specimenOrderNum, verFamilyID, verGenusID, verSpeciesID, " & _
                                    " verFamilyE, verGenusE, verSpeciesE, " & _
                                    " verFamilyC, verGenusC, verSpeciesC, " & _
                                    " verificationNo, verifierNameFL, verifierName, verifierNameFLC1, verDate FROM vwHASTWeb " & _
                                    " WHERE ( verFamilyID IS NOT NULL AND verGenusID IS NOT NULL AND verSpeciesID IS NOT NULL ) "
                txtSqlImages = "SELECT SN, imageCode, publicWeb FROM vwImageDetail WHERE publicWeb = 1 "



                If Request.QueryString("specimenOrderNum") <> "" Then
                    Dim paramSpecimenOrderNum As New QueryStringParameter("specimenOrderNum", TypeCode.Int32, "specimenOrderNum")
                    paramSpecimenOrderNum.Direction = Data.ParameterDirection.Input
                    SDSHast.SelectParameters.Add(paramSpecimenOrderNum)

                    'SDSVerification.ConnectionString = WebConfigurationManager.ConnectionStrings("HASTDBConnectionString").ConnectionString
                    'SDSVerification.SelectCommandType = SqlDataSourceCommandType.Text

                    'txtSqlVerification = txtSqlVerification & " AND (specimenOrderNum = @specimenOrderNum ) "
                    'txtSqlVerification = txtSqlVerification & " ORDER BY verificationNo DESC "

                    'SDSVerification.SelectParameters.Add(paramSpecimenOrderNum)

                Else

                    If Request.QueryString("SN") <> "" Then
                        Dim paramSN As New QueryStringParameter("SN", TypeCode.Int32, "SN")
                        paramSN.Direction = Data.ParameterDirection.Input
                        SDSHast.SelectParameters.Add(paramSN)

                        'SDSVerification.ConnectionString = WebConfigurationManager.ConnectionStrings("HASTDBConnectionString").ConnectionString
                        'SDSVerification.SelectCommandType = SqlDataSourceCommandType.Text

                        'txtSqlVerification = txtSqlVerification & " AND (SN = @SN )"
                        'txtSqlVerification = txtSqlVerification & " ORDER BY verificationNo DESC "

                        'SDSVerification.SelectParameters.Add(paramSN)
                        'SDSVerification.SelectCommand = txtSqlVerification

                    End If


                End If



                FormView1.DataSourceID = SDSHast.ID

                dv = SDSHast.Select(New DataSourceSelectArguments)

                If dv.Count > 0 Then
                    '列出鑑訂記錄
                    txtSqlVerification = txtSqlVerification & " AND SN = " & dv.Item(0).Item("SN").ToString
                    txtSqlVerification = txtSqlVerification & " ORDER BY verificationNo DESC "
                    SDSVerification.ConnectionString = WebConfigurationManager.ConnectionStrings("HASTDBConnectionString").ConnectionString
                    SDSVerification.SelectCommand = txtSqlVerification

                    '列出生態影像
                    txtSqlImages = txtSqlImages & " AND SN = " & dv.Item(0).Item("SN").ToString
                    SDSImages.ConnectionString = WebConfigurationManager.ConnectionStrings("HASTDBConnectionString").ConnectionString
                    SDSImages.SelectCommand = txtSqlImages

                    '處理權限查詢
                    If Session("RequestPage") = "HastQuery" Then
                        CType(FormView1.FindControl("Label1"), Label).Visible = True
                        CType(FormView1.FindControl("LabelSN"), Label).Visible = True
                    Else
                        CType(FormView1.FindControl("Label1"), Label).Visible = False
                        CType(FormView1.FindControl("LabelSN"), Label).Visible = False
                    End If


                    dv = SDSVerification.Select(New DataSourceSelectArguments)
                    If dv.Count = 0 Then
                        LabelVerification.Visible = False
                    Else
                        LabelVerification.Visible = True
                    End If

                    dv = SDSImages.Select(New DataSourceSelectArguments)
                    If dv.Count = 0 Then
                        LabelLivingImage.Visible = False
                    Else
                        LabelLivingImage.Visible = True
                    End If

                End If


                dv.Dispose()
            Catch ex As SqlException

                Response.Write("File not found!")

            Catch ex As Exception

                Response.Write("File not found!")


            End Try
        End If




    End Sub

    Protected Sub FormView1_ItemCreated(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormView1.ItemCreated



        dv = SDSHast.Select(New DataSourceSelectArguments)

        If Not dv Is Nothing Then
            Try


                If dv.Count > 0 Then

                    If dv.Item(0).Item("imageFile").ToString <> "" Then

                        Dim strFilePath As String

                        strFilePath = ImageFilePath.GetImageFilePath(dv.Item(0).Item("imageFile").ToString, "SpecimenSmall")

                        CType(FormView1.FindControl("ImageSpecimenSamll"), System.Web.UI.WebControls.Image).ImageUrl = strFilePath
                        CType(FormView1.FindControl("ImageSpecimenSamll"), System.Web.UI.WebControls.Image).AlternateText = dv.Item(0).Item("imageFile").ToString

                        Dim strLinkSpecimenImage As String

                        strLinkSpecimenImage = "http://gissrv1.sinica.edu.tw/lizardtech/iserv/calcrgn?cat=plant_sid&item=S_"
                        strLinkSpecimenImage = strLinkSpecimenImage & dv.Item(0).Item("imageFile").ToString.PadLeft(6, "0")
                        strLinkSpecimenImage = strLinkSpecimenImage & ".SID&style=default/view.xsl&wid=800&hei=800&browser=win_ns6&plugin=false"

                        CType(FormView1.FindControl("HyperLinkSpecimenImage"), HyperLink).NavigateUrl = strLinkSpecimenImage
                        CType(FormView1.FindControl("HyperLinkSpecimenImage"), HyperLink).Target = "_blank"

                    Else
                        CType(FormView1.FindControl("ImageSpecimenSamll"), System.Web.UI.WebControls.Image).Visible = False

                    End If


                    '處理GPS空值
                    If System.DBNull.Value.Equals(dv.Item(0).Item("WGS84Lat")) = False And System.DBNull.Value.Equals(dv.Item(0).Item("WGS84Lng")) = False Then

                        CType(FormView1.FindControl("GPSInfoLabel"), System.Web.UI.WebControls.Label).Text = GetGpsInfo(dv.Item(0).Item("WGS84Lat"), dv.Item(0).Item("WGS84Lng"))

                    End If

                End If

            Catch ex As SqlException

                Response.Write("File not found!")

            Catch ex As Exception

                Response.Write("File not found!")


            End Try

            dv.Dispose()
        End If


        ' =================== 製作縮圖 ===================
        '縮圖寬高上限
        'Dim MaxLength As Integer = 100
        '縮圖寬度
        'Dim ThumbWidth As Integer
        '縮圖高度
        'Dim ThumbHeight As Integer

        '以 System.Drawing.Image 類別建立 Photo 物件, 以讀取原始圖
        'Dim Photo As System.Drawing.Image
        '將原始圖讀入 Photo 物件

        '        Dim testString As String = strFilePath
        ' Returns "Shipping List".
        'MsgBox(strFilePath)
        'strFilePath = Replace(strFilePath, "http://img.hast.biodiv.tw/Album", "\\hast3\Album$")
        'strFilePath = Replace(strFilePath, "http://img.hast.biodiv.tw/thumb", "\\hast3\thumb$")
        'strFilePath = Replace(strFilePath, "/", "\")
        'MsgBox(aString)

        'If File.Exists(strFilePath) Then

        '    Photo = System.Drawing.Image.FromFile(strFilePath)

        'End If
    End Sub

    Protected Sub DataList2_ItemCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList2.ItemCreated



        dv = SDSImages.Select(New DataSourceSelectArguments)
        If Not dv Is Nothing Then
            Try


                Dim strFilePath As String
                strFilePath = ImageFilePath.GetImageFilePath(dv.Item(e.Item.ItemIndex).Item("imageCode"), "thumb")

                CType(e.Item.FindControl("Image1"), System.Web.UI.WebControls.Image).ImageUrl = strFilePath
                CType(e.Item.FindControl("Image1"), System.Web.UI.WebControls.Image).AlternateText = dv.Item(e.Item.ItemIndex).Item("imageCode").ToString

                dv.Dispose()

            Catch ex As SqlException

                Response.Write("File not found!")

            Catch ex As Exception

                Response.Write("File not found!")


            End Try
        End If

    End Sub


    Public Function GetGpsInfo(ByVal latitude As Double, ByVal longitude As Double) As String

        Return GPSInfoDMS(latitude, longitude)

    End Function


    Protected Sub btnErrorReport_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        'Session("ReportItem") = Request.Url.AbsoluteUri.Split("?"c)(1).ToString
        Session("ReportItem") = Request.Url.AbsoluteUri.ToString
        'Dim s_url As String
        's_url = "~/ErrorReportC.aspx" '+ Request.Url.AbsoluteUri.Split("?"c)(1)
        'Response.Redirect(s_url)
        Response.Write("<script>window.open('../ErrorReportE.aspx','newwindow','height=600, width=820')</script>")

    End Sub
End Class
