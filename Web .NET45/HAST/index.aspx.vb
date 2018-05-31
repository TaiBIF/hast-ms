Imports System.Drawing
Imports System.Drawing.Imaging
Imports Subgurim.Controles
Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration
Imports HAST

Partial Class HAST_index
    Inherits System.Web.UI.Page

    Dim dv As Data.DataView
    Dim dv0, dv1, dv2, dv3 As DataView

    Private dsSpeciesDetail As New DataSet
    Private dataAdapter As New SqlDataAdapter

    Private dsSinicaFlora As New DataSet
    Private dataAdapter2 As New SqlDataAdapter

    Public Function GetImage(ByVal imageCode As String) As String

        Return ImageFilePath.GetImageFilePath(imageCode, "Album")

    End Function


    Protected Sub GridViewNewsSubject_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewNewsSubject.SelectedIndexChanged

        'DetailsViewNewsContent.Caption = "新聞內容"


    End Sub


    Protected Sub DBBind()


        Dim connSetting As ConnectionStringSettings = WebConfigurationManager.ConnectionStrings("HASTDBConnectionString")
        Dim conn As SqlConnection = New SqlConnection(connSetting.ConnectionString)

        'Try


        Dim strSQL As String = ""
        Dim sqlCommand As New SqlCommand

        '依傳入頁面不同, 選擇查詢
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

                'If Request.QueryString("speciesID") <> "" Then
                Dim paramSpeciesID As New SqlParameter("speciesID", SqlDbType.Int)
                paramSpeciesID.Direction = Data.ParameterDirection.Input
                'paramSpeciesID.Value = Request.QueryString("speciesID")
                paramSpeciesID.Value = "2501"
                sqlCommand.Parameters.Add(paramSpeciesID)
                'End If

        End Select

        sqlCommand.CommandText = strSQL
        sqlCommand.Connection = conn
        sqlCommand.CommandType = CommandType.StoredProcedure

        'If Request.QueryString("speciesID") <> "" Or Request.QueryString("lID") <> "" Then
        'If Request.QueryString("speciesID") <> "" Then
        'If Request.QueryString("lID") <> "" Then   若 request page 則改檢查lID

        dataAdapter = New SqlDataAdapter
        dataAdapter.SelectCommand = sqlCommand

        conn.Open()
        dataAdapter.Fill(dsSpeciesDetail)

        '學名資料
        'dv0 = New DataView
        'dv0.Table = dsSpeciesDetail.Tables(0)
        ''dv0.RowFilter = "familyID = " & Request.QueryString("familyID")
        ''dv0.Sort = "speciesE ASC"
        'DetailsViewSpecies.DataSource = dv0
        'DetailsViewSpecies.DataBind()



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

        Dim strSQL2 As String = ""
        Dim sqlCommand2 As New SqlCommand

        strSQL2 = "prSinicaFloraIssue"
        sqlCommand2.CommandText = strSQL2
        sqlCommand2.Connection = conn
        sqlCommand2.CommandType = CommandType.StoredProcedure

        dataAdapter2 = New SqlDataAdapter
        dataAdapter2.SelectCommand = sqlCommand2

        dataAdapter2.Fill(dsSinicaFlora)


        dv3 = New DataView
        dv3.Table = dsSinicaFlora.Tables(0)


        Repeater1.DataSource = dv3
        Repeater1.DataBind()

        'Repeater2.DataSource = dv3
        'Repeater2.DataBind()


        'End If


        'Catch ex As SqlException

        '    Response.Write("File not found!")

        'Catch ex As Exception

        '    Response.Write("File not found!")

        'Finally
        conn.Close()
        conn.Dispose()


        'End Try

    End Sub

    Protected Sub DataListImages_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataListImages.ItemDataBound

        'dv = SDSImages.Select(New DataSourceSelectArguments)

        Dim strFilePath As String
        'strFilePath = ImageFilePath.GetImageFilePath(dv2.Item(e.Item.ItemIndex).Item("imageCode"), "thumb")
        strFilePath = ImageFilePath.GetImageFilePath(dv2.Item(e.Item.ItemIndex).Item("imageCode"), "Album")

        CType(e.Item.FindControl("Image1"), System.Web.UI.WebControls.Image).ImageUrl = strFilePath
        CType(e.Item.FindControl("Image1"), System.Web.UI.WebControls.Image).AlternateText = dv2.Item(e.Item.ItemIndex).Item("imageCode").ToString


        ' =================== 製作縮圖 ===================
        '縮圖寬高上限
        Dim MaxLength As Integer = 250
        '縮圖寬度
        Dim ThumbWidth As Integer
        '縮圖高度
        Dim ThumbHeight As Integer

        '以 System.Drawing.Image 類別建立 Photo 物件, 以讀取原始圖
        Dim Photo As System.Drawing.Image
        '將原始圖讀入 Photo 物件

        '        Dim testString As String = strFilePath
        ' Returns "Shipping List".

        strFilePath = Replace(strFilePath, "http://img.hast.biodiv.tw/Album", "\\hast3\album$")

        strFilePath = Replace(strFilePath, "/", "\")

        If File.Exists(strFilePath) Then

            Photo = System.Drawing.Image.FromFile(strFilePath)



            '============================================已建縮圖
            '計算縮圖的寬度與高度 

            If Photo.Width > Photo.Height Then
                ThumbWidth = MaxLength
                ThumbHeight = Photo.Height / Photo.Width * MaxLength
                'ThumbHeight = MaxLength * 3 / 4
                'CType(e.Item.FindControl("Image1"), System.Web.UI.WebControls.Image).CssClass = "ls"
            Else

                ThumbWidth = MaxLength
                ThumbHeight = Photo.Height / Photo.Width * MaxLength
                'ThumbHeight = MaxLength
                'ThumbWidth = Photo.Width / Photo.Height * MaxLength


                'ThumbWidth = MaxLength * 3 / 4
                'CType(e.Item.FindControl("Image1"), System.Web.UI.WebControls.Image).CssClass = "pt"
            End If

            '==============================================
            '以 Bitmap 類別建立 Thumb 物件, 以存放縮圖
            Dim Thumb As New Bitmap(Photo, ThumbWidth, ThumbHeight)

            '將縮圖儲存到伺服器上
            'Thumb.Save(Page.MapPath("~/thumb/") & ServerFilename)

            CType(e.Item.FindControl("Image1"), System.Web.UI.WebControls.Image).Width = ThumbWidth

        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            DBBind()


        End If

        'GridViewNewsSubject.CssClass = "9u 12u(2)"



    End Sub

    Protected Sub Repeater1_ItemDataBound(sender As Object, e As RepeaterItemEventArgs) Handles Repeater1.ItemDataBound

        CType(e.Item.FindControl("Literal1"), System.Web.UI.WebControls.Literal).Text = dv3.Item(e.Item.ItemIndex).Item("noteAbstractC").ToString
        CType(e.Item.FindControl("LabelFocus"), System.Web.UI.WebControls.Label).Text = dv3.Item(e.Item.ItemIndex).Item("speciesC").ToString
        CType(e.Item.FindControl("LabelFocusE"), System.Web.UI.WebControls.Label).Text = dv3.Item(e.Item.ItemIndex).Item("speciesE").ToString

        Dim strLinkFocus As String = "plantinfo.aspx?listID="
        strLinkFocus += dv3.Item(e.Item.ItemIndex).Item("listID").ToString


        CType(e.Item.FindControl("LinkButton1"), System.Web.UI.WebControls.LinkButton).PostBackUrl = strLinkFocus
        CType(e.Item.FindControl("HyperLinkFocus"), HyperLink).NavigateUrl = strLinkFocus


    End Sub

    Protected Sub btnQuickSearch_Click(sender As Object, e As EventArgs) Handles btnQuickSearch.Click

        Dim strRedirectUrl As String
        strRedirectUrl = "QuickSearchResultC.aspx?"

        If textboxPlantName.Text.Trim <> "" Then
            strRedirectUrl = strRedirectUrl & "&plantName=" & textboxPlantName.Text.Trim
        End If


        'Dim intErrorCharSum As Integer = 0

        'If Request.QueryString("plantName") <> "" Then
        '    intErrorCharSum = checkChar(Request.QueryString("plantName"))
        'End If




        '>>>>>>>>>>>>>>>>


        Response.Redirect(strRedirectUrl)
    End Sub
End Class
