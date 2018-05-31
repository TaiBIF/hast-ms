Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration
Imports HAST

Partial Class Photo_imageTest
    Inherits System.Web.UI.Page



    Private dsImage As New DataSet
    Private dataAdapter As New SqlDataAdapter

    Dim dv1, dv2, dv5 As DataView 'dv1處理class, dv2處理family, dv5處理各科種數
    Dim strRequestURL As String ' 儲存傳入網址

    Public Function GetImage(ByVal imageCode As String) As String

        Return ImageFilePath.GetImageFilePath(imageCode, "thumb")

    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Try


            '檢查是否有不合法字元

            Dim intErrorCharSum As Integer = 0

            If Request.QueryString("scientificName") <> "" Then
                intErrorCharSum = checkChar(Request.QueryString("scientificName"))
            End If

            If Request.QueryString("location") <> "" Then
                intErrorCharSum = intErrorCharSum + checkChar(Request.QueryString("location"))
            End If



            If Not IsPostBack Then


                Dim connSetting As ConnectionStringSettings = WebConfigurationManager.ConnectionStrings("HASTDBConnectionString")
                Dim conn As SqlConnection = New SqlConnection(connSetting.ConnectionString)


                Dim strSQL As String = "prImageDynaQuery"
                Dim sqlCommand As SqlCommand = New SqlCommand(strSQL, conn)
                sqlCommand.CommandType = CommandType.StoredProcedure


                'GridView1.AllowSorting = True

                'Dim strCheckInput() As String = {}

                If intErrorCharSum >= 0 Then

                    '如何保護sn的查詢？
                    'If Request.QueryString("SN") <> "" Then
                    '    Dim paramSN As New QueryStringParameter("SN", TypeCode.Int32, "SN")
                    '    paramSN.Direction = Data.ParameterDirection.Input
                    '    'sqlCommand.SelectParameters.Add(paramSN)
                    '    sqlCommand.Parameters.Add(paramSN)
                    'End If


                    '設定來訪頁面，判斷是否給予所有的查詢結果

                    'If Not IsNothing(Session("ImageQuery")) Then

                    '    If Session("ImageQuery").ToString = "admin" Then
                    '        Dim paramPublicWeb As New SqlParameter("publicWeb", SqlDbType.Bit)
                    '        paramPublicWeb.Direction = Data.ParameterDirection.Input
                    '        paramPublicWeb.Value = False
                    '        sqlCommand.Parameters.Add(paramPublicWeb)
                    '    End If
                    'End If



                    If Context.User.IsInRole("Power User") Then

                        If Request.QueryString("publicWeb") = 0 Then

                            Dim paramPublicWeb As New SqlParameter("@publicWeb", SqlDbType.Bit)
                            paramPublicWeb.Direction = Data.ParameterDirection.Input
                            paramPublicWeb.Value = 0
                            sqlCommand.Parameters.Add(paramPublicWeb)
                        End If
                    End If





                    If Request.QueryString("scientificName") <> "" Then

                        'Dim paramScientificName As New QueryStringParameter("scientificName", TypeCode.String, "scientificName")
                        Dim paramScientificName As New SqlParameter("@scientificName", SqlDbType.NVarChar)
                        paramScientificName.Direction = Data.ParameterDirection.Input
                        paramScientificName.Value = Request.QueryString("scientificName")
                        sqlCommand.Parameters.Add(paramScientificName)

                    End If



                    If Request.QueryString("collectionMonth") <> "" Then
                        'Dim paramCollectionMonth As New QueryStringParameter("collectionMonth", TypeCode.Int32, "collectionMonth")
                        Dim paramCollectionMonth As New SqlParameter("collectionMonth", SqlDbType.Int)
                        paramCollectionMonth.Direction = Data.ParameterDirection.Input
                        paramCollectionMonth.Value = Request.QueryString("collectionMonth")
                        sqlCommand.Parameters.Add(paramCollectionMonth)
                    End If

                    If Request.QueryString("familyID") <> "" Then
                        'Dim paramFamilyID As New QueryStringParameter("familyID", TypeCode.Int32, "familyID")
                        Dim paramFamilyID As New SqlParameter("@familyID", SqlDbType.Int)
                        paramFamilyID.Direction = Data.ParameterDirection.Input
                        paramFamilyID.Value = Request.QueryString("familyID")
                        sqlCommand.Parameters.Add(paramFamilyID)
                    End If

                    If Request.QueryString("genusID") <> "" Then
                        'Dim paramGenusID As New QueryStringParameter("genusID", TypeCode.Int32, "genusID")
                        Dim paramGenusID As New SqlParameter("genusID", SqlDbType.Int)
                        paramGenusID.Direction = Data.ParameterDirection.Input
                        paramGenusID.Value = Request.QueryString("genusID")
                        sqlCommand.Parameters.Add(paramGenusID)
                    End If

                    If Request.QueryString("speciesID") <> "" Then
                        'Dim paramSpeciesID As New QueryStringParameter("speciesID", TypeCode.Int32, "speciesID")
                        Dim paramSpeciesID As New SqlParameter("speciesID", SqlDbType.Int)
                        paramSpeciesID.Direction = Data.ParameterDirection.Input
                        paramSpeciesID.Value = Request.QueryString("speciesID")
                        sqlCommand.Parameters.Add(paramSpeciesID)
                    End If

                    If Request.QueryString("countryNo") <> "" Then
                        'Dim paramCountryNo As New QueryStringParameter("countryNo", TypeCode.Int32, "countryNo")
                        Dim paramCountryNo As New SqlParameter("countryNo", SqlDbType.Int)
                        paramCountryNo.Direction = Data.ParameterDirection.Input
                        paramCountryNo.Value = Request.QueryString("countryNo")
                        sqlCommand.Parameters.Add(paramCountryNo)
                    End If

                    If Request.QueryString("provinceNo") <> "" Then
                        'Dim paramProvinceNo As New QueryStringParameter("provinceNo", TypeCode.Int32, "provinceNo")
                        Dim paramProvinceNo As New SqlParameter("provinceNo", SqlDbType.Int)
                        paramProvinceNo.Direction = Data.ParameterDirection.Input
                        paramProvinceNo.Value = Request.QueryString("provinceNo")
                        sqlCommand.Parameters.Add(paramProvinceNo)
                    End If


                    If Request.QueryString("hsienNo") <> "" Then
                        'Dim paramHsienNo As New QueryStringParameter("hsienNo", TypeCode.Int32, "hsienNo")
                        Dim paramHsienNo As New SqlParameter("hsienNo", SqlDbType.Int)
                        paramHsienNo.Direction = Data.ParameterDirection.Input
                        paramHsienNo.Value = Request.QueryString("hsienNo")
                        sqlCommand.Parameters.Add(paramHsienNo)
                    End If

                    If Request.QueryString("townNo") <> "" Then
                        'Dim paramTownNo As New QueryStringParameter("townNo", TypeCode.Int32, "townNo")
                        Dim paramTownNo As New SqlParameter("townNo", SqlDbType.Int)
                        paramTownNo.Direction = Data.ParameterDirection.Input
                        paramTownNo.Value = Request.QueryString("townNo")
                        sqlCommand.Parameters.Add(paramTownNo)
                    End If

                    If Request.QueryString("parkNo") <> "" Then
                        'Dim paramParkNo As New QueryStringParameter("parkNo", TypeCode.Int32, "parkNo")
                        Dim paramParkNo As New SqlParameter("parkNo", SqlDbType.Int)
                        paramParkNo.Direction = Data.ParameterDirection.Input
                        paramParkNo.Value = Request.QueryString("parkNo")
                        sqlCommand.Parameters.Add(paramParkNo)
                    End If

                    If Request.QueryString("location") <> "" Then
                        'Dim paramLocation As New QueryStringParameter("location", TypeCode.String, "location")
                        Dim paramLocation As New SqlParameter("location", SqlDbType.NVarChar)
                        paramLocation.Direction = Data.ParameterDirection.Input
                        paramLocation.Value = Request.QueryString("location")
                        sqlCommand.Parameters.Add(paramLocation)
                    End If

                    If Request.QueryString("authorID") <> "" Then
                        'Dim paramSpeciesID As New QueryStringParameter("speciesID", TypeCode.Int32, "speciesID")
                        Dim paramAuthorID As New SqlParameter("authorID", SqlDbType.Int)
                        paramAuthorID.Direction = Data.ParameterDirection.Input
                        paramAuthorID.Value = Request.QueryString("authorID")
                        sqlCommand.Parameters.Add(paramAuthorID)
                    End If


                End If



                strRequestURL = "~/Photo/ImageHierarchicalC.aspx"
                strRequestURL = strRequestURL & Replace(Request.Url.PathAndQuery, Request.FilePath, "").ToString


                'setGridViewStyle()
                'setFields()

                'Dim dataAdapter As New SqlDataAdapter(sqlCommand)
                Dim dataAdapter = New SqlDataAdapter(sqlCommand)
                'dataAdapter = SqlDataAdapter(sqlCommand)
                conn.Open()

                dataAdapter.Fill(dsImage)


                'Dim dr As DataRow


                dv1 = New DataView
                dv1.Table = dsImage.Tables(1)
                'dv1.RowFilter = "classID = " & Request.QueryString("classID")
                dv1.Sort = "classID ASC"
                DataListClass.DataSource = dv1
                DataListClass.DataBind()




                dsImage.Tables(1).PrimaryKey = New DataColumn() {dsImage.Tables(1).Columns("classID")}
                dsImage.Tables(2).PrimaryKey = New DataColumn() {dsImage.Tables(2).Columns("familyID")}
                'dsImage.Tables(3).PrimaryKey = New DataColumn() {dsImage.Tables(3).Columns("genusID")}
                'dsImage.Tables(4).PrimaryKey = New DataColumn() {dsImage.Tables(4).Columns("speciesID")}


                'DataListClass.DataSource = dsImage.Tables(1)
                'DataListClass.DataKeyField = "classID"
                'DataListClass.DataBind()


                conn.Close()
                conn.Dispose()
            End If


        Catch ex As SqlException

            Response.Write("File not found!")

        Catch ex As Exception

            Response.Write("File not found!")


        End Try




    End Sub



    Protected Sub DataListClass_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataListClass.ItemDataBound

        CType(e.Item.FindControl("DataListFamily"), DataList).DataSource = dv2
        CType(e.Item.FindControl("DataListFamily"), DataList).DataBind()

    End Sub



    Protected Sub DataListClass_ItemCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataListClass.ItemCreated


        Dim strclass As String
        strclass = dv1.Item(e.Item.ItemIndex).Item("classE").ToString & "&nbsp;" & dv1.Item(e.Item.ItemIndex).Item("classC").ToString
        CType(e.Item.FindControl("Label1"), Label).Text = strclass

        dv2 = New DataView
        '測試不分family時，是否直接代換table(2)即可
        '測試結果ok，但要改圖示lable
        dv2.Table = dsImage.Tables(2)
        'dv2.Table = dsImage.Tables(0)

        dv2.RowFilter = "classID = " & dv1.Item(e.Item.ItemIndex).Item("classID").ToString


    End Sub



    Protected Sub DataListFamily_ItemCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs)

        'dv3 = New DataView
        'dv3.ta()

        Dim strHyperLinkFamily As String
        strHyperLinkFamily = dv2.Item(e.Item.ItemIndex).Item("familyE").ToString
        strHyperLinkFamily = strHyperLinkFamily & "<br />" & dv2.Item(e.Item.ItemIndex).Item("familyC").ToString

        CType(e.Item.FindControl("HyperLink2"), HyperLink).Text = strHyperLinkFamily

        Dim strUrl As String
        If strRequestURL.ToString.Contains("familyID") Then

            strUrl = strRequestURL
        Else
            strUrl = strRequestURL & "&familyID=" & dv2.Item(e.Item.ItemIndex).Item("familyID")

        End If

        CType(e.Item.FindControl("HyperLink2"), HyperLink).NavigateUrl = strUrl
        CType(e.Item.FindControl("HyperLink3"), HyperLink).NavigateUrl = strUrl

        Dim strFilter = "familyID =  " & dv2.Item(e.Item.ItemIndex).Item("familyID").ToString

        '統計各科種數
        dv5 = New DataView
        dv5.Table = dsImage.Tables(5)
        dv5.RowFilter = strFilter

        CType(e.Item.FindControl("Label6"), Label).Text = "共 " & dv5.Item(0).Item("summary").ToString & " 種"

    End Sub

End Class
