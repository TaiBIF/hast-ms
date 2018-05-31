Imports System.Web.Configuration
Imports System.Data
Imports System.Data.SqlClient

Partial Class Project_TaipeiSuburbsListC
    Inherits System.Web.UI.Page

    Dim strConnectionString As String
    Dim dv As DataView
    Dim strFilter As String


    Private Sub DBConnection()

        strConnectionString = WebConfigurationManager.ConnectionStrings("HASTDBConnectionString").ConnectionString

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        Dim dv As DataView
        'SDSList = New SqlDataSource
        DBConnection()

        Dim strSQL As String
        'strSQL = "SELECT familyID, familyE, familyC FROM  vwFamilyList WHERE class = @class "
        strSQL = "SELECT DISTINCT listID, classID, classE, classC, l.familyID, l.familyE, l.familyC, "
        strSQL += " l.speciesID, l.speciesE, l.speciesC FROM vwAreaSpeciesList AS l "
        strSQL += " LEFT JOIN speciesDescriptions AS dc ON l.speciesID = dc.speciesID "
        strSQL += " LEFT JOIN speciesDistributionArea AS dt ON l.speciesID = dt.speciesID "
        strSQL += " AND l.areaID = dt.areaID "
        'strSQL += " WHERE classID = @class AND l.areaID = 3"
        strSQL += " WHERE l.areaID = 3"
        strSQL += " AND characteristicC IS NOT NULL "

        'SDSList = New SqlDataSource
        SDSList.ConnectionString = strConnectionString
        'SDSList.SelectCommandType = SqlDataSourceCommandType.StoredProcedure
        'SDSList.SelectCommand = "prFloraArea"
        SDSList.SelectCommandType = SqlDataSourceCommandType.Text
        SDSList.SelectCommand = strSQL




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

            'If Request.QueryString("areaID") <> "" Then
            Dim paramAreaID As New QueryStringParameter("areaID", TypeCode.Int32, "areaID")
            'Dim paramAreaID As New SqlParameter("@areaID", SqlDbType.Int)
            paramAreaID.Direction = Data.ParameterDirection.Input
            'paramAreaID.DefaultValue = Request.QueryString("areaID")
            paramAreaID.DefaultValue = 3
            SDSList.SelectParameters.Add(paramAreaID)
            'SqlCommand.Parameters.Add(paramAreaID)
            'End If

            dv = New DataView
            dv = SDSList.Select(New DataSourceSelectArguments)


            DDListClass.Items.Clear()

            DDListClass.Items.Add("全部")
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
End Class
