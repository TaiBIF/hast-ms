Imports System.Drawing
Imports System.Drawing.Imaging
Imports Subgurim.Controles
Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration

Partial Class Mgm_Project_EditCharacteristicsSuccess
    Inherits System.Web.UI.Page

    Dim dv As Data.DataView
    Dim dv0, dv1, dv2, dv3 As DataView

    Private dsSpeciesCharacters As New DataSet
    Private dataAdapter As New SqlDataAdapter



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            DBBind()

        End If

    End Sub

    Protected Sub DBBind()

        Dim intClass As Integer
        Dim txtSpecies As String
        Dim txtCharacteristics As String

        Try

            Dim connSetting As ConnectionStringSettings = WebConfigurationManager.ConnectionStrings("HASTDBConnectionString")
            Dim conn As SqlConnection = New SqlConnection(connSetting.ConnectionString)

            Dim strSQL As String = ""
            Dim sqlCommand As New SqlCommand

            Dim InsertCommand As New SqlCommand



            strSQL = "prSpeciesCharacteristics"

            If Request.QueryString("speciesID") <> "" Then
                Dim paramSpeciesID As New SqlParameter("speciesID", SqlDbType.Int)
                paramSpeciesID.Direction = Data.ParameterDirection.Input
                paramSpeciesID.Value = Request.QueryString("speciesID")
                sqlCommand.Parameters.Add(paramSpeciesID)
            End If


            sqlCommand.CommandText = strSQL
            sqlCommand.Connection = conn
            sqlCommand.CommandType = CommandType.StoredProcedure



            If Request.QueryString("speciesID") <> "" Or Request.QueryString("lID") <> "" Then
                'If Request.QueryString("speciesID") <> "" Then
                'If Request.QueryString("lID") <> "" Then   若 request page 則改檢查lID

                dataAdapter = New SqlDataAdapter
                dataAdapter.SelectCommand = sqlCommand

                conn.Open()
                dataAdapter.Fill(dsSpeciesCharacters)

                '學名資料
                dv0 = New DataView
                dv0.Table = dsSpeciesCharacters.Tables(0)

                intClass = dv0.Item(0).Row(0)
                txtSpecies = dv0.Item(0).Row(2)
                Label1.Text = txtSpecies


                dv2 = New DataView
                dv2.Table = dsSpeciesCharacters.Tables(2)


                txtCharacteristics = dv2.Item(0).Row(0)
                Label2.Text = txtCharacteristics


                conn.Close()
                conn.Dispose()

            End If

        Catch ex As SqlException


            Response.Write("File not found!")

        Catch ex As Exception

            Response.Write("File not found!")

        End Try

    End Sub

End Class
