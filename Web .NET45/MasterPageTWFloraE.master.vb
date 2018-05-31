
Partial Class MasterPageTWFloraE
    Inherits System.Web.UI.MasterPage
    Implements ILanguage


    Private m_language As String

    Public ReadOnly Property PageLanguage() As String Implements ILanguage.Language
        Get
            Return m_language
        End Get
      
    End Property

    Public Sub SetLanguage(ByVal alanguage As Language) Implements ILanguage.SetLanguage
        m_language = alanguage.ToString

    End Sub


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        SetLanguage(Language.En)

        SiteMapDataSource1.SiteMapProvider = "TWFloraE"

        Dim strQueryPath As String
        strQueryPath = (System.IO.Path.GetFileName(Request.PhysicalPath)).ToString.Replace("\", "/").ToLower
        strQueryPath = strQueryPath.Split(".aspx")(0).ToString.ToLower


        If strQueryPath.Contains("image") Then
            ImageTitle.ImageUrl = "~/images/imageQuery.jpg"
        ElseIf strQueryPath.Contains("specimen") Then
            ImageTitle.ImageUrl = "~/images/specimenQuery.jpg"
        ElseIf strQueryPath.Contains("news") Then
            ImageTitle.ImageUrl = "~/images/top01-en.jpg"
        ElseIf strQueryPath.Contains("project") Then
            ImageTitle.ImageUrl = "~/images/top03-en.jpg"
        ElseIf strQueryPath.Contains("info") Then
            ImageTitle.ImageUrl = "~/images/top04-en.jpg"
        ElseIf strQueryPath.Contains("link") Then
            ImageTitle.ImageUrl = "~/images/top05-en.jpg"

        Else
            ImageTitle.ImageUrl = "~/images/top05-en.jpg"

        End If
    End Sub

  
End Class

