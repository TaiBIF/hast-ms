
Imports System.Web.Script.Serialization
Imports System.Data
Imports ASPSnippets.TwitterAPI
Imports ASPSnippets.GoogleAPI
Imports ASPSnippets.FaceBookAPI



Partial Class ErrorReportE
    Inherits System.Web.UI.Page


    Dim strReportItem As String

    Public Class FaceBookUser
        Public Property Id() As String
            Get
                Return m_Id
            End Get
            Set(ByVal value As String)
                m_Id = value
            End Set
        End Property
        Private m_Id As String
        Public Property Name() As String
            Get
                Return m_Name
            End Get
            Set(ByVal value As String)
                m_Name = value
            End Set
        End Property
        Private m_Name As String
        Public Property UserName() As String
            Get
                Return m_UserName
            End Get
            Set(ByVal value As String)
                m_UserName = value
            End Set
        End Property
        Private m_UserName As String
        Public Property PictureUrl() As String
            Get
                Return m_PictureUrl
            End Get
            Set(ByVal value As String)
                m_PictureUrl = value
            End Set
        End Property
        Private m_PictureUrl As String
        Public Property Email() As String
            Get
                Return m_Email
            End Get
            Set(ByVal value As String)
                m_Email = value
            End Set
        End Property
        Private m_Email As String

    End Class

    Public Class GoogleProfile
        Public Property Id() As String
            Get
                Return m_Id
            End Get
            Set(ByVal value As String)
                m_Id = value
            End Set
        End Property
        Private m_Id As String
        Public Property DisplayName() As String
            Get
                Return m_DisplayName
            End Get
            Set(ByVal value As String)
                m_DisplayName = value
            End Set
        End Property
        Private m_DisplayName As String
        Public Property Image() As Image
            Get
                Return m_Image
            End Get
            Set(ByVal value As Image)
                m_Image = value
            End Set
        End Property
        Private m_Image As Image
        Public Property Emails() As List(Of Email)
            Get
                Return m_Emails
            End Get
            Set(ByVal value As List(Of Email))
                m_Emails = value
            End Set
        End Property
        Private m_Emails As List(Of Email)
        Public Property Gender() As String
            Get
                Return m_Gender
            End Get
            Set(ByVal value As String)
                m_Gender = value
            End Set
        End Property
        Private m_Gender As String
        Public Property ObjectType() As String
            Get
                Return m_ObjectType
            End Get
            Set(ByVal value As String)
                m_ObjectType = value
            End Set
        End Property
        Private m_ObjectType As String
    End Class

    Public Class Email
        Public Property Value() As String
            Get
                Return m_Value
            End Get
            Set(ByVal value As String)
                m_Value = value
            End Set
        End Property
        Private m_Value As String
        Public Property Type() As String
            Get
                Return m_Type
            End Get
            Set(ByVal value As String)
                m_Type = value
            End Set
        End Property
        Private m_Type As String
    End Class

    Public Class Image
        Public Property Url() As String
            Get
                Return m_Url
            End Get
            Set(ByVal value As String)
                m_Url = value
            End Set
        End Property
        Private m_Url As String
    End Class



    Protected Sub Login(ByVal sender As Object, ByVal e As EventArgs)

    End Sub




    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

        FaceBookConnect.API_Key = "1672664559621661"
        FaceBookConnect.API_Secret = "9f178a411e06d7c66f21f80552b0ec89"

        TwitterConnect.API_Key = "GJV3mDYdAvFga3W8R4SzJamTt"
        TwitterConnect.API_Secret = "PsfDqOJpRwca6cAIHmT0nX4u2NbebSQZIFavDjR1N6cX3CJt6a"

        GoogleConnect.ClientId = "334669344746-v833j7ggt9mggsdu53usug07bqpr51fh.apps.googleusercontent.com"
        GoogleConnect.ClientSecret = "xoB5c8ejztoo8yU4HVi9qywH"
        GoogleConnect.RedirectUri = Request.Url.AbsoluteUri.Split("?"c)(0)

        'Dim intDiffUrl As Int32
        'Dim strUrl As String = Request.Url.AbsoluteUri.Split("?"c)(0)
        'Dim strUrlFull As String = Request.Url.AbsoluteUri.ToString


        'strOauthProvider = ""
        strReportItem = ""

        If Not Session("ReportItem") Is Nothing Then
            'LabelReportItem.Text = Session("ReportItem").ToString

            strReportItem = Session("ReportItem").ToString.Split("?"c)(1)
            strReportItem = strReportItem.Replace("=", "")
            LabelReportItem.Text = strReportItem

        End If



        If Not IsPostBack Then
            Dim strOauthProvider As String = ""

            Dim code As String = Request.QueryString("code")

            If Not String.IsNullOrEmpty(Request.QueryString("code")) Then

                'Google+登入控制
                'If Not String.IsNullOrEmpty(Request.QueryString("code")) And Not String.IsNullOrEmpty(Request.QueryString("state")) Then
                If Not String.IsNullOrEmpty(Request.QueryString("state")) Then
                    Dim GoogleCode As String = Request.QueryString("code")
                    Dim json As String = GoogleConnect.Fetch("me", GoogleCode)
                    Dim profile As GoogleProfile = New JavaScriptSerializer().Deserialize(Of GoogleProfile)(json)
                    'lblId.Text = profile.Id
                    'lblName.Text = profile.DisplayName
                    'lblEmail.Text = profile.Emails.Find(Function(email) email.Type = "account").Value
                    'lblGender.Text = profile.Gender
                    'lblType.Text = profile.ObjectType
                    'ProfileImage.ImageUrl = profile.Image.Url
                    'pnlProfile.Visible = True
                    'btnLogin.Enabled = False

                    strOauthProvider = "@Google"
                    labelUserID.Text = profile.Id + strOauthProvider

                    textBoxName.Text = profile.DisplayName
                    textBoxEmail.Text = profile.Emails.Find(Function(email) email.Type = "account").Value

                    labelUserID.Visible = False
                    textBoxName.Enabled = False
                    textBoxEmail.Enabled = False

                    pnlErrorReport.Visible = True
                    pnlLogin.Visible = False

                    'btnTwitterLogin.Enabled = False
                    btnLogout.Visible = True




                    'ElseIf Not String.IsNullOrEmpty(code) Then
                Else
                    Dim data As String = FaceBookConnect.Fetch(code, "me")
                    Dim faceBookUser As FaceBookUser = New JavaScriptSerializer().Deserialize(Of FaceBookUser)(data)
                    faceBookUser.PictureUrl = String.Format("https://graph.facebook.com/{0}/picture", faceBookUser.Id)


                    strOauthProvider = "@Facebook"
                    labelUserID.Text = faceBookUser.Id + strOauthProvider
                    textBoxName.Text = faceBookUser.Name
                    textBoxEmail.Text = faceBookUser.Email

                    labelUserID.Visible = False
                    textBoxName.Enabled = False
                    textBoxEmail.Enabled = False

                    pnlErrorReport.Visible = True
                    pnlLogin.Visible = False

                    'btnTwitterLogin.Enabled = False
                    btnLogout.Visible = True



                End If

                If Request.QueryString("error") = "access_denied" Then
                    ClientScript.RegisterClientScriptBlock(Me.GetType(), "alert", "alert('Access denied.')", True)
                End If


                ' '' Facebook登入控制
                'If Request.QueryString("error") = "access_denied" Then
                '    ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('User has denied access.')", True)
                '    Return
                'End If

                'Dim code As String = Request.QueryString("code")
                'If Not String.IsNullOrEmpty(code) Then
                '    Dim data As String = FaceBookConnect.Fetch(code, "me")
                '    Dim faceBookUser As FaceBookUser = New JavaScriptSerializer().Deserialize(Of FaceBookUser)(data)
                '    faceBookUser.PictureUrl = String.Format("https://graph.facebook.com/{0}/picture", faceBookUser.Id)
                '    'pnlFaceBookUser.Visible = True
                '    pnlErrorReport.Visible = True


                '    'lblId.Text = faceBookUser.Id
                '    'lblUserName.Text = faceBookUser.UserName
                '    'lblName.Text = faceBookUser.Name
                '    'lblEmail.Text = faceBookUser.Email
                '    'ProfileImage.ImageUrl = faceBookUser.PictureUrl

                '    btnFacebookLogin.Enabled = False
                '    pnlLogin.Visible = False

                'End If

                'twitter登入控制
            Else

                If TwitterConnect.IsAuthorized Then
                    Dim twitter As New TwitterConnect()

                    'LoggedIn User Twitter Profile Details
                    Dim dt As DataTable = twitter.FetchProfile()
                    'imgProfile.ImageUrl = dt.Rows(0)("profile_image_url").ToString()
                    'lblName.Text = dt.Rows(0)("name").ToString()
                    'lblTwitterId.Text = dt.Rows(0)("Id").ToString()
                    'lblScreenName.Text = dt.Rows(0)("screen_name").ToString()
                    'lblDescription.Text = dt.Rows(0)("description").ToString()
                    'lblTweets.Text = dt.Rows(0)("statuses_count").ToString()
                    'lblFollowers.Text = dt.Rows(0)("followers_count").ToString()
                    'lblFriends.Text = dt.Rows(0)("friends_count").ToString()
                    'lblFavorites.Text = dt.Rows(0)("favourites_count").ToString()
                    'lblLocation.Text = dt.Rows(0)("location").ToString()
                    'tblTwitter.Visible = True
                    strOauthProvider = "@twitter"
                    labelUserID.Text = dt.Rows(0)("Id").ToString() & strOauthProvider
                    textBoxName.Text = dt.Rows(0)("name").ToString()
                    textBoxEmail.Text = ""


                    'Any other User Twitter Profile Details. Here jQueryFAQs
                    dt = twitter.FetchProfile("jQueryFAQs")
                    'imgOtherProfile.ImageUrl = dt.Rows(0)("profile_image_url").ToString()
                    'lblOtherName.Text = dt.Rows(0)("name").ToString()
                    'lblOtherTwitterId.Text = dt.Rows(0)("Id").ToString()
                    'lblOtherScreenName.Text = dt.Rows(0)("screen_name").ToString()
                    'lblOtherDescription.Text = dt.Rows(0)("description").ToString()
                    'lblOtherTweets.Text = dt.Rows(0)("statuses_count").ToString()
                    'lblOtherFollowers.Text = dt.Rows(0)("followers_count").ToString()
                    'lblOtherFriends.Text = dt.Rows(0)("friends_count").ToString()
                    'lblOtherFavorites.Text = dt.Rows(0)("favourites_count").ToString()
                    'lblOtherLocation.Text = dt.Rows(0)("location").ToString()
                    'tblOtherTwitter.Visible = True



                    labelUserID.Visible = False
                    textBoxName.Enabled = False
                    'textBoxEmail.Text



                    pnlErrorReport.Visible = True
                    pnlLogin.Visible = False

                    'btnTwitterLogin.Enabled = False



                End If
                If TwitterConnect.IsDenied Then
                    ClientScript.RegisterStartupScript(Me.[GetType](), "key", "alert('User has denied access.')", True)
                End If
            End If

        End If

    End Sub

    Protected Sub btnFacebookLogin_Click(ByVal sender As Object, ByVal e As ImageClickEventArgs) Handles btnFacebookLogin.Click

        FaceBookConnect.Authorize("user_photos,email", Request.Url.AbsoluteUri.Split("?"c)(0))

    End Sub

    Protected Sub btnTwitterLogin_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnTwitterLogin.Click

        If Not TwitterConnect.IsAuthorized Then
            Dim twitter As New TwitterConnect()
            twitter.Authorize(Request.Url.AbsoluteUri.Split("?"c)(0))
        End If

    End Sub

    Protected Sub btnGoogleLogin_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnGoogleLogin.Click

        GoogleConnect.Authorize("profile", "email")

    End Sub

    Protected Sub btnLogout_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLogout.Click

        If Not String.IsNullOrEmpty(Request.QueryString("code")) And Not String.IsNullOrEmpty(Request.QueryString("state")) Then
            GoogleConnect.Clear()
        ElseIf Not String.IsNullOrEmpty(Request.QueryString("code")) Then
            FaceBookConnect.Logout(Request.QueryString("code"))

        End If


    End Sub

    Protected Sub btnSend_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSend.Click

        ' get the current date and time
        Dim dateTime__1 As String = DateTime.Now.ToLongDateString() + ", at " + DateTime.Now.ToShortTimeString()
        ' stores the Report message
        Dim strReport As String = Convert.ToString("Error Repoert ") & dateTime__1
        ' obtain the page that generated the error


        ' build the error message

        Dim strSourcePage As String = ""
        If Not Session("ReportItem") Is Nothing Then

            strSourcePage = Session("ReportItem").ToString




        End If

        strReport += vbLf & vbLf & " Source: " & strSourcePage

        strReport += vbLf & vbLf
        strReport += vbLf & vbLf & "================================================== "
        strReport += vbLf & vbLf & " Description of the Error: "
        strReport += vbLf & vbLf & textBoxError.Text
        strReport += vbLf & vbLf & "================================================== "
        strReport += vbLf & vbLf

        strReport += vbLf & vbLf & " Submitter Information:"
        strReport += vbLf & vbLf & "   Name: " & textBoxName.Text
        strReport += vbLf & vbLf & "   Email Address: " & textBoxEmail.Text
        strReport += vbLf & vbLf & "   Social Network ID: " & labelUserID.Text






        Dim from As String = ConfigurationManager.AppSettings("MailFrom")
        Dim [to] As String = ConfigurationManager.AppSettings("ErrorLogEmail")
        Dim subject As String = "[HAST] Misidentifications reports: " + dateTime__1
        Dim body As String = strReport
        Utilities.SendMail(from, [to], subject, body)
        'Utilities.ReportError(strReport)
        'Utilities.ReportError("test error report")


        If Not String.IsNullOrEmpty(Request.QueryString("code")) And Not String.IsNullOrEmpty(Request.QueryString("state")) Then
            GoogleConnect.Clear()
        ElseIf Not String.IsNullOrEmpty(Request.QueryString("code")) Then
            FaceBookConnect.Logout(Request.QueryString("code"))

        End If
        Session.Remove("ReportItem")
        Response.Write("<script language='javascript'>window.close();</" + "script>")


    End Sub


    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click

        If Not String.IsNullOrEmpty(Request.QueryString("code")) And Not String.IsNullOrEmpty(Request.QueryString("state")) Then
            GoogleConnect.Clear()
        ElseIf Not String.IsNullOrEmpty(Request.QueryString("code")) Then
            FaceBookConnect.Logout(Request.QueryString("code"))

        End If

        Response.Write("<script language='javascript'>window.close();</" + "script>")

    End Sub
End Class