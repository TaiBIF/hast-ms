Imports System.Data
Imports System.Data.SqlClient

Partial Class Mgm_greenhouse_GreenhouseList
    Inherits System.Web.UI.Page

    Dim strQuery As String

    Function TransferNull(ByVal strParameter As String, ByVal i As Integer) As String

        '本函式用來處理預Query String回傳的SQL查詢中，可能遇到空值的情況
        '第一個參數是欄位，第二個參數用來判斷傳入的欄位預設為數字或字串

        Dim strTransferNull As String

        strTransferNull = "(COALESCE(" & strParameter & " , ISNULL(" & strParameter & ",1)) = COALESCE(NULLIF(@" & strParameter & ", 0), ISNULL(" & strParameter & ",1)))"

        Return strTransferNull

    End Function


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        ' SDSGhListArea.SelectCommand = strQuery

        If Not IsPostBack Then

            GridView1.DataSourceID = SDSGHList.ID

            'RadioButtonList1.SelectedValue = 0
            'SqlDS.SelectParameters.Add(ctlClassID)

            Dim paramAreaID As New ControlParameter("AreaID", "DDListArea")
            paramAreaID.Direction = ParameterDirection.Input
            paramAreaID.DefaultValue = 0  '預設值為0，用來當作null判斷值
            SDSGhListArea.SelectParameters.Add(paramAreaID)

            Dim paramPotID As New ControlParameter("potID", "TextBoxPotID")
            paramPotID.Direction = ParameterDirection.Input
            paramPotID.DefaultValue = ""  '預設值為0，用來當作null判斷值
            SDSGhListPotID.SelectParameters.Add(paramPotID)



            'DBconnection()
            SDSGHList.DataSourceMode = SqlDataSourceMode.DataSet
            GridView1.DataSourceID = SDSGHList.ID

        End If



    End Sub

    Protected Sub DDListArea_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDListArea.SelectedIndexChanged

        TextBoxPotID.Text = ""

        strQuery = "SELECT potID, collectorA, collectNum1A, collectNum2A, collectionNumA, collectorB, collectNum1B, collectNum2B, collectionNumB, originalData, verFamilyEA, verSpeciesEA, countryA, verFamilyEB, verSpeciesEB, countryB, greenhouseArea, removeID, removed FROM vwGreenhouseDetail WHERE " & TransferNull("areaID", 0)

        SDSGhListArea.SelectCommand = strQuery
        GridView1.DataSourceID = SDSGhListArea.ID

    End Sub

    Protected Sub btnQuery_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnQuery.Click

        If TextBoxPotID.Text <> "" Then

            strQuery = "SELECT potID, collectorA, collectNum1A, collectNum2A, collectionNumA, collectorB, collectNum1B, collectNum2B, collectionNumB, originalData, verFamilyEA, verSpeciesEA, countryA, verFamilyEB, verSpeciesEB, countryB, greenhouseArea, removeID, removed FROM vwGreenhouseDetail WHERE potID = @potID"
            SDSGhListPotID.SelectCommand = strQuery

            GridView1.DataSourceID = SDSGhListPotID.ID

        Else
            GridView1.DataSourceID = SDSGHList.ID


        End If

    End Sub

    Protected Sub btnSNNull_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSNNull.Click

        GridView1.DataSourceID = SDSGhSNNull.ID

    End Sub

    Protected Sub btnAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAll.Click

        GridView1.DataSourceID = SDSGHList.ID

    End Sub

End Class
