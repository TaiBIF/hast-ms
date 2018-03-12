Imports Microsoft.VisualBasic
Imports System.Math

'###############################################
'本類別處理資料庫讀取原始資料，轉換至前端介面顯示的格式
'###############################################


Public Class HAST

#Region "經緯度轉換"

    Private _Lng As Single '經度
    Private _Lat As Single '緯度

    Public Shared Function checkChar(ByVal strInputString As String) As Integer   '檢查特殊符號

        Dim strCheckChar() As String = {"-", "%", "$", "#", ";", "!", "(", ")", "?", "*", "&", "/", "+", "=", "'", "~", "`", ">", "<", ":", "^"}

        Dim i As Integer
        Dim intErrorChar As Integer

        For i = 0 To UBound(strCheckChar, 1) 'UBound取得為最高可用陣列的維數，所以不用減1
            If strInputString.Contains(strCheckChar(i)) Then
                intErrorChar = -1   '若有特殊字元，則錯誤碼=-1，累加錯誤碼<0，表示輸入不合法符號
            Else
                intErrorChar = 0
            End If
        Next

        Return intErrorChar

    End Function



    Public Shared Function LongitudeDMS(ByVal Lng As Double) As String
        '轉換十進位經度至度分秒格式

        Dim strLng As String
        Dim absLng As Double
        Dim EW As String

        If Lng < 0 Then
            EW = "W"
        Else
            EW = "E"
        End If

        absLng = Abs(Lng)
        strLng = Int(absLng).ToString + "°"
        strLng += Int((absLng - Int(absLng)) * 60).ToString + Chr(39)
        strLng += Int(Round(((absLng - Int(absLng)) * 60 - Int((absLng - Int(absLng)) * 60)) * 60, 0)).ToString + Chr(34)
        strLng += EW

        Return strLng

    End Function

    Public Shared Function LatitudeDMS(ByVal Lat As Double) As String
        '轉換十進位緯度至度分秒格式
        Dim strLat As String
        Dim absLat As Double
        Dim NS As String

        If Lat < 0 Then
            NS = "S"
        Else
            NS = "N"
        End If

        absLat = Abs(Lat)
        strLat = Int(absLat).ToString + "°"
        strLat += Int((absLat - Int(absLat)) * 60).ToString + Chr(39)
        strLat += Int(Round(((absLat - Int(absLat)) * 60 - Int((absLat - Int(absLat)) * 60)) * 60, 0)).ToString + Chr(34)
        strLat += NS

        Return strLat

    End Function

    Public Shared Function GPSInfoDMS(ByVal latitude As Double, ByVal longitude As Double) As String

        Dim strGPSInfo As String
        strGPSInfo = LatitudeDMS(latitude) + ", " + LongitudeDMS(longitude)
        Return strGPSInfo

    End Function

#End Region


#Region "人名"

    Enum PersonNameFormat
        FirstLast
        FirstLastC
        LastFirst
        LastFirstC
        CName
    End Enum

    Private _firstName As String
    Private _lastName As String
    Private _nameC As String


    Public Shared Function GetPersonName(ByVal firstName As String, ByVal lastName As String, ByVal nameC As String, ByVal personNameF As PersonNameFormat) As String

        Dim personName As String = ""

        Select Case personNameF
            Case 0
                personName = firstName + " " + lastName
            Case 1
                personName = firstName + " " + lastName + " " + nameC
            Case 2
                personName = lastName + ", " + firstName
            Case 3
                personName = lastName + ", " + firstName + nameC

        End Select

        Return personName

    End Function

#End Region



#Region "學名"




#End Region

End Class
