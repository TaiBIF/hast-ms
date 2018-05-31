Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration
Imports HAST

Partial Class Photo_ImageHierarchicalE
    Inherits System.Web.UI.Page

    Private dsImage As New DataSet
    Private dataAdapter As New SqlDataAdapter

    Dim dv0, dv4 As DataView


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

                'Label1.Visible = False
                'Label2.Visible = False
                'Label3.Visible = False
                'Label4.Visible = False

                'Label1.Text = ""
                'Label2.Text = ""
                'Label3.Text = ""
                'Label4.Text = ""



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

                    If Context.User.IsInRole("Power User") Then

                        If Request.QueryString("publicWeb") = 0 Then

                            Dim paramPublicWeb As New SqlParameter("publicWeb", SqlDbType.Bit)
                            paramPublicWeb.Direction = Data.ParameterDirection.Input
                            paramPublicWeb.Value = 0
                            sqlCommand.Parameters.Add(paramPublicWeb)
                        End If
                    End If

                    If Request.QueryString("scientificName") <> "" Then

                        'Dim paramScientificName As New QueryStringParameter("scientificName", TypeCode.String, "scientificName")
                        Dim paramScientificName As New SqlParameter("scientificName", SqlDbType.NVarChar)
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
                        Dim paramFamilyID As New SqlParameter("familyID", SqlDbType.Int)
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
                        Dim paramAuthorID As New SqlParameter("authorID", SqlDbType.Int)
                        paramAuthorID.Direction = Data.ParameterDirection.Input
                        paramAuthorID.Value = Request.QueryString("authorID")
                        sqlCommand.Parameters.Add(paramAuthorID)
                    End If


                End If


                Dim dataAdapter = New SqlDataAdapter(sqlCommand)

                conn.Open()
                dataAdapter.Fill(dsImage)

                'Dim dr As DataRow


                dv4 = New DataView
                dv4.Table = dsImage.Tables(1)
                dv4.RowFilter = "groupset = 0 AND familyID = " & Request.QueryString("familyID")
                dv4.Sort = "speciesE ASC"
                DataListFamily.DataSource = dv4
                DataListFamily.DataBind()




                'dr = dsImage.Tables(1).Rows.Find("1")
                'If dr IsNot Nothing Then
                '    Label1.Visible = True
                '    Label1.Text = "<br />" & "蕨類"
                '    dv1 = New DataView
                '    dv1.Table = dsImage.Tables(2)
                '    dv1.RowFilter = "classID = 1"
                '    DataList1.DataSource = dv1
                '    DataList1.DataBind()

                'End If

                dv0 = New DataView
                dv0.Table = dsImage.Tables(0)

                If dv0.Count = 0 Then
                    LabelUpperTaxon.Text = "Not Found"
                Else

                    Dim strUpperTaxon As String
                    strUpperTaxon = dv0.Item(0).Item("classE").ToString
                    'strUpperTaxon = strUpperTaxon & "&nbsp;" & dv0.Item(0).Item("classC").ToString
                    strUpperTaxon = strUpperTaxon & "&nbsp;>&nbsp;" & dv0.Item(0).Item("familyE").ToString
                    'strUpperTaxon = strUpperTaxon & "&nbsp;" & dv0.Item(0).Item("familyC").ToString

                    LabelUpperTaxon.Text = strUpperTaxon

                End If

                conn.Close()
                conn.Dispose()

            End If

        Catch ex As SqlException

            Response.Write("File not found!")

        Catch ex As Exception

            Response.Write("File not found!")


        End Try


    End Sub

    Protected Sub DataListFamily_ItemCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataListFamily.ItemCreated

        'Dim dv As DataView

        'dv = SDSImages.Select(New DataSourceSelectArguments)
        ' dv = dv1.Item(e.Item.ItemIndex).Item("imageCode")
        'dv1 = dsImage.Tables(4)
        'Dim strFilePath As String
        '' strFilePath = ImageFilePath.GetImageFilePath(dv.Item(e.Item.ItemIndex).Item("imageCode"), "thumb")

        'strFilePath = ImageFilePath.GetImageFilePath(dv1.Item(e.Item.ItemIndex).Item("imageCode"), "thumb")
        Dim strSpecies As String
        strSpecies = dv4.Item(e.Item.ItemIndex).Item("speciesE").ToString '& "&nbsp;" & dv4.Item(e.Item.ItemIndex).Item("speciesC").ToString
        CType(e.Item.FindControl("Label1"), Label).Text = strSpecies

        dv0 = New DataView
        dv0.Table = dsImage.Tables(0)

        dv0.RowFilter = "SpeciesID = " & dv4.Item(e.Item.ItemIndex).Item("speciesID").ToString
        'CType(e.Item.FindControl("DataListSpecies"), DataList).DataSource = dv0
        'CType(e.Item.FindControl("DataListSpecies"), DataList).DataBind()


        'CType(e.Item.FindControl("Image1"), System.Web.UI.WebControls.Image).ImageUrl = strFilePath
        'CType(e.Item.FindControl("Image1"), System.Web.UI.WebControls.Image).AlternateText = dv1.Item(e.Item.ItemIndex).Item("imageCode").ToString

        'dv1.Dispose()
    End Sub

    Protected Sub DataListFamily_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataListFamily.ItemDataBound

        CType(e.Item.FindControl("DataListSpecies"), DataList).DataSource = dv0
        CType(e.Item.FindControl("DataListSpecies"), DataList).DataBind()


    End Sub

    Public Function GetImage(ByVal imageCode As String) As String

        Return ImageFilePath.GetImageFilePath(imageCode, "thumb")

    End Function



End Class
