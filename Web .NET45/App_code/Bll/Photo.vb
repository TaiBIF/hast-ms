
Public Class Photo

    Private _collectionid As Integer
    Private _name As String
    Private _filepath As String
    Private _description As String


    Public Sub New(ByVal collectionid As Integer, ByVal name As String, ByVal filepath As String, ByVal description As String)
        MyBase.New()
        _collectionid = collectionid
        _name = name
        _filepath = filepath
        _description = description
    End Sub

    Public ReadOnly Property CollectionID() As Integer
        Get
            Return _collectionid
        End Get
    End Property

    Public ReadOnly Property Name() As String
        Get
            Return _name
        End Get
    End Property
    Public ReadOnly Property Filepath() As String
        Get
            Return _filepath
        End Get
    End Property
    Public ReadOnly Property Description() As String
        Get
            Return _description
        End Get
    End Property
End Class