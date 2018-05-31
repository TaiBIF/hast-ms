Imports System.Drawing
Imports System.Drawing.Imaging
Imports Subgurim.Controles
Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration
Imports HAST


Partial Class HAST_plantinfo
    Inherits System.Web.UI.Page

    Dim dv As Data.DataView
    Dim dv0, dv1, dv2, dv3, dv4 As DataView

    Private dsSpeciesDetail As New DataSet
    Private dataAdapter As New SqlDataAdapter


    Dim connSetting As ConnectionStringSettings = WebConfigurationManager.ConnectionStrings("HASTDBConnectionString")
    Dim conn As SqlConnection


    Public Function GetImageFilePath(ByVal imageCode As String) As String

        Return ImageFilePath.GetImageFilePath(imageCode, "Album")

    End Function


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load



        If Not IsPostBack Then

            DBBind()

          


        End If

        GMap1.Key = "ABQIAAAAq0jWk53lNGxTlvPuHGCBdxRZTCaQ_hMcYcflNPLplZuLiN4SNRS6ZSmHjuYtWNdiEjpNkAxZpIXvxA"


        GMap1.Height = 800
        GMap1.Width = 800
        GMap1.setCenter(New Subgurim.Controles.GLatLng(25.042375, 121.61417), 17)
        GMap1.mapType = GMapType.GTypes.Normal

        '需個別處理\project\目錄呼叫時的格式

        'GMap1.Key = "ABQIAAAAq0jWk53lNGxTlvPuHGCBdxRZTCaQ_hMcYcflNPLplZuLiN4SNRS6ZSmHjuYtWNdiEjpNkAxZpIXvxA"
        'GMap2.Key = "ABQIAAAAq0jWk53lNGxTlvPuHGCBdxRZTCaQ_hMcYcflNPLplZuLiN4SNRS6ZSmHjuYtWNdiEjpNkAxZpIXvxA"

        'Select Case Request.QueryString("QP")

        '    Case "YuanYangLake"

        '        GMap1.Visible = False
        '        GMap1.Width = 0
        '        GMap1.Width = 0

        '        GMap2.Height = 500
        '        GMap2.Width = 960
        '        GMap2.setCenter(New Subgurim.Controles.GLatLng(24.58, 121.42), 14)
        '        GMap2.mapType = GMapType.GTypes.Hybrid


        '    Case "SinicaOutskirts"

        '        GMap1.Visible = False
        '        GMap1.Width = 0
        '        GMap1.Width = 0

        '        GMap2.Height = 500
        '        GMap2.Width = 960
        '        GMap2.setCenter(New Subgurim.Controles.GLatLng(25.04, 121.62), 14)
        '        GMap2.mapType = GMapType.GTypes.Hybrid

        '    Case "TaipeiSuburbs"

        '        GMap1.Visible = False
        '        GMap1.Width = 0
        '        GMap1.Width = 0

        '        GMap2.Height = 500
        '        GMap2.Width = 960
        '        GMap2.setCenter(New Subgurim.Controles.GLatLng(25.04, 121.62), 14)
        '        GMap2.mapType = GMapType.GTypes.Hybrid

        '    Case Else

        '        GMap1.Height = 500
        '        GMap1.Width = 520
        '        GMap1.setCenter(New Subgurim.Controles.GLatLng(0, 0), 1)
        '        GMap1.mapType = GMapType.GTypes.Hybrid

        '        GMap2.Height = 500
        '        GMap2.Width = 420
        '        GMap2.setCenter(New Subgurim.Controles.GLatLng(23.5, 120.98), 7)
        '        GMap2.mapType = GMapType.GTypes.Hybrid

        'End Select

    End Sub


    Protected Sub DBBind()


        Dim connSetting As ConnectionStringSettings = WebConfigurationManager.ConnectionStrings("HASTDBConnectionString")
        Dim conn As SqlConnection = New SqlConnection(connSetting.ConnectionString)

        Try

            Dim strSQL As String = ""
            Dim sqlCommand As New SqlCommand


            strSQL = "prSinicaSpeciesDetail"

            sqlCommand.CommandText = strSQL
            sqlCommand.Connection = conn
            sqlCommand.CommandType = CommandType.StoredProcedure

            Dim paramListID As New SqlParameter("listID", SqlDbType.Int)
            paramListID.Direction = Data.ParameterDirection.Input
            paramListID.Value = Request.QueryString("listID")
            sqlCommand.Parameters.Add(paramListID)



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

            Repeater2.DataSource = dv0
            Repeater2.DataBind()


            ''標本標籤
            'dv1 = New DataView
            'dv1.Table = dsSpeciesDetail.Tables(2)
            ''dv1.RowFilter = "familyID = " & Request.QueryString("familyID")
            'dv1.Sort = "specimenOrderNum ASC"



            ''GridViewSpecimens.DataSource = dv1
            ''GridViewSpecimens.DataBind()





            '生態影像


            dv2 = New DataView
            dv2.Table = dsSpeciesDetail.Tables(1)
            'dv2.RowFilter = "familyID = " & Request.QueryString("familyID")

            If dv2.Count = 0 Then

            Else
                dv2.Sort = "imageCode ASC"
                'DataListImages.DataSource = dv2
                'DataListImages.DataBind()

                Repeater1.DataSource = dv2
                Repeater1.DataBind()

                dv4 = New DataView
                dv4.Table = dsSpeciesDetail.Tables(1)
                'dv4.RowFilter = ""

                FormView1.DataSource = dv4.Item(0).DataView
                FormView1.DataBind()
                'CType(FormView1.FindControl("Image2"), System.Web.UI.WebControls.Image).ImageUrl = GetImageFilePath("imageCode")


            End If

            '分佈資訊

            dv3 = New DataView
            dv3.Table = dsSpeciesDetail.Tables(1)
            dv3.RowFilter = "WGS84Lat IS NOT NULL AND WGS84Lng IS NOT NULL"


            If dv3.Count = 0 Then
                'If dv1.Count = 0 Then
            Else

                'dv2.RowFilter = "familyID = " & Request.QueryString("familyID")
                'dv3.Sort = "imageCode ASC"
                'Dim tmpTable As DataTable = dv3.ToTable("GPSInfo", True, "specimenOrderNum", "WGS84Lat", "WGS84Lng", "verSpeciesE", "verSpeciesC", "districtC", "GPSInfo")
                Dim tmpTable As DataTable = dv3.ToTable("GPSInfo", True, "WGS84Lat", "WGS84Lng")



                '處理google map標誌資訊
                Dim col As New DataColumn("info", GetType(String))
                Dim strColExpression As String

                strColExpression = ""
                'strColExpression += " 'HAST ID: ' "
                'strColExpression += " + '<a href='"
                ''strColExpression += " + 'chr(34)' "
                'strColExpression += " + '../Specimens/SpecimenDetailc.aspx?specimenOrderNum=' "
                'strColExpression += " + [specimenOrderNum] "
                ''strColExpression += " + 'chr(34)' "
                'strColExpression += " + ' target=_blank' "
                'strColExpression += " + '>' "
                'strColExpression += " + [specimenOrderNum] "
                'strColExpression += " + '</a>' "
                'strColExpression += " + '<br />'"
                'strColExpression += " + [verSpeciesE] "
                'strColExpression += " + '<br />'"
                'strColExpression += " + [verSpeciesC] "
                'strColExpression += " + '<br />'"
                'strColExpression += " + [districtC]"
                'strColExpression += " + '<br />'"

                'strColExpression += " + [WGS84Lat]"
                'strColExpression += "+ ',' + [WGS84Lng]"




                Dim strFilter As String
                strFilter = "WGS84Lat IS NOT NULL AND WGS84Lng IS NOT NULL"
                tmpTable.Select(strFilter)

                '改先過濾再加欄位？
                'col.Expression = strColExpression
                'tmpTable.Columns.Add(col)



                If tmpTable.Rows.Count = 0 Then
                Else

                    GMap1.DataSource = tmpTable
                    GMap1.DataBind()
                    'GMap2.DataSource = tmpTable
                    'GMap2.DataBind()
                    '=====若request page為project，則GMap1不處理============================






                End If


                '    '加入overviewMap
                '    Dim controlOverViewMap As GControl
                '    controlOverViewMap = New GControl((GControl.preBuilt.GOverviewMapControl))
                '    GMap2.addControl(controlOverViewMap)

                '    '加入SmallMapControl
                '    Dim controlSmallMap As GControl
                '    controlSmallMap = New GControl(GControl.preBuilt.SmallMapControl, New GControlPosition(GControlPosition.position.Top_Right))
                '    GMap2.addControl(controlSmallMap)

                '    '加入MenuMapTypeControl
                '    Dim controlMenuMapType As GControl
                '    controlMenuMapType = New GControl(GControl.preBuilt.MenuMapTypeControl, New GControlPosition(GControlPosition.position.Top_Left))
                '    GMap2.addControl(controlMenuMapType)


               


            End If

            'End If



        Catch ex As SqlException

            Response.Write("File not found!")

        Catch ex As Exception

            Response.Write("File not found!")

        Finally
            conn.Close()
            conn.Dispose()

        End Try

    End Sub



    Protected Sub Repeater1_ItemDataBound(sender As Object, e As RepeaterItemEventArgs) Handles Repeater1.ItemDataBound

        Dim strFilePath As String


        'If dv2.Count = 0 Then
        '    MsgBox("HIHI")
        'End If


        strFilePath = ImageFilePath.GetImageFilePath(dv2.Item(e.Item.ItemIndex).Item("imageCode"), "Album")

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
        strFilePath = Replace(strFilePath, "http://img.hast.biodiv.tw/Album", "\\hast3\Album$")
        strFilePath = Replace(strFilePath, "/", "\")

        If File.Exists(strFilePath) Then

            Photo = System.Drawing.Image.FromFile(strFilePath)

        End If


    End Sub

End Class
