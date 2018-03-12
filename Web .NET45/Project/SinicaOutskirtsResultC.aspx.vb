Imports System.Web.Configuration
Imports System.Drawing
Imports System.Data
Imports System.Data.SqlClient

Partial Class Project_SinicaOutskirtsResultC
    Inherits System.Web.UI.Page

    Private ds As New DataSet
    Private dataAdapter As New SqlDataAdapter

    Dim dv0, dv1, dv2 As DataView



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'SqlDataSource1.ConnectionString = WebConfigurationManager.ConnectionStrings("HASTDBConnectionString").ConnectionString
        'SqlDataSource1.SelectCommandType = SqlDataSourceCommandType.StoredProcedure
        'SqlDataSource1.SelectCommand = "prQuerySpeciesCharacteristics"

        '除錯時檢視，如果沒問題，取消databind
        GridView1.Visible = False
        DataList1.Visible = False



        Dim connSetting As ConnectionStringSettings = WebConfigurationManager.ConnectionStrings("HASTDBConnectionString")
        Dim conn As SqlConnection = New SqlConnection(connSetting.ConnectionString)


        Dim strSQL As String = "prQuerySpeciesCharacteristics"
        Dim sqlCommand As SqlCommand = New SqlCommand(strSQL, conn)
        sqlCommand.CommandType = CommandType.StoredProcedure



        If Request.QueryString("options") <> "" Then

            Dim paramOptions As New SqlParameter("@options", SqlDbType.NVarChar)
            paramOptions.Direction = Data.ParameterDirection.Input
            paramOptions.Value = Request.QueryString("options")
            sqlCommand.Parameters.Add(paramOptions)
        End If

        If Request.QueryString("options") <> "" Then

            Dim dataAdapter = New SqlDataAdapter(sqlCommand)
            'dataAdapter = SqlDataAdapter(sqlCommand)
            conn.Open()

            dataAdapter.Fill(ds)


            'Dim dr As DataRow



            dv0 = New DataView
            dv0.Table = ds.Tables(0)
            dv0.Sort = "speciesE ASC"
            GridView1.DataSource = dv0
            GridView1.DataBind()
            DataListSpecies.DataSource = dv0
            DataListSpecies.DataBind()

            dv1 = New DataView
            dv1.Table = ds.Tables(1)

            DataList1.DataSource = dv1
            DataList1.DataBind()

            'dv4 = New DataView
            'dv4.Table = dsImage.Tables(4)
            'dv4.RowFilter = "familyID = " & Request.QueryString("familyID")
            'dv4.Sort = "speciesE ASC"
        End If

    End Sub

    Protected Sub DataListSpecies_ItemCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataListSpecies.ItemCreated

        Dim strSpecies As String
        strSpecies = dv0.Item(e.Item.ItemIndex).Item("speciesC").ToString & "&nbsp;" & dv0.Item(e.Item.ItemIndex).Item("speciesE").ToString


        dv2 = New DataView
        dv2.Table = ds.Tables(2)

        dv2.RowFilter = "SpeciesID = " & dv0.Item(e.Item.ItemIndex).Item("speciesID").ToString


        CType(e.Item.FindControl("Label1"), Label).Text = strSpecies

    End Sub

    Protected Sub DataListSpecies_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataListSpecies.ItemDataBound

        CType(e.Item.FindControl("DataListImages"), DataList).DataSource = dv2
        CType(e.Item.FindControl("DataListImages"), DataList).DataBind()

    End Sub


    Public Function GetImage(ByVal imageCode As String) As String

        Return ImageFilePath.GetImageFilePath(imageCode, "thumb")

    End Function
End Class
