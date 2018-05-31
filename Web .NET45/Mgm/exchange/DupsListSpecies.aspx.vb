Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration

Partial Class Mgm_exchange_DupsListSpecies
    Inherits System.Web.UI.Page


    Sub DBconnection()

        Dim strConnectionString As String
        strConnectionString = WebConfigurationManager.ConnectionStrings("HASTDBConnectionString").ConnectionString
        SqlDS.ConnectionString = strConnectionString

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim strQuery As String

        strQuery = "SELECT familyID, familyE, familyC, genusID, genusE, genusC, speciesID, speciesE, speciesC, count(*) AS total FROM vwDupStock WHERE familyID = @familyID AND genusID = @genusID GROUP BY familyID, familyE, familyC, genusID, genusE, genusC , speciesID, speciesE, speciesC ORDER BY speciesE"

        SqlDS.SelectCommand = strQuery

        If Not IsPostBack Then

            Dim paramFamilyID As New QueryStringParameter("familyID", "familyID")
            paramFamilyID.Direction = ParameterDirection.Input
            'paramFamilyID.DefaultValue = 0  '預設值為0，用來當作null判斷值
            SqlDS.SelectParameters.Add(paramFamilyID)

            Dim paramGenusID As New QueryStringParameter("genusID", "genusID")
            paramGenusID.Direction = ParameterDirection.Input
            'paramGenusID.DefaultValue = 0
            SqlDS.SelectParameters.Add(paramGenusID)

            'Dim paramSpeciesID As New QueryStringParameter("speciesID", "speciesID")
            'paramSpeciesID.Direction = ParameterDirection.Input
            'paramSpeciesID.DefaultValue = 0
            'SqlDS.SelectParameters.Add(paramSpeciesID)
            DBconnection()
            SqlDS.DataSourceMode = SqlDataSourceMode.DataSet
            GridView1.DataSourceID = SqlDS.ID

        End If

    End Sub

End Class
