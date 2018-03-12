Imports System.Web.Configuration
Imports System.Data
Imports System.Data.SqlClient

Partial Class Mgm_Project_FloraAreaC
    Inherits System.Web.UI.Page

    Dim strConnectionString As String
    Dim dv As DataView
    Dim strFilter As String


    Private Sub DBConnection()

        strConnectionString = WebConfigurationManager.ConnectionStrings("HASTDBConnectionString").ConnectionString

    End Sub



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Context.User.IsInRole("Power User") Then

            DDListClass.Visible = True
            GridView1.Visible = True

        Else

            DDListClass.Visible = False
            GridView1.Visible = False

        End If

        If Request.QueryString("areaID") <> "" Then
            HyperLink2.NavigateUrl = "~/Mgm/Project/FloraAreaSpeciesUpdateC.aspx?areaID=" & Request.QueryString("areaID").ToString

        End If



        Dim dv As DataView
        'SDSList = New SqlDataSource
        DBConnection()

        'SDSList = New SqlDataSource
        SDSList.ConnectionString = strConnectionString
        SDSList.SelectCommandType = SqlDataSourceCommandType.StoredProcedure
        SDSList.SelectCommand = "prFloraArea"



        SDSList.ID = "SDSList"
        '設定為DataSet模式
        SDSList.DataSourceMode = SqlDataSourceMode.DataSet
        'GridView1.DataSource = SDSList


        'SDSList.SelectParameters.Add("areaID", DDListArea.SelectedValue)

        If DDListClass.SelectedValue <> "" Then
            strFilter = "classID = '{0}'"
        Else
            strFilter = ""
        End If

        SDSList.FilterExpression = strFilter


        If Not IsPostBack Then

            If Request.QueryString("areaID") <> "" Then
                Dim paramAreaID As New QueryStringParameter("areaID", TypeCode.Int32, "areaID")
                'Dim paramAreaID As New SqlParameter("@areaID", SqlDbType.Int)
                paramAreaID.Direction = Data.ParameterDirection.Input
                paramAreaID.DefaultValue = Request.QueryString("areaID")
                SDSList.SelectParameters.Add(paramAreaID)
                'SqlCommand.Parameters.Add(paramAreaID)
            End If

            dv = New DataView
            dv = SDSList.Select(New DataSourceSelectArguments)


            DDListClass.Items.Clear()

            DDListClass.Items.Add("")
            DDListClass.Items.Item(0).Value = ""

            Dim dt As DataTable
            dt = New DataTable
            dt = dv.ToTable(True, "classID", "classC")

            'dv.Sort = "classID"

            Dim i As Integer = 0

            For Each row As DataRow In dt.Select("", "classID")

                i += 1
                'DDListClass.Items.Add(dv.Item(i - 1).Item("classC"))
                'DDListClass.Items.Item(i).Value = dv.Item(i - 1).Item("classID")
                DDListClass.Items.Add(row("classC"))
                DDListClass.Items.Item(i).Value = row("classID")

            Next



            '==設定查詢參數================================================
            Dim ctrlClass As New ControlParameter
            ctrlClass.Name = "paramClass"
            ctrlClass.Type = TypeCode.String
            ctrlClass.DefaultValue = ""
            ctrlClass.ControlID = DDListClass.ID

            SDSList.FilterParameters.Add(ctrlClass)

        End If

        GridView1.DataSourceID = SDSList.ID
        GridView1.DataKeyNames = New String() {"listID"}
        GridView1.DataBind()


    End Sub


    Protected Sub btnDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs)


        Dim index As Integer = DirectCast(DirectCast(sender, Button).Parent.Parent, GridViewRow).RowIndex
        Dim pk As String

        pk = GridView1.Rows(index).Cells(0).Text
        'MsgBox(pk)

        Dim strConn, strSql As String
        strConn = WebConfigurationManager.ConnectionStrings("HASTDBConnectionString").ConnectionString

        Using cn As New SqlConnection(strConn)
            cn.Open()
            strSql = "DELETE FROM areaSpeciesList WHERE listID = @listID"
            Dim cmd As New SqlCommand(strSql, cn)
            cmd.Parameters.AddWithValue("@listID", pk)
            cmd.ExecuteNonQuery()

        End Using

        GridView1.DataBind()


    End Sub


End Class
