Imports System.Data.SqlClient

Partial Class Type_TypeList
    Inherits System.Web.UI.Page

    Dim sqlConnection1 As SqlConnection
    Dim sqlcommand1 As SqlCommand
    Dim dr As SqlDataReader
    Dim strCommandText As String
    Dim intCondition As Integer



    Sub DBConnection()

        sqlConnection1 = New SqlConnection(SqlDataSource1.ConnectionString)

        sqlConnection1.Open()

        sqlCommand1 = New SqlCommand(strCommandText, sqlConnection1)

        dr = sqlCommand1.ExecuteReader

        GridView1.DataSource = dr

        GridView1.DataBind()

        dr.Close()

        sqlConnection1.Close()

    End Sub

    Function typeQuery(ByVal i As Integer) As String

        Dim strQuery As String
        Dim strQueryCondition As String

        strQuery = ""
        strQuery = "SELECT SN,specimenOrderNum,verFamilyE,verSpeciesE,verSpeciesC,reference,literaryLink,typeCategory FROM vwTypeDetail "
        strQueryCondition = ""

        Select Case i

            Case 1

                strQueryCondition = " WHERE (onWebSite = 1) AND (webVerificationNo = verificationNo) ORDER BY verFamilyE, verSpeciesE, typeCategory"


            Case 2

                If DropDownList1.SelectedValue.ToString = "ALL" Then

                    strQueryCondition = "WHERE (onWebSite = 1) AND (webVerificationNo = verificationNo) ORDER BY verFamilyE, verSpeciesE, typeCategory"

                Else

                    strQueryCondition = "WHERE  (onWebSite = 1) AND (webVerificationNo = verificationNo) AND verFamilyE ='" & DropDownList1.SelectedValue.ToString & "' ORDER BY verSpeciesE"

                End If

            Case 3

                strQueryCondition = "WHERE  (onWebSite = 1) AND (webVerificationNo = verificationNo) ORDER BY typeCategory, verFamilyE, verSpeciesE"

        End Select


        strQuery = strQuery + strQueryCondition


        typeQuery = strQuery

    End Function


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        Dim strQueryFamily As String
        Dim familyListArray As ArrayList = New ArrayList

        sqlConnection1 = New SqlConnection(SqlDataSource1.ConnectionString)

        If Not IsPostBack Then

            '--將科名填入下拉選單



            sqlConnection1.Open()


            strQueryFamily = "SELECT distinct(verFamilyE)  FROM vwTypeDetail ORDER BY verFamilyE "

            sqlcommand1 = New SqlCommand(strQueryFamily, sqlConnection1)

            familyListArray.Add("ALL")

            dr = sqlCommand1.ExecuteReader

            While dr.Read

                familyListArray.Add(dr("verFamilyE"))

            End While

            DropDownList1.DataSource = familyListArray
            DropDownList1.DataBind()

            sqlConnection1.Close()


            '--將資料填入gridView-----------

            strCommandText = typeQuery(1)

            DBConnection()


        End If


    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged

        intCondition = 2

        strCommandText = typeQuery(intCondition)

        DBConnection()

        RadioButtonListSortBy.ClearSelection()

    End Sub

    Protected Sub RadioButtonListSortBy_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonListSortBy.SelectedIndexChanged

        If RadioButtonListSortBy.SelectedValue = "species" Then

            intCondition = 1

        ElseIf RadioButtonListSortBy.SelectedValue = "typeCate" Then

            intCondition = 3

        End If

        strCommandText = typeQuery(intCondition)

        DBConnection()

        DropDownList1.SelectedValue = "ALL"

    End Sub
End Class
