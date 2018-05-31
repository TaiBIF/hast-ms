Imports Microsoft.VisualBasic
Imports System
Imports System.Net
Imports System.Net.Mail
Imports System.Configuration


Public Class Utilities


    Public Shared Sub SendMail(ByVal from As String, ByVal [to] As String, ByVal subject As String, ByVal body As String)
        ' Configure mail client
        Dim mailClient As New SmtpClient(ConfigurationManager.AppSettings("MailServer"))
        ' Set credentials (for SMTP servers that require authentication)
        mailClient.Credentials = New NetworkCredential(ConfigurationManager.AppSettings("MailUsername"), ConfigurationManager.AppSettings("MailPassword"))
        ' Create the mail message
        Dim mailMessage As New MailMessage(from, [to], subject, body)
        'Dim mailMessage As New MailMessage(from, [to])
        ' Send mail
        mailClient.Send(mailMessage)

        Dim copy As New MailAddress("twflora@gate.sinica.edu.tw")
        mailMessage.CC.Add(copy)

        mailClient.Send(mailMessage)

    End Sub

    Public Shared Sub ReportError(ByVal strReport As String, ByVal title As String)
        ' get the current date and time
        Dim dateTime__1 As String = DateTime.Now.ToLongDateString() + ", at " + DateTime.Now.ToShortTimeString()
        ' stores the Report message
        Dim errorReport As String = Convert.ToString("Error Repoert ") & dateTime__1
        ' obtain the page that generated the error
        'Dim context As System.Web.HttpContext = System.Web.HttpContext.Current
        'errorReport += vbLf & vbLf & " Page location: " + context.Request.RawUrl
        errorReport += strReport
        ' build the error message
        'errorReport += vbLf & vbLf & " Message: " + ex.Message
        'errorReport += vbLf & vbLf & " Source: " + ex.Source
        'errorReport += vbLf & vbLf & " Method: " + ex.TargetSite
        'errorReport += vbLf & vbLf & " Stack Trace: " & vbLf & vbLf + ex.StackTrace
        ' send error email in case the option is activated in Web.Config
        'If BalloonShopConfiguration.EnableErrorLogEmail Then
        Dim from As String = ConfigurationManager.AppSettings("MailFrom")
        Dim [to] As String = ConfigurationManager.AppSettings("ErrorLogEmail")
        Dim subject As String = title
        Dim body As String = errorReport
        SendMail(from, [to], subject, body)

        'End If
    End Sub



    'Public Shared Sub LogError(ex As Exception)
    '    ' get the current date and time
    '    Dim dateTime__1 As String = DateTime.Now.ToLongDateString() + ", at " + DateTime.Now.ToShortTimeString()
    '    ' stores the error message
    '    Dim errorMessage As String = Convert.ToString("Exception generated on ") & dateTime__1
    '    ' obtain the page that generated the error
    '    Dim context As System.Web.HttpContext = System.Web.HttpContext.Current
    '    errorMessage += vbLf & vbLf & " Page location: " + context.Request.RawUrl
    '    ' build the error message
    '    errorMessage += vbLf & vbLf & " Message: " + ex.Message
    '    errorMessage += vbLf & vbLf & " Source: " + ex.Source
    '    errorMessage += vbLf & vbLf & " Method: " + ex.TargetSite
    '    errorMessage += vbLf & vbLf & " Stack Trace: " & vbLf & vbLf + ex.StackTrace
    '    ' send error email in case the option is activated in Web.Config
    '    If BalloonShopConfiguration.EnableErrorLogEmail Then
    '        Dim from As String = BalloonShopConfiguration.MailFrom
    '        Dim [to] As String = BalloonShopConfiguration.ErrorLogEmail
    '        Dim subject As String = "BalloonShop Error Report"
    '        Dim body As String = errorMessage
    '        SendMail(from, [to], subject, body)
    '    End If
    'End Sub


End Class

