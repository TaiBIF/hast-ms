Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration

Partial Class Mgm_Project_FloraAreaSpeciesUpdateC
    Inherits System.Web.UI.Page

    Protected Sub FormView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormView1.DataBound

        If FormView1.PageCount = 0 Then
            BtnUpdate.Text = "新增"
        Else
            BtnUpdate.Text = "更新"
            CType(FormView1.FindControl("listIDLabel"), Label).Visible = False
            CType(FormView1.FindControl("areaIDLabel"), Label).Visible = False
        End If

    End Sub

    Protected Sub BtnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnUpdate.Click

        Dim strConn, strSql As String
        strConn = WebConfigurationManager.ConnectionStrings("HASTDBConnectionString").ConnectionString

        Using cn As New SqlConnection(strConn)
            cn.Open()

            Dim strUrl As String
            strUrl = "~/Mgm/Project/FloraAreaC.aspx?areaID="


            If BtnUpdate.Text = "新增" Then

                strSql = "INSERT INTO areaSpeciesList (areaID, speciesID) VALUES (@areaID, @speciesID)"
                Dim cmd As New SqlCommand(strSql, cn)
                cmd.Parameters.AddWithValue("@areaID", Request.QueryString("areaID"))
                cmd.Parameters.AddWithValue("@speciesID", DDListScientificName1.speciesID)
                cmd.ExecuteNonQuery()


                strUrl += Request.QueryString("areaID")
                Response.Redirect(strUrl)

            Else
                strSql = "UPDATE areaSpeciesList Set speciesID = @speciesID WHERE listID = @listID"
                Dim cmd As New SqlCommand(strSql, cn)
                cmd.Parameters.AddWithValue("@listID", CType(FormView1.FindControl("listIDLabel"), Label).Text)
                cmd.Parameters.AddWithValue("@speciesID", DDListScientificName1.speciesID)
                cmd.ExecuteNonQuery()
                FormView1.DataBind()

            End If




        End Using

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        


    End Sub
End Class
