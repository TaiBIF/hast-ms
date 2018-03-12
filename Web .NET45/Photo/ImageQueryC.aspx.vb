Imports System.Web.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports HAST

Partial Class Photo_ImageQueryC
    Inherits System.Web.UI.Page

    Dim strConnectionstring As String

    Dim dv As New DataView
    Dim SDSSql As New SqlDataSource

    Sub DBConnection()

        strConnectionstring = WebConfigurationManager.ConnectionStrings("HASTDBConnectionString").ConnectionString

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click


        Dim strRedirectUrl As String = "~/Photo/ImageClassC.aspx?"


        If TextBoxScientificName.Text.Trim <> "" Then
            strRedirectUrl = strRedirectUrl & "&scientificName=" & TextBoxScientificName.Text.Trim
        End If

        If DDListAuthor.SelectedValue <> "" Then  '拍攝者
            strRedirectUrl = strRedirectUrl & "authorID=" & DDListAuthor.SelectedValue
        End If

        If DDListCollectionMonth.SelectedValue <> "" Then
            strRedirectUrl = strRedirectUrl & "&collectionMonth=" & DDListCollectionMonth.SelectedValue
        End If

        If TextBoxPhotoDate.Text.Trim <> "" Then
            strRedirectUrl = strRedirectUrl & "&PhotoDate=" & TextBoxPhotoDate.Text.Trim
        End If

        If TextBoxPhotoDateEnd.Text.Trim <> "" Then
            strRedirectUrl = strRedirectUrl & "&PhotoDateEnd=" & TextBoxPhotoDateEnd.Text.Trim
        End If

        If DDListScientificName1.familyID <> "" Then
            strRedirectUrl = strRedirectUrl & "&familyID=" & DDListScientificName1.familyID
        End If

        If DDListScientificName1.genusID <> "" Then
            strRedirectUrl = strRedirectUrl & "&genusID=" & DDListScientificName1.genusID
        End If

        If DDListScientificName1.speciesID <> "" Then
            strRedirectUrl = strRedirectUrl & "&speciesID=" & DDListScientificName1.speciesID
        End If

        If DDListLocation1.countryNo <> "" Then
            strRedirectUrl = strRedirectUrl & "&countryNo=" & DDListLocation1.countryNo
        End If

        If DDListLocation1.provinceNo <> "" Then
            strRedirectUrl = strRedirectUrl & "&provinceNo=" & DDListLocation1.provinceNo
        End If

        If DDListLocation1.hsienNo <> "" Then
            strRedirectUrl = strRedirectUrl & "&hsienNo=" & DDListLocation1.hsienNo
        End If

        If DDListLocation1.townNo <> "" Then
            strRedirectUrl = strRedirectUrl & "&townNo=" & DDListLocation1.townNo
        End If

        If DDListLocation1.parkNo <> "" Then
            strRedirectUrl = strRedirectUrl & "&parkNo=" & DDListLocation1.parkNo
        End If

        If TextBoxLocation.Text.Trim <> "" Then
            strRedirectUrl = strRedirectUrl & "&location=" & TextBoxLocation.Text.Trim
        End If


        If CheckBoxPublicWeb.Checked Then
            strRedirectUrl = strRedirectUrl & "&publicWeb=0"
        End If


        '<<<<<<<<<<<<<<< 檢查查詢結果類群是否超過一個綱(class)
        '檢查是否有不合法字元

        Dim intErrorCharSum As Integer = 0

        If Request.QueryString("scientificName") <> "" Then
            intErrorCharSum = checkChar(Request.QueryString("scientificName"))
        End If

        If Request.QueryString("location") <> "" Then
            intErrorCharSum = intErrorCharSum + checkChar(Request.QueryString("location"))
        End If


        If intErrorCharSum >= 0 Then

            DBConnection()

            Using testConnetion As New SqlConnection(strConnectionstring)
                Dim strSQLProc As String = "prImageDynaQuery"
                Dim testCommand As New SqlCommand(strSQLProc, testConnetion)
                testCommand.CommandType = CommandType.StoredProcedure

                '加參數

                Dim paramCheckFamilyCount As New SqlParameter("@checkFamilyCount", SqlDbType.Bit)
                paramCheckFamilyCount.Direction = Data.ParameterDirection.Input
                paramCheckFamilyCount.Value = 1
                testCommand.Parameters.Add(paramCheckFamilyCount)

                If TextBoxScientificName.Text.Trim <> "" Then
                    Dim paramScientificName As New SqlParameter("@scientificName", SqlDbType.NVarChar)
                    paramScientificName.Direction = Data.ParameterDirection.Input
                    paramScientificName.Value = TextBoxScientificName.Text.Trim
                    testCommand.Parameters.Add(paramScientificName)
                End If

                If DDListCollectionMonth.SelectedValue <> "" Then
                    Dim paramCollectionMonth As New SqlParameter("collectionMonth", SqlDbType.Int)
                    paramCollectionMonth.Direction = Data.ParameterDirection.Input
                    paramCollectionMonth.Value = DDListCollectionMonth.SelectedValue
                    testCommand.Parameters.Add(paramCollectionMonth)
                End If

                If TextBoxPhotoDate.Text.Trim <> "" Then
                    Dim paramPhotoDate As New SqlParameter("photoDate", TypeCode.DateTime)
                    paramPhotoDate.Direction = Data.ParameterDirection.Input
                    paramPhotoDate.Value = TextBoxPhotoDate.Text.Trim
                    testCommand.Parameters.Add(paramPhotoDate)
                End If

                If TextBoxPhotoDateEnd.Text.Trim <> "" Then
                    Dim paramPhotoDateEnd As New SqlParameter("photoDateEnd", TypeCode.DateTime)
                    paramPhotoDateEnd.Direction = Data.ParameterDirection.Input
                    paramPhotoDateEnd.Value = TextBoxPhotoDateEnd.Text.Trim
                    testCommand.Parameters.Add(paramPhotoDateEnd)
                End If

                If DDListScientificName1.familyID <> "" Then
                    Dim paramFamilyID As New SqlParameter("@familyID", SqlDbType.Int)
                    paramFamilyID.Direction = Data.ParameterDirection.Input
                    paramFamilyID.Value = DDListScientificName1.familyID
                    testCommand.Parameters.Add(paramFamilyID)
                End If

                If DDListScientificName1.genusID <> "" Then
                    Dim paramGenusID As New SqlParameter("genusID", SqlDbType.Int)
                    paramGenusID.Direction = Data.ParameterDirection.Input
                    paramGenusID.Value = DDListScientificName1.genusID
                    testCommand.Parameters.Add(paramGenusID)
                End If

                If DDListScientificName1.speciesID <> "" Then
                    Dim paramSpeciesID As New SqlParameter("speciesID", SqlDbType.Int)
                    paramSpeciesID.Direction = Data.ParameterDirection.Input
                    paramSpeciesID.Value = DDListScientificName1.speciesID
                    testCommand.Parameters.Add(paramSpeciesID)
                End If

                If DDListLocation1.countryNo <> "" Then
                    Dim paramCountryNo As New SqlParameter("countryNo", SqlDbType.Int)
                    paramCountryNo.Direction = Data.ParameterDirection.Input
                    paramCountryNo.Value = DDListLocation1.countryNo
                    testCommand.Parameters.Add(paramCountryNo)
                End If

                If DDListLocation1.provinceNo <> "" Then
                    Dim paramProvinceNo As New SqlParameter("provinceNo", SqlDbType.Int)
                    paramProvinceNo.Direction = Data.ParameterDirection.Input
                    paramProvinceNo.Value = DDListLocation1.provinceNo
                    testCommand.Parameters.Add(paramProvinceNo)
                End If

                If DDListLocation1.hsienNo <> "" Then
                    Dim paramHsienNo As New SqlParameter("hsienNo", SqlDbType.Int)
                    paramHsienNo.Direction = Data.ParameterDirection.Input
                    paramHsienNo.Value = DDListLocation1.hsienNo
                    testCommand.Parameters.Add(paramHsienNo)
                End If

                If DDListLocation1.townNo <> "" Then
                    Dim paramTownNo As New SqlParameter("townNo", SqlDbType.Int)
                    paramTownNo.Direction = Data.ParameterDirection.Input
                    paramTownNo.Value = DDListLocation1.townNo
                    testCommand.Parameters.Add(paramTownNo)
                End If

                If DDListLocation1.parkNo <> "" Then
                    Dim paramParkNo As New SqlParameter("parkNo", SqlDbType.Int)
                    paramParkNo.Direction = Data.ParameterDirection.Input
                    paramParkNo.Value = DDListLocation1.parkNo
                    testCommand.Parameters.Add(paramParkNo)
                End If

                If TextBoxLocation.Text.Trim <> "" Then
                    Dim paramLocation As New SqlParameter("location", SqlDbType.NVarChar)
                    paramLocation.Direction = Data.ParameterDirection.Input
                    paramLocation.Value = TextBoxLocation.Text.Trim
                    testCommand.Parameters.Add(paramLocation)
                End If

                If DDListAuthor.SelectedValue <> "" Then
                    Dim paramAuthorID As New SqlParameter("authorID", SqlDbType.Int)
                    paramAuthorID.Direction = Data.ParameterDirection.Input
                    paramAuthorID.Value = DDListAuthor.SelectedValue
                    testCommand.Parameters.Add(paramAuthorID)
                End If


                testConnetion.Open()
                Dim numResult As Integer = CInt(testCommand.ExecuteScalar)


                If numResult = 1 Then
                    strRedirectUrl = Replace(strRedirectUrl, "/ImageClass", "/ImageHierarchical")

                End If

                testConnetion.Close()

            End Using
        End If

        '>>>>>>>>>>>>>>>>


        Response.Redirect(strRedirectUrl)

    End Sub


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            'Session("ImageQuery") = "admin"


            DBConnection()
            'SDSCollector.ConnectionString = strConnectionstring
            'SDSCollector.SelectCommandType = SqlDataSourceCommandType.Text
            'SDSCollector.SelectCommand = "SELECT pid, nameLFC1 FROM vwPersonName WHERE collector = 1 ORDER BY nameLFC1"
            SDSSql.ConnectionString = strConnectionstring
            SDSSql.SelectCommandType = SqlDataSourceCommandType.Text
            SDSSql.SelectCommand = "SELECT pid, nameLFC1 FROM vwPersonName WHERE ImageAuthor = 1 ORDER BY nameLFC1"

            DDListAuthor.Items.Add("")
            DDListAuthor.Items.Item(0).Value = ""

            'dv = SDSCollector.Select(New DataSourceSelectArguments)
            dv = SDSSql.Select(New DataSourceSelectArguments)

            Dim i As Integer

            For i = 1 To dv.Count
                DDListAuthor.Items.Add(dv.Item(i - 1).Item("nameLFC1"))
                DDListAuthor.Items.Item(i).Value = dv.Item(i - 1).Item("pid")
            Next
            DDListAuthor.SelectedValue = ""


        End If

        '設定全部查詢權限
        If Context.User.IsInRole("Power User") Then

            CheckBoxPublicWeb.Visible = True
        Else

            CheckBoxPublicWeb.Visible = False
        End If

        dv.Dispose()




    End Sub


    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click

        TextBoxScientificName.Text = ""

        TextBoxLocation.Text = ""
        DDListAuthor.SelectedValue = ""
        DDListCollectionMonth.SelectedValue = "0"
        TextBoxPhotoDate.Text = ""
        TextBoxPhotoDateEnd.Text = ""

        DDListScientificName1.Reset()
        DDListLocation1.Reset()


    End Sub


End Class
