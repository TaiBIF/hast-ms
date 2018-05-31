Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration
Imports HAST

Partial Class HAST_campusplants_list
    Inherits System.Web.UI.Page

    Private dsList As New DataSet
    Private dataAdapter As New SqlDataAdapter

    Dim dv1, dv2, dv5 As DataView

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load


        Dim connSetting As ConnectionStringSettings = WebConfigurationManager.ConnectionStrings("HASTDBConnectionString")
        Dim conn As SqlConnection = New SqlConnection(connSetting.ConnectionString)

        Try



            If Not IsPostBack Then

                Dim strSQL As String = "prSinicaFloraList"
                Dim sqlCommand As SqlCommand = New SqlCommand(strSQL, conn)
                sqlCommand.CommandType = CommandType.StoredProcedure

                Dim dataAdapter = New SqlDataAdapter(sqlCommand)

                conn.Open()
                dataAdapter.Fill(dsList)

                dv1 = New DataView
                dv1.Table = dsList.Tables(0)
                'dv1.RowFilter = "classID = " & Request.QueryString("classID")

                Dim tblClass As New DataTable
                tblClass = dv1.ToTable("classHast", True, New String() {"classID", "classE", "classC"})
                tblClass.DefaultView.Sort = "classID"




                Repeater1.DataSource = tblClass '.AsDataView
                Repeater1.DataBind()
                'Repeater1.DataSourceID = "classID"


                '異動程式碼, 不設primaryKey???
                'dsImage.Tables(1).PrimaryKey = New DataColumn() {dsImage.Tables(1).Columns("rownum")}





            End If


        Catch ex As SqlException

            Response.Write("File not found!")

        Catch ex As Exception

            Response.Write("File not found!")

        Finally

            conn.Close()
            conn.Dispose()

        End Try


    End Sub

    Protected Sub Repeater1_ItemDataBound(sender As Object, e As RepeaterItemEventArgs) Handles Repeater1.ItemDataBound

        'CType(e.Item.FindControl("DataList1"), DataList).DataSource = dv1
        'CType(e.Item.FindControl("DataList1"), DataList).DataBind()

        CType(e.Item.FindControl("GridView1"), GridView).DataSource = dv1
        CType(e.Item.FindControl("GridView1"), GridView).DataBind()

    End Sub

    Protected Sub Repeater1_ItemCreated(sender As Object, e As RepeaterItemEventArgs) Handles Repeater1.ItemCreated

        'dv1.RowFilter = "classID = " & dv1.Item(e.Item.ItemIndex).Item("classID").ToString
        dv1.RowFilter = "classID = " & e.Item.DataItem("classID")
        dv1.Sort = "familyE ASC"

    End Sub
End Class
