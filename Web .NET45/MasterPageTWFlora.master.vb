
Partial Class MasterPageTWFlora
    Inherits System.Web.UI.MasterPage
    Implements ILanguage

    Private m_language As String
    Public ReadOnly Property PageLanguage() As String Implements ILanguage.Language
        Get
            Return m_language
        End Get
        'Set(ByVal value As String)

        'End Set
    End Property

    Public Sub SetLanguage(ByVal alanguage As Language) Implements ILanguage.SetLanguage
        m_language = alanguage.ToString

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        SetLanguage(Language.Zh)

        SiteMapDataSource1.SiteMapProvider = "TWFloraC"

        Dim strQueryPath As String
        strQueryPath = (System.IO.Path.GetFileName(Request.PhysicalPath)).ToString.Replace("\", "/").ToLower
        strQueryPath = strQueryPath.Split(".aspx")(0).ToString.ToLower


        If strQueryPath.Contains("image") Then
            ImageTitle.ImageUrl = "~/images/imageQuery.jpg"
        ElseIf strQueryPath.Contains("specimen") Then
            ImageTitle.ImageUrl = "~/images/specimenQuery.jpg"
        ElseIf strQueryPath.Contains("news") Then
            ImageTitle.ImageUrl = "~/images/top01-ch.jpg"
        ElseIf strQueryPath.Contains("project") Then
            ImageTitle.ImageUrl = "~/images/top03-ch.jpg"
        ElseIf strQueryPath.Contains("info") Then
            ImageTitle.ImageUrl = "~/images/top04-ch.jpg"
        ElseIf strQueryPath.Contains("link") Then
            ImageTitle.ImageUrl = "~/images/top05-ch.jpg"

        Else
            ImageTitle.ImageUrl = "~/images/top05-ch.jpg"

        End If



        'Select Case strQueryPath
        '    Case "image"
        '        ImageTitle.ImageUrl = "http://www.hast.biodiv.tw/images/imageQuery.jpg"
        '    Case Else
        '        ImageTitle.ImageUrl = "http://www.hast.biodiv.tw/images/specimenQuery.jpg"
        'End Select

    End Sub
End Class

