Imports Microsoft.VisualBasic
Imports System.Data
Imports System.IO

'本類別處理生態影像縮圖、網頁展示圖、原始檔及標本影像縮圖

Public Class ImageFilePath


    Public Shared Function GetImageFilePath(ByVal imageFile As String, ByVal imageCase As String) As String

        'imageCase 預設值
        '   Album   \Album\image000
        '   thumb   \thumb\thumb000
        '   Archive \Archive\archive000
        '   SpecimenSmall   \SpecimenSmall\SpecimenSmall


        Dim strImgFilePath As String
        Dim subDir As String '定義次目錄
        'If imageCase = "Album" Then    '網頁顯示大圖800x600 
        '    subDir = "image"
        'Else                            '縮圖thumb 或典藏檔 archive
        '    subDir = imageCase
        'End If

        strImgFilePath = "http://img.hast.biodiv.tw/"
        subDir = imageCase

        Select Case imageCase
            Case "Album"
                subDir = "image"
            Case "Archive"
                strImgFilePath = "\\hast3\"
            Case Else

        End Select

        strImgFilePath += imageCase & "/"



        If IsNumeric(imageFile) Then ' 如果查詢檔名結果imageFile可以轉為數字，則以數字檔名處理

            Dim intFileName As Integer
            intFileName = CInt(imageFile)

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

                    strImgFilePath = strImgFilePath & subDir & strFolderName

                    Exit For

                Else

                End If

            Next j


            Dim intFileName4 As Integer
            intFileName4 = CInt(Right(imageFile, 4))

            Dim i As Integer

            For i = 0 To 9  ' 處理第二層 0-9 路徑

                '找最後四位數

                If intFileName4 = 0 Then

                    i = 9
                    '(i * 1000 + 1 <= intFileName4 And intFileName4 <= (i + 1) * 1000) Then


                    ''   If i * 1000 + 1 <= CLng(Right(imageFile, 4)) <= (i + 1) * 1000 Then
                    'strImgFilePath = strImgFilePath & "/" & i & "/"

                    Exit For

                ElseIf (i * 1000 + 1 <= intFileName4 And intFileName4 <= (i + 1) * 1000) Then

                    '   If i * 1000 + 1 <= CLng(Right(imageFile, 4)) <= (i + 1) * 1000 Then
                    'strImgFilePath = strImgFilePath & "/" & i & "/"

                    Exit For
                Else
                End If

            Next i

            strImgFilePath = strImgFilePath & "/" & i & "/"


        Else ' 如果查詢檔名結果imageFile無法轉為數字，則進入文字檔名資料夾處理

            strImgFilePath += subDir & "StringFileName/"
            'Return result & ".jpg"

        End If

        Select Case imageCase
            Case "SpecimenSmall"
                imageFile = "S_" & imageFile.PadLeft(6, "0")    '假如是找標本影像，在前面+"S_"
            Case "Archive"
                strImgFilePath = Replace(strImgFilePath, "/", "\")
                strImgFilePath = Replace(strImgFilePath, "Archive", "Archive$", 1, 1)
        End Select


        Return strImgFilePath & imageFile & ".jpg"

    End Function

End Class
