Imports Microsoft.VisualBasic
Imports System.Configuration
Imports System.Data
Imports System.Data.Common


Public NotInheritable Class HastConfiguration

    '============================================================================================
    '設定資料連接
    '============================================================================================

    Private Shared m_hastdbConnectionString As String
    Private Shared m_hastdbProviderName As String

    Private Shared m_scientificNameConnectionString As String
    Private Shared m_scientificNameProviderName As String

    Private Shared m_descriptionConnectionString As String
    Private Shared m_descriptionProviderName As String

    Private Shared m_hastAnnounceConnectionString As String
    Private Shared m_hastAnnounceProviderName As String



    Shared Sub New()


        m_hastdbConnectionString = ConfigurationManager.ConnectionStrings("HASTDBConnectionString").ConnectionString
        m_hastdbProviderName = ConfigurationManager.ConnectionStrings("HASTDBConnectionString").ProviderName

        m_scientificNameConnectionString = ConfigurationManager.ConnectionStrings("ScientificNameConnectionString").ConnectionString
        m_scientificNameProviderName = ConfigurationManager.ConnectionStrings("ScientificNameConnectionString").ProviderName

        m_descriptionConnectionString = ConfigurationManager.ConnectionStrings("descriptionConnectionString").ConnectionString
        m_descriptionProviderName = ConfigurationManager.ConnectionStrings("descriptionConnectionString").ProviderName

        m_hastAnnounceConnectionString = ConfigurationManager.ConnectionStrings("HASTAnnounceConnectionString").ConnectionString
        m_hastAnnounceProviderName = ConfigurationManager.ConnectionStrings("HASTAnnounceConnectionString").ProviderName

    End Sub


    '連接Hastdb
    Public Shared ReadOnly Property HastdbConnection() As String
        Get
            Return m_hastdbConnectionString
        End Get
    End Property

    Public Shared ReadOnly Property HastdbProviderName() As String
        Get
            Return m_hastdbProviderName
        End Get
    End Property

    '連接ScientificName
    Public Shared ReadOnly Property ScientificNameConnection() As String
        Get
            Return m_scientificNameConnectionString
        End Get
    End Property

    Public Shared ReadOnly Property ScientificNameProviderName() As String
        Get
            Return m_scientificNameProviderName
        End Get
    End Property

    '連接Description
    Public Shared ReadOnly Property DescriptionConnection() As String
        Get
            Return m_descriptionConnectionString
        End Get
    End Property

    Public Shared ReadOnly Property DescriptionProviderName() As String
        Get
            Return m_descriptionProviderName
        End Get
    End Property

    '連接HastAnnounce
    Public Shared ReadOnly Property HastAnnounceConnection() As String
        Get
            Return m_hastAnnounceConnectionString
        End Get
    End Property

    Public Shared ReadOnly Property HastAnnounceProviderName() As String
        Get
            Return m_hastAnnounceProviderName
        End Get
    End Property

    '============================================================================================
    ' 設定頁面語言
    '============================================================================================
    Private m_language As String

    'Public Property PageLanguage(ByVal language As String) As String '設定頁面語言
    '    Get
    '        Select Case language
    '            Case "e.aspx"
    '                m_language = "En"
    '            Case Else
    '                m_language = "Ch"
    '        End Select
    '        Return m_language
    '    End Get
    '    Set(ByVal value As String)
    '        m_language = value
    '    End Set
    'End Property




End Class
