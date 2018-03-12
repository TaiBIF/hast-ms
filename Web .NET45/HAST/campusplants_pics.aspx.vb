Imports System.Drawing
Imports System.Drawing.Imaging
Imports Subgurim.Controles
Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration
Imports HAST

Partial Class HAST_campusplants_pics
    Inherits System.Web.UI.Page

    Dim dv As Data.DataView
    Dim dv0, dv1, dv2, dv3 As DataView

    Private dsSpeciesDetail As New DataSet
    Private dataAdapter As New SqlDataAdapter


    Dim connSetting As ConnectionStringSettings = WebConfigurationManager.ConnectionStrings("HASTDBConnectionString")
    Dim conn As SqlConnection




    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            DBBind()

        End If

    End Sub


    Protected Sub DBBind()


        Dim connSetting As ConnectionStringSettings = WebConfigurationManager.ConnectionStrings("HASTDBConnectionString")
        Dim conn As SqlConnection = New SqlConnection(connSetting.ConnectionString)

        Try


            Dim strSQL As String = ""
            Dim sqlCommand As New SqlCommand

            '依傳入頁面不同，選擇查詢
            'Select Case Request.QueryString("QP")
            '   Case "YuanYangLake"
            strSQL = "prSinicaFloraImageMap"


            sqlCommand.CommandText = strSQL
            sqlCommand.Connection = conn
            sqlCommand.CommandType = CommandType.StoredProcedure

            Dim paramtTheme As New SqlParameter("theme", SqlDbType.Int)
            paramtTheme.Direction = Data.ParameterDirection.Input
            Dim strTheme As String = Request.QueryString("theme")
            Select Case Request.QueryString("theme")
                Case "1"
                    paramtTheme.Value = Request.QueryString("theme")
                Case "2"
                    paramtTheme.Value = Request.QueryString("theme")
                Case "3"
                    paramtTheme.Value = Request.QueryString("theme")
                Case "4"
                    paramtTheme.Value = Request.QueryString("theme")
                Case Else
                    paramtTheme.Value = "1"
            End Select

            sqlCommand.Parameters.Add(paramtTheme)

            Dim paramClassID As New SqlParameter("classID", SqlDbType.Int)
            paramClassID.Direction = Data.ParameterDirection.Input
            If Request.QueryString("theme") = 4 Then
                Select Case Request.QueryString("classID")
                    Case "1"
                        paramClassID.Value = Request.QueryString("classID")
                        sqlCommand.Parameters.Add(paramClassID)
                    Case "2"
                        paramClassID.Value = Request.QueryString("classID")
                        sqlCommand.Parameters.Add(paramClassID)
                    Case "3"
                        paramClassID.Value = Request.QueryString("classID")
                        sqlCommand.Parameters.Add(paramClassID)
                    Case "4"
                        paramClassID.Value = Request.QueryString("classID")
                        sqlCommand.Parameters.Add(paramClassID)
                    Case Else
                End Select
            Else
            End If



            'Dim dataAdapter = New SqlDataAdapter(sqlCommand)
            dataAdapter = New SqlDataAdapter
            dataAdapter.SelectCommand = sqlCommand



            conn.Open()
            dataAdapter.Fill(dsSpeciesDetail)



            '學名資料
            'dv0 = New DataView
            'dv0.Table = dsSpeciesDetail.Tables(0)
            'dv0.RowFilter = "familyID = " & Request.QueryString("familyID")
            'dv0.Sort = "speciesE ASC"


            'DetailsViewSpecies.DataSource = dv0
            'DetailsViewSpecies.DataBind()

            '標本標籤
            'dv1 = New DataView
            'dv1.Table = dsSpeciesDetail.Tables(1)
            ''dv1.RowFilter = "familyID = " & Request.QueryString("familyID")
            'dv1.Sort = "specimenOrderNum ASC"



            'GridViewSpecimens.DataSource = dv1
            'GridViewSpecimens.DataBind()








            '生態影像

            dv2 = New DataView
            dv2.Table = dsSpeciesDetail.Tables(0)
            'dv2.RowFilter = "familyID = " & Request.QueryString("familyID")

            If dv2.Count = 0 Then

            Else
                dv2.Sort = "imgCode ASC"
                'DataListImages.DataSource = dv2
                'DataListImages.DataBind()

                Repeater1.DataSource = dv2
                Repeater1.DataBind()

            End If



            '溫室資料
            'dv1 = New DataView
            'dv1.Table = dsSpeciesDetail.Tables(1)
            ''dv1.RowFilter = "familyID = " & Request.QueryString("familyID")
            'dv1.Sort = "speciesOrderNum ASC"
            'GridViewSpecimens.DataSource = dv1
            'GridViewSpecimens.DataBind()


            '分佈資訊

            'dv3 = New DataView
            'dv3.Table = dsSpeciesDetail.Tables(1)
            'dv3.RowFilter = "WGS84Lat IS NOT NULL AND WGS84Lng IS NOT NULL"

            ''If dv3.Count = 0 Then
            'If dv1.Count = 0 Then
            'Else

            '    'dv2.RowFilter = "familyID = " & Request.QueryString("familyID")
            '    'dv3.Sort = "imageCode ASC"
            '    'Dim tmpTable As DataTable = dv3.ToTable("GPSInfo", True, "specimenOrderNum", "WGS84Lat", "WGS84Lng", "verSpeciesE", "verSpeciesC", "districtC", "GPSInfo")
            '    Dim tmpTable As DataTable = dv3.ToTable("GPSInfo", True, "specimenOrderNum", "WGS84Lat", "WGS84Lng", "verSpeciesE", "verSpeciesC", "districtC")



            '    '處理google map標誌資訊
            '    Dim col As New DataColumn("info", GetType(String))
            '    Dim strColExpression As String

            '    strColExpression = ""
            '    strColExpression += " 'HAST ID: ' "
            '    strColExpression += " + '<a href='"
            '    'strColExpression += " + 'chr(34)' "
            '    strColExpression += " + '../Specimens/SpecimenDetailc.aspx?specimenOrderNum=' "
            '    strColExpression += " + [specimenOrderNum] "
            '    'strColExpression += " + 'chr(34)' "
            '    strColExpression += " + ' target=_blank' "
            '    strColExpression += " + '>' "
            '    strColExpression += " + [specimenOrderNum] "
            '    strColExpression += " + '</a>' "
            '    strColExpression += " + '<br />'"
            '    strColExpression += " + [verSpeciesE] "
            '    strColExpression += " + '<br />'"
            '    strColExpression += " + [verSpeciesC] "
            '    strColExpression += " + '<br />'"
            '    strColExpression += " + [districtC]"
            '    strColExpression += " + '<br />'"

            '    strColExpression += " + [WGS84Lat]"
            '    strColExpression += "+ ',' + [WGS84Lng]"




            '    Dim strFilter As String
            '    strFilter = "WGS84Lat IS NOT NULL AND WGS84Lng IS NOT NULL"
            '    tmpTable.Select(strFilter)

            '    '改先過濾再加欄位？
            '    col.Expression = strColExpression
            '    tmpTable.Columns.Add(col)




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


        strFilePath = ImageFilePath.GetImageFilePath(dv2.Item(e.Item.ItemIndex).Item("imgCode"), "Album")

        CType(e.Item.FindControl("Image1"), System.Web.UI.WebControls.Image).ImageUrl = strFilePath
        CType(e.Item.FindControl("Image1"), System.Web.UI.WebControls.Image).AlternateText = dv2.Item(e.Item.ItemIndex).Item("imgCode").ToString

        'CType(e.Item.FindControl("Hyperlink1"), System.Web.UI.WebControls.Image).ImageUrl = strFilePath

        'CType(e.Item.FindControl("test"), System.Web.UI.HtmlControls.HtmlContainerControl).Style.Add("background-picture", strFilePath)

        'e.Item.FindControl("test")

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

            'If Photo.Height > Photo.Width Then

            '    Dim cutHeight As Integer
            '    cutHeight = Photo.Height - Photo.Width
            '    Dim cloneRect As System.Drawing.Rectangle = New Rectangle(0, 0, 0, cutHeight)
            '    Photo = Photo.Clone(cloneRect)

            'End If


        End If


    End Sub


End Class
