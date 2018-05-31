Imports System.Data
Imports System.Data.SqlClient


Partial Class Mgm_QrySpecimenImage
    Inherits System.Web.UI.Page

    Dim SqlCommand1 As New SqlCommand

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        Dim strCountFile As String
        Dim strMaxDisk As String

        If Not IsPostBack Then

            '開啟資料庫連線

            Dim strConnection As String = "integrated security=SSPI;data source=G6;persist security info=False;initial catalog=HASTDB"

            Dim sqlConn As New SqlClient.SqlConnection(strConnection)

            sqlConn.Open()


            '撰寫sql指令



            SqlCommand1.Connection = sqlConn
            SqlCommand1.CommandType = CommandType.StoredProcedure

            SqlCommand1.CommandText = "prCountSpecImgFile"
            strCountFile = SqlCommand1.ExecuteScalar


            'SqlCommand1 = Nothing
            SqlCommand1.CommandText = "prMAXdiskNo"
            strMaxDisk = SqlCommand1.ExecuteScalar

            '
            '關閉連線
            SqlCommand1.Dispose()
            sqlConn.Close()
            sqlConn.Dispose()

            Label1.Text = "累計標本影像共 " & strCountFile & " 張"
            Label2.Text = "儲存光碟編號至 " & strMaxDisk & " 號"

        End If

    End Sub

    Protected Sub btnQry_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnQry.Click
        '開啟資料庫連線

        Dim strConnection As String = "integrated security=SSPI;data source=G6;persist security info=False;initial catalog=HASTDB"

        Dim sqlConn As New SqlClient.SqlConnection(strConnection)

        sqlConn.Open()

        '撰寫SQL指令

        Dim strSpecimenNum As String

        'strSpecimenNum = "S_" & Format(CInt(Me.TextBoxSpecimenOrderNum.Text), "000000")
        strSpecimenNum = Me.TextBoxSpecimenOrderNum.Text

        SqlCommand1.Connection = sqlConn

        SqlCommand1.CommandText = "Select SpecimenOrderNum, diskNo from specImgFile where SpecimenOrderNum ='" & strSpecimenNum & "'"


        '將SQL指令的查詢結果，利用DataGrid呈現在畫面上

        GridView1.DataSource = SqlCommand1.ExecuteReader
        GridView1.DataBind()

        '關閉資料庫連線
        SqlCommand1.Dispose()
        sqlConn.Close()
        sqlConn.Dispose()

    End Sub

End Class
