Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.Common
Imports System.Data.SqlClient

Public NotInheritable Class GenericDataAccess

    Shared Sub New()

    End Sub

    '執行命令並以DataTable物件返回結果
    Public Shared Function ExecuteSelectCommand(ByVal command As DbCommand) As DataTable

        '將返回的DataTable
        Dim table As DataTable

        Try
            '打開數據連接
            command.Connection.Open()
            '執行命令，將結果存入DataTable
            Dim reader As DbDataReader = command.ExecuteReader()
            table = New DataTable()
            table.Load(reader)

            '關閉reader
            reader.Close()

        Catch ex As Exception
            Throw (ex)
        Finally

            command.Connection.Close()

        End Try

        Return table

    End Function


    Public Shared Function CreateCommand(ByVal db As String) As DbCommand


        Dim dataProviderName As String = ""
        Dim connectionString As String = ""

        Select Case db

            Case "hastdb"
                dataProviderName = HastConfiguration.HastdbProviderName
                connectionString = HastConfiguration.HastdbConnection
            Case "ScientificName"
                dataProviderName = HastConfiguration.ScientificNameProviderName
                connectionString = HastConfiguration.ScientificNameConnection

            Case "description"
                dataProviderName = HastConfiguration.DescriptionProviderName
                connectionString = HastConfiguration.DescriptionConnection

            Case "HASTAnnounce"
                dataProviderName = HastConfiguration.HastAnnounceProviderName
                connectionString = HastConfiguration.HastAnnounceConnection

        End Select


        '創建一個新的數據提供器工廠
        Dim factory As DbProviderFactory = DbProviderFactories.GetFactory(dataProviderName)
        '獲取特定於某種數據庫的connection對象
        Dim conn As DbConnection = factory.CreateConnection()
        '設置連接字串
        conn.ConnectionString = connectionString
        '創建特定於某種數據庫的command對象
        Dim comm As DbCommand = conn.CreateCommand()
        '為儲存過程設置命令類行
        comm.CommandType = CommandType.StoredProcedure
        '返回初始化後的command對象
        Return comm

    End Function


    '執行命令並以DataTable物件返回結果
    Public Shared Function ExecuteSelectCommandDataSet(ByVal command As DbCommand) As DataSet

        '將返回的DataTable
        Dim ds As DataSet

        Try
            '打開數據連接
            command.Connection.Open()
            '執行命令，將結果存入DataTable
            'Dim reader As DbDataReader = command.ExecuteReader()

            ds = New DataSet()


            Dim dataAdapter = New SqlDataAdapter(command)

            dataAdapter.Fill(ds)




        Catch ex As Exception
            Throw (ex)
        Finally

            command.Connection.Close()

        End Try

        Return ds


    End Function

End Class
