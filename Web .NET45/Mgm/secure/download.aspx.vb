
Partial Class Mgm_secure_download
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        '暫時移到http://img.hast.biodiv.tw/imageDownload/download.aspx

        Dim user_request As String = Request.QueryString("imageCode")

        Dim strDownloadFilePath As String
        strDownloadFilePath = ImageFilePath.GetImageFilePath(user_request, "Archive")

        '設定回傳圖檔為TIF檔或JPG檔

        Dim strDownloadTIF As String
        Dim strDownloadJPG As String

        strDownloadTIF = Replace(strDownloadFilePath, ".jpg", ".TIF")
        strDownloadJPG = strDownloadFilePath

        With Response

            .ClearHeaders()
            .Clear()
            .Expires = 0
            .Buffer = True
            .ContentType = "application/save-as"

            If System.IO.File.Exists(strDownloadTIF) Then

                'With Response
                .AddHeader("content-disposition", "attachment; filename=" & user_request & ".TIF")
                .WriteFile(strDownloadTIF)
                .End()
                .Flush()

            ElseIf System.IO.File.Exists(strDownloadJPG) Then

                'With Response               
                .AddHeader("content-disposition", "attachment; filename=" & user_request & ".JPG")
                .WriteFile(strDownloadJPG)
                .End()
                .Flush()

            Else

                .Write("無檔案")

            End If

        End With

    End Sub

End Class
