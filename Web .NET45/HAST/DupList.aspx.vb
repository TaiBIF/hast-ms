

Partial Class HAST_DupList
    Inherits System.Web.UI.Page

Sub DBconnection()

        SqlDS.ConnectionString = "Data Source=G6;Initial Catalog=hastDB;Integrated Security=SSPI"

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        Dim ctlClassID As New ControlParameter("classID", "RadioButtonList1", "SelectedValue")


        If Not IsPostBack Then

            RadioButtonList1.SelectedValue = 0
            SqlDS.SelectParameters.Add(ctlClassID)

        End If

    End Sub

    Protected Sub RadioButtonList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList1.SelectedIndexChanged

        DBconnection()

        SqlDS.SelectCommand = "SELECT classID, familyID, familyE, familyC, count(*) AS total FROM vwDupStock WHERE classID LIKE @classID GROUP BY classID, familyID, familyE, familyC ORDER BY familyE"

        SqlDS.DataSourceMode = SqlDataSourceMode.DataReader
        GridViewFamily.DataSourceID = SqlDS.ID

    End Sub
End Class
