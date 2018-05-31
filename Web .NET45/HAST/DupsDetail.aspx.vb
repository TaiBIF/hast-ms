Imports System.Web.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlTypes

Partial Class HAST_DupsDetail
    Inherits System.Web.UI.Page

    Dim strQuery As String

    Function TransferNull(ByVal strParameter As String, ByVal i As Integer) As String

        '本函式用來處理預Query String回傳的SQL查詢中，可能遇到空值的情況
        '第一個參數是欄位，第二個參數用來判斷傳入的欄位預設為數字或字串

        Dim strTransferNull As String

        strTransferNull = "(COALESCE(" & strParameter & " , ISNULL(" & strParameter & ",1)) = COALESCE(NULLIF(@" & strParameter & ", 0), ISNULL(" & strParameter & ",1)))"

        Return strTransferNull

    End Function

    Sub DBconnection()

        Dim strConnectionString As String
        strConnectionString = WebConfigurationManager.ConnectionStrings("HASTDBConnectionString").ConnectionString

        'SqlDS.ConnectionString = "Data Source=x206;Initial Catalog=hastDB;Integrated Security=SSPI"
        SqlDS.ConnectionString = strConnectionString

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'strQuery = "SELECT TOP 3000 CKSN, familyID, familyE, familyC, genusID, genusE, speciesID, speciesE, speciesC, LTRIM(ISNULL(cCollector,'') + ' ') + LTRIM(ISNULL(cCollectNum1,'') + ' ') + LTRIM(ISNULL(cCollectNum2,'') + ' ') AS collectNum, storedSite, blnBored, blnDestroyed, blnNoFlwFruit FROM vwDupStock WHERE familyID LIKE @familyID /*AND genusID LIKE @genusID*/ AND (COALESCE(speciesID, ISNULL(speciesID,1)) = COALESCE(NULLIF(@speciesID, 0), ISNULL(speciesID,1)))"

        strQuery = "SELECT TOP 3000 CKSN, familyID, familyE, familyC, genusID, genusE, speciesID, speciesE, speciesC, LTRIM(ISNULL(cCollector,'') + ' ') + LTRIM(ISNULL(cCollectNum1,'') + ' ') + LTRIM(ISNULL(cCollectNum2,'') + ' ') AS collectNum,  blnBored, blnDestroyed, blnNoFlwFruit, specimenOrderNum FROM vwDupStock WHERE " & TransferNull("familyID", 0) & " AND " & TransferNull("genusID", 0) & " AND " & TransferNull("speciesID", 0)

        SqlDS.SelectCommand = strQuery

        ' Dim ctlClassID As New ControlParameter("classID", "RadioButtonList1", "SelectedValue")

        If Not IsPostBack Then

            'RadioButtonList1.SelectedValue = 0
            'SqlDS.SelectParameters.Add(ctlClassID)

            Dim paramFamilyID As New QueryStringParameter("familyID", "familyID")
            paramFamilyID.Direction = ParameterDirection.Input
            paramFamilyID.DefaultValue = 0  '預設值為0，用來當作null判斷值
            SqlDS.SelectParameters.Add(paramFamilyID)

            Dim paramGenusID As New QueryStringParameter("genusID", "genusID")
            paramGenusID.Direction = ParameterDirection.Input
            paramGenusID.DefaultValue = 0
            SqlDS.SelectParameters.Add(paramGenusID)

            Dim paramSpeciesID As New QueryStringParameter("speciesID", "speciesID")
            paramSpeciesID.Direction = ParameterDirection.Input
            paramSpeciesID.DefaultValue = 0
            SqlDS.SelectParameters.Add(paramSpeciesID)


            DBconnection()
            SqlDS.DataSourceMode = SqlDataSourceMode.DataSet
            GridView1.DataSourceID = SqlDS.ID

        End If

    End Sub


End Class
