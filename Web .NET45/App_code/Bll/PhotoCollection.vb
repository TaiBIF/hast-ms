
Public Class PhotoCollection

    Private _name As String
    Private _description As String

    Public Sub New(ByVal name As String, ByVal description As String)
        MyBase.New()
        _name = name
        _description = description
    End Sub


    Public ReadOnly Property name() As String
        Get
            Return _name
        End Get
    End Property

    Public ReadOnly Property description() As String
        Get
            Return _description
        End Get
    End Property



End Class
