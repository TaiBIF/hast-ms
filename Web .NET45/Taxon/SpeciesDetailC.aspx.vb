Imports System.Drawing
Imports System.Drawing.Imaging
Imports Subgurim.Controles
Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration

Partial Class Taxon_SpeciesDetailC
    Inherits System.Web.UI.Page

    Dim dv As Data.DataView
    Dim dv0, dv1, dv2, dv3 As DataView

    Private dsSpeciesDetail As New DataSet
    Private dataAdapter As New SqlDataAdapter


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        'QP means QueryPage
        Select Case Request.QueryString("QP")

            Case "Begonia"


            Case "YuanYangLake"

                Dim litCss As New Literal()
                litCss.Text = "<style type=" & Chr(34) & "text/css" & Chr(34) & ">" & vbCr & vbLf
                litCss.Text += "#header_menu {margin-left:300px;" & vbCr & vbLf
                litCss.Text += "background-color:White;}" & vbCr & vbLf
                litCss.Text += "</style>"

                Me.Header.Controls.Add(litCss)

            Case "SinicaOutSkirts"

                Dim litCss As New Literal()
                litCss.Text = "<style type=" & Chr(34) & "text/css" & Chr(34) & ">" & vbCr & vbLf
                litCss.Text += "#header_menu {margin-left:300px;" & vbCr & vbLf
                litCss.Text += "background-color:White;}" & vbCr & vbLf
                litCss.Text += "</style>"

                Me.Header.Controls.Add(litCss)

            Case Else

        End Select


        If Not IsPostBack Then

            DBBind()


        End If
        

        '需個別處理\project\目錄呼叫時的格式

        GMap1.Key = "ABQIAAAAq0jWk53lNGxTlvPuHGCBdxRZTCaQ_hMcYcflNPLplZuLiN4SNRS6ZSmHjuYtWNdiEjpNkAxZpIXvxA"
        GMap2.Key = "ABQIAAAAq0jWk53lNGxTlvPuHGCBdxRZTCaQ_hMcYcflNPLplZuLiN4SNRS6ZSmHjuYtWNdiEjpNkAxZpIXvxA"

        Select Case Request.QueryString("QP")

            Case "YuanYangLake"

                GMap1.Visible = False
                GMap1.Width = 0
                GMap1.Width = 0

                GMap2.Height = 500
                GMap2.Width = 960
                GMap2.setCenter(New Subgurim.Controles.GLatLng(24.58, 121.42), 14)
                GMap2.mapType = GMapType.GTypes.Hybrid


            Case "SinicaOutSkirts"

                GMap1.Visible = False
                GMap1.Width = 0
                GMap1.Width = 0

                GMap2.Height = 500
                GMap2.Width = 960
                GMap2.setCenter(New Subgurim.Controles.GLatLng(25.04, 121.62), 14)
                GMap2.mapType = GMapType.GTypes.Hybrid

            Case Else

                GMap1.Height = 500
                GMap1.Width = 520
                GMap1.setCenter(New Subgurim.Controles.GLatLng(0, 0), 1)
                GMap1.mapType = GMapType.GTypes.Hybrid

                GMap2.Height = 500
                GMap2.Width = 420
                GMap2.setCenter(New Subgurim.Controles.GLatLng(23.5, 120.98), 7)
                GMap2.mapType = GMapType.GTypes.Hybrid

        End Select



    End Sub

    'Public Function GetFirstSPImage(ByVal speciesID As Integer) As String
    '可能沒用的程式碼 2011/08/23
    '    Return PhotoDB.GetFirstSPImage(speciesID)
    'End Function

    Protected Sub Page_PreInit(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreInit


        '選擇MasterPage
        'QP means QueryPage
        Select Case Request.QueryString("QP")

            Case "Begonia"
                Me.MasterPageFile = "~/MasterPageBegonia.master"

            Case "YuanYangLake"
                Me.MasterPageFile = "~/MasterPageYYLC.master"

            Case "SinicaOutskirts"
                Me.MasterPageFile = "~/MasterPageSinicaOutskirts.master"
               

            Case Else

        End Select

    End Sub

    Protected Sub GridViewSpecimens_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridViewSpecimens.PageIndexChanging

        GridViewSpecimens.PageIndex = e.NewPageIndex
        DBBind()

    End Sub

    Protected Sub DBBind()


        Dim connSetting As ConnectionStringSettings = WebConfigurationManager.ConnectionStrings("HASTDBConnectionString")
        Dim conn As SqlConnection = New SqlConnection(connSetting.ConnectionString)

        Try

           
            Dim strSQL As String = ""
            Dim sqlCommand As New SqlCommand

            '依傳入頁面不同，選擇查詢
            Select Case Request.QueryString("QP")
                Case "YuanYangLake"
                    strSQL = "prAreaCollection"

                    '若查詢為prAreaColllectiondy時, 改用以下這段參數
                    If Request.QueryString("lID") <> "" Then
                        Dim paramLID As New SqlParameter("lID", SqlDbType.Int)
                        paramLID.Direction = Data.ParameterDirection.Input
                        paramLID.Value = Request.QueryString("lID")
                        sqlCommand.Parameters.Add(paramLID)
                    End If

                Case "SinciaOutskirts"
                    strSQL = "prAreaCollection"

                    '若查詢為prAreaColllection時, 改用以下這段參數
                    If Request.QueryString("lID") <> "" Then
                        Dim paramLID As New SqlParameter("lID", SqlDbType.Int)
                        paramLID.Direction = Data.ParameterDirection.Input
                        paramLID.Value = Request.QueryString("lID")
                        sqlCommand.Parameters.Add(paramLID)
                    End If

                Case Else
                    strSQL = "prSpeciesDetail"

                    If Request.QueryString("speciesID") <> "" Then
                        Dim paramSpeciesID As New SqlParameter("speciesID", SqlDbType.Int)
                        paramSpeciesID.Direction = Data.ParameterDirection.Input
                        paramSpeciesID.Value = Request.QueryString("speciesID")
                        sqlCommand.Parameters.Add(paramSpeciesID)
                    End If

            End Select

            sqlCommand.CommandText = strSQL
            sqlCommand.Connection = conn
            sqlCommand.CommandType = CommandType.StoredProcedure



            '此段可能要改
            If Request.QueryString("QP") = "Begonia" Then
                Dim paramPublicWeb As New SqlParameter("publicWeb", SqlDbType.Bit)
                paramPublicWeb.Direction = Data.ParameterDirection.Input
                paramPublicWeb.Value = False
                sqlCommand.Parameters.Add(paramPublicWeb)

                Dim paramShowGreenhouse As New SqlParameter("showGreenhouse", SqlDbType.Bit)
                paramShowGreenhouse.Direction = Data.ParameterDirection.Input
                paramShowGreenhouse.Value = 1
                sqlCommand.Parameters.Add(paramShowGreenhouse)
            End If



            'If Request.QueryString("showGreenhouse") <> "" Then
            '    Dim paramShowGreenhouse As New SqlParameter("showGreenhouse", SqlDbType.Int)
            '    paramshowGreenhouse.Direction = Data.ParameterDirection.Input
            '    paramshowGreenhouse.Value = Request.QueryString("showGreenhouse")
            '    sqlCommand.Parameters.Add(paramshowGreenhouse)
            'End If


            If Request.QueryString("speciesID") <> "" Or Request.QueryString("lID") <> "" Then
                'If Request.QueryString("speciesID") <> "" Then
                'If Request.QueryString("lID") <> "" Then   若 request page 則改檢查lID

                dataAdapter = New SqlDataAdapter
                dataAdapter.SelectCommand = sqlCommand

                conn.Open()
                dataAdapter.Fill(dsSpeciesDetail)

                '學名資料
                dv0 = New DataView
                dv0.Table = dsSpeciesDetail.Tables(0)
                'dv0.RowFilter = "familyID = " & Request.QueryString("familyID")
                'dv0.Sort = "speciesE ASC"
                DetailsViewSpecies.DataSource = dv0
                DetailsViewSpecies.DataBind()

                '標本標籤
                dv1 = New DataView
                dv1.Table = dsSpeciesDetail.Tables(1)
                'dv1.RowFilter = "familyID = " & Request.QueryString("familyID")
                dv1.Sort = "specimenOrderNum ASC"
                GridViewSpecimens.DataSource = dv1
                GridViewSpecimens.DataBind()

                '生態影像
                dv2 = New DataView
                dv2.Table = dsSpeciesDetail.Tables(2)
                'dv2.RowFilter = "familyID = " & Request.QueryString("familyID")

                If dv2.Count = 0 Then

                Else
                    dv2.Sort = "imageCode ASC"
                    DataListImages.DataSource = dv2
                    DataListImages.DataBind()
                End If



                '溫室資料
                'dv1 = New DataView
                'dv1.Table = dsSpeciesDetail.Tables(1)
                ''dv1.RowFilter = "familyID = " & Request.QueryString("familyID")
                'dv1.Sort = "speciesOrderNum ASC"
                'GridViewSpecimens.DataSource = dv1
                'GridViewSpecimens.DataBind()


                '分佈資訊

                dv3 = New DataView
                dv3.Table = dsSpeciesDetail.Tables(1)
                dv3.RowFilter = "WGS84Lat IS NOT NULL AND WGS84Lng IS NOT NULL"

                'If dv3.Count = 0 Then
                If dv1.Count = 0 Then
                Else

                    'dv2.RowFilter = "familyID = " & Request.QueryString("familyID")
                    'dv3.Sort = "imageCode ASC"
                    Dim tmpTable As DataTable = dv3.ToTable("GPSInfo", True, "specimenOrderNum", "WGS84Lat", "WGS84Lng", "verSpeciesE", "verSpeciesC", "districtC")
                    'Dim tmpTable As DataTable = dv3.ToTable("GPSInfo", True, "specimenOrderNum", "WGS84Lat", "WGS84Lng")

                    '處理google map標誌資訊
                    Dim col As New DataColumn("info", GetType(String))
                    Dim strColExpression As String

                    strColExpression = ""
                    strColExpression += " 'HAST ID: ' "
                    strColExpression += " + '<a href='"
                    'strColExpression += " + 'chr(34)' "
                    strColExpression += " + '../Specimens/SpecimenDetailC.aspx?specimenOrderNum=' "
                    strColExpression += " + [specimenOrderNum] "
                    'strColExpression += " + 'chr(34)' "
                    strColExpression += " + ' target=_blank' "
                    strColExpression += " + '>' "
                    strColExpression += " + [specimenOrderNum] "
                    strColExpression += " + '</a>' "
                    strColExpression += " + '<br />'"
                    strColExpression += " + [verSpeciesE] "
                    strColExpression += " + '<br />'"
                    strColExpression += " + [verSpeciesC] "
                    strColExpression += " + '<br />'"
                    strColExpression += " + [districtC]"
                    strColExpression += " + '<br />'"
                    strColExpression += " + [WGS84Lat]"
                    strColExpression += "+ ',' + [WGS84Lng]"


                    col.Expression = strColExpression
                    tmpTable.Columns.Add(col)


                    Dim strFilter As String
                    strFilter = "WGS84Lat IS NOT NULL AND WGS84Lng IS NOT NULL"
                    tmpTable.Select(strFilter)

                    If tmpTable.Rows.Count = 0 Then
                    Else
                        '=====若request page為project，則GMap1不處理============================

                        Select Case Request.QueryString("QP")

                            Case "YuanYangLake"

                            Case "SinicaOutSkirts"

                            Case Else
                                GMap1.DataSource = tmpTable
                                GMap1.DataBind()

                        End Select

                        GMap2.DataSource = tmpTable
                        GMap2.DataBind()

                    End If

                    '加入overviewMap
                    Dim controlOverViewMap As GControl
                    controlOverViewMap = New GControl((GControl.preBuilt.GOverviewMapControl))
                    GMap2.addControl(controlOverViewMap)

                    '加入SmallMapControl
                    Dim controlSmallMap As GControl
                    controlSmallMap = New GControl(GControl.preBuilt.SmallMapControl, New GControlPosition(GControlPosition.position.Top_Right))
                    GMap2.addControl(controlSmallMap)

                    '加入MenuMapTypeControl
                    Dim controlMenuMapType As GControl
                    controlMenuMapType = New GControl(GControl.preBuilt.MenuMapTypeControl, New GControlPosition(GControlPosition.position.Top_Left))
                    GMap2.addControl(controlMenuMapType)

                End If

               
            End If

        Catch ex As SqlException

            Response.Write("File not found!")

        Catch ex As Exception

            Response.Write("File not found!")

        Finally
            conn.Close()
            conn.Dispose()


        End Try

    End Sub

    Protected Sub DataListImages_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataListImages.ItemDataBound

        'dv = SDSImages.Select(New DataSourceSelectArguments)

        Dim strFilePath As String
        strFilePath = ImageFilePath.GetImageFilePath(dv2.Item(e.Item.ItemIndex).Item("imageCode"), "thumb")

        CType(e.Item.FindControl("Image1"), System.Web.UI.WebControls.Image).ImageUrl = strFilePath
        CType(e.Item.FindControl("Image1"), System.Web.UI.WebControls.Image).AlternateText = dv2.Item(e.Item.ItemIndex).Item("imageCode").ToString


        ' =================== 製作縮圖 ===================
        '縮圖寬高上限
        'Dim MaxLength As Integer = 100
        '縮圖寬度
        'Dim ThumbWidth As Integer
        '縮圖高度
        'Dim ThumbHeight As Integer

        '以 System.Drawing.Image 類別建立 Photo 物件, 以讀取原始圖
        Dim Photo As System.Drawing.Image
        '將原始圖讀入 Photo 物件

        '        Dim testString As String = strFilePath
        ' Returns "Shipping List".
        strFilePath = Replace(strFilePath, "http://img.hast.biodiv.tw/thumb", "\\hast3\thumb$")
        strFilePath = Replace(strFilePath, "/", "\")

        If File.Exists(strFilePath) Then

            Photo = System.Drawing.Image.FromFile(strFilePath)

        End If

        '============================================已建縮圖
        '計算縮圖的寬度與高度 
        'If Photo.Width > Photo.Height Then
        '    ThumbWidth = MaxLength
        '    ThumbHeight = Photo.Height / Photo.Width * MaxLength
        '    'ThumbHeight = MaxLength * 3 / 4
        '    'CType(e.Item.FindControl("Image1"), System.Web.UI.WebControls.Image).CssClass = "ls"
        'Else
        '    ThumbHeight = MaxLength
        '    ThumbWidth = Photo.Width / Photo.Height * MaxLength
        '    'ThumbWidth = MaxLength * 3 / 4
        '    'CType(e.Item.FindControl("Image1"), System.Web.UI.WebControls.Image).CssClass = "pt"
        'End If
        '==============================================
        '以 Bitmap 類別建立 Thumb 物件, 以存放縮圖
        'Dim Thumb As New Bitmap(Photo, ThumbWidth, ThumbHeight)

        '將縮圖儲存到伺服器上
        'Thumb.Save(Page.MapPath("~/thumb/") & ServerFilename)

        'CType(e.Item.FindControl("Image1"), System.Web.UI.WebControls.Image).Width = ThumbWidth


    End Sub

    Protected Sub GMap2_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles GMap2.DataBinding

        GMap2.DataGInfoWindowTextField = "info"

    End Sub

End Class
