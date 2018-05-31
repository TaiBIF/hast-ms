Imports Microsoft.VisualBasic

'設定頁面排序方式

Public Interface ISort

    Property SortBy() As String

    Sub SetSortBy(ByVal sortItem As String)


End Interface
