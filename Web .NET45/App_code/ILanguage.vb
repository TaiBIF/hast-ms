Imports Microsoft.VisualBasic

Public Enum Language
    Zh
    En
End Enum

'設定頁面語言

Public Interface ILanguage

    ReadOnly Property Language() As String

    Sub SetLanguage(ByVal alanguage As Language)

End Interface
