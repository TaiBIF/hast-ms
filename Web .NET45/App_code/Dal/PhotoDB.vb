Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Drawing.Imaging
Imports System.IO

Public Class PhotoDB
    Public Shared ReadOnly Property ConnectionString() As String
        Get
            Return ConfigurationManager.ConnectionStrings("SqlServerConnectionString").ConnectionString
        End Get
    End Property


    Public Shared Function InsertCollection(ByVal pc As PhotoCollection) As Boolean


        Dim conn As New SqlConnection()
        Dim cmd As New SqlCommand()

        Try

            conn.ConnectionString = PhotoDB.ConnectionString
            cmd.Connection = conn
            conn.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = "add_collection"

            ' Create a SqlParameter for each parameter in the stored procedure.
            Dim nameParam As New SqlParameter("@name", pc.name)
            Dim descParam As New SqlParameter("@desc", pc.description)
            cmd.Parameters.Add(nameParam)
            cmd.Parameters.Add(descParam)

            cmd.ExecuteNonQuery()

            Return True

        Catch ex As Exception


            Throw (ex)
        Finally

            conn.Close()
            conn.Dispose()

        End Try

    End Function

    Public Shared Function InsertPhoto(ByVal p As Photo) As Boolean

        'Declare the objects for data access
        Dim conn As New SqlConnection()
        Dim cmd As New SqlCommand()

        Try

            'set the connection string
            conn.ConnectionString = PhotoDB.ConnectionString
            cmd.Connection = conn
            conn.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = "add_photo"
            ' Create a SqlParameter for each parameter in the stored proc.
            Dim idParam As New SqlParameter("@path", p.Filepath)
            Dim cParam As New SqlParameter("@collectionID", p.CollectionID)
            Dim nameParam As New SqlParameter("@name", p.Name)
            Dim descParam As New SqlParameter("@desc", p.Description)
            'add each parameter to the command object
            cmd.Parameters.Add(cParam)
            cmd.Parameters.Add(idParam)
            cmd.Parameters.Add(nameParam)
            cmd.Parameters.Add(descParam)
            cmd.ExecuteNonQuery()

            Return True

        Catch ex As Exception
            Throw (ex)

        Finally

            conn.Close()
            conn.Dispose()

        End Try
    End Function


    Public Shared Function GetFirstImage(ByVal CollectionID As Object) As String

        Dim conn As New SqlConnection()
        Dim cmd As New SqlCommand()

        Try

            conn.ConnectionString = PhotoDB.ConnectionString
            cmd.Connection = conn
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = "get_first_photo"

            Dim idParam As New SqlParameter("@collectionID", CollectionID)
            cmd.Parameters.Add(idParam)


            Dim result As Object
            Dim previousConnectionState As ConnectionState = conn.State
            Try
                If conn.State = ConnectionState.Closed Then
                    conn.Open()
                End If
                result = cmd.ExecuteScalar()

            Finally
                If previousConnectionState = ConnectionState.Closed Then
                    conn.Close()
                End If
            End Try

            Return "upload/" & result

        Catch ex As Exception

            Throw (ex)

        Finally

            conn.Close()
            conn.Dispose()

        End Try

    End Function

    Public Shared Function GetFirstSPImage(ByVal speciesID As String) As String

        '取得該物種的第一張生態影像

        Dim conn As New SqlConnection()
        Dim cmd As New SqlCommand()

        Try

            conn.ConnectionString = PhotoDB.ConnectionString
            cmd.Connection = conn
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = "prGetFirstSPImage"

            Dim idParam As New SqlParameter("@speciesID", speciesID)
            cmd.Parameters.Add(idParam)


            Dim result As Object
            Dim previousConnectionState As ConnectionState = conn.State
            Try
                If conn.State = ConnectionState.Closed Then
                    conn.Open()
                End If
                result = cmd.ExecuteScalar()

            Finally
                If previousConnectionState = ConnectionState.Closed Then
                    conn.Close()
                End If
            End Try

            '回傳圖檔路徑
            Return ImageFilePath.GetImageFilePath(CStr(result), "image")

        Catch ex As Exception

            Throw (ex)

        Finally

            conn.Close()
            conn.Dispose()

        End Try

    End Function

    '已經由ImageFilePath.vb類別處理，之後刪除
    Public Shared Function GetImageFilePath(ByVal imageCode As String, ByVal imageCase As String) As String

        Dim strImgFilePath As String
        strImgFilePath = "http://img.hast.biodiv.tw/" & imageCase & "/"

        Dim subDir As String '定義次目錄
        If imageCase = "Album" Then    '網頁顯示大圖800x600 
            subDir = "image"
        Else                            '縮圖thumb 或典藏檔 archive
            subDir = imageCase
        End If


        If IsNumeric(imageCode) Then ' 如果查詢檔名結果imageCode可以轉為數字，則以數字檔名處理

            Dim intFileName As Integer
            intFileName = CInt(imageCode)

            Dim j As Integer

            For j = 0 To 99 '處理第一層img000路徑

                If j * 10000 + 1 <= intFileName And intFileName <= (j + 1) * 10000 Then

                    '加上補0程式碼
                    Dim strFolderName As String
                    Dim addZeroJ As Integer

                    strFolderName = CStr(j)

                    'Format()

                    addZeroJ = 3 - Len(strFolderName)   '計算少幾個"0"
                    '
                    ' 補"0"至3碼檔名

                    Do While addZeroJ > 0

                        strFolderName = "0" & strFolderName
                        addZeroJ = addZeroJ - 1

                    Loop

                    strImgFilePath = strImgFilePath & subDir & strFolderName ' strFilePath=strFilePath & J

                    Exit For

                Else

                End If

            Next j


            Dim intFileName4 As Integer
            intFileName4 = CInt(Right(imageCode, 4))

            Dim i As Integer

            For i = 0 To 9  ' 處理第二層 0-9 路徑

                '找最後四位數

                If intFileName4 = 0 Then

                    i = 9
                    '(i * 1000 + 1 <= intFileName4 And intFileName4 <= (i + 1) * 1000) Then


                    ''   If i * 1000 + 1 <= CLng(Right(imageCode, 4)) <= (i + 1) * 1000 Then
                    'strImgFilePath = strImgFilePath & "/" & i & "/"

                    Exit For

                ElseIf (i * 1000 + 1 <= intFileName4 And intFileName4 <= (i + 1) * 1000) Then

                    '   If i * 1000 + 1 <= CLng(Right(imageCode, 4)) <= (i + 1) * 1000 Then
                    'strImgFilePath = strImgFilePath & "/" & i & "/"

                    Exit For
                Else
                End If

            Next i

            strImgFilePath = strImgFilePath & "/" & i & "/"


        Else ' 如果查詢檔名結果imageCode無法轉為數字，則進入文字檔名資料夾處理

            strImgFilePath += subDir & "StringFileName/"
            'Return result & ".jpg"

        End If

        If imageCase = "SpecimenSmall" Then     '假如是找標本影像，在前面+"S_"
            imageCode = "S_" & imageCode
        End If

        Return strImgFilePath & imageCode & ".jpg"

    End Function

End Class
