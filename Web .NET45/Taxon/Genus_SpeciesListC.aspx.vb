Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration

Partial Class Taxon_SpeciesListC
    Inherits System.Web.UI.Page

    Private dsSpeciesList As New DataSet
    'Private dataAdapterGenus As New SqlDataAdapter
    'Private dataAdapterSpecies As New SqlDataAdapter

    Dim dv1, dv2 As DataView 'dv1處理筆劃, dv2處理family


    Dim dv As DataView
    Dim container As Object

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            Dim connSetting As ConnectionStringSettings = WebConfigurationManager.ConnectionStrings("HASTDBConnectionString")
            Dim conn As SqlConnection = New SqlConnection(connSetting.ConnectionString)

            Dim strSQL As String
            strSQL = "SELECT familyID, genusID, genusE, genusC, classC, classE, familyC, familyE FROM vwGenus ; "
            strSQL = strSQL & "SELECT genusID, speciesID, speciesE, speciesC, speciesExpr FROM vwSpecies "

            Dim sqlCommand As SqlCommand = New SqlCommand(strSQL, conn)
            sqlCommand.CommandType = CommandType.Text


            'Dim dataAdapter = New SqlDataAdapter(sqlCommand)


            Dim dataAdapter = New SqlDataAdapter(sqlCommand)

            conn.Open()

            dataAdapter.Fill(dsSpeciesList)

            dv1 = New DataView
            dv1.Table = dsSpeciesList.Tables(0)
            'dsFamilyList.Tables(1).PrimaryKey = New DataColumn() {dsFamilyList.Tables(1).Columns("strokeID")}

            If Request.QueryString("FamilyID") <> "" Then



                dv1.RowFilter = "familyID = " & Request.QueryString("familyID").ToString
                dv1.Sort = "genusC ASC"

                DataListGenus.DataSource = dv1
                DataListGenus.DataBind()

                DataListGenusSpecies.DataSource = dv1
                DataListGenusSpecies.DataBind()


                If dv1.Count = 0 Then
                    LabelUpperTaxon.Text = "無查詢結果"
                Else

                    Dim strUpperTaxon As String
                    strUpperTaxon = dv1.Item(0).Item("classE").ToString
                    strUpperTaxon = strUpperTaxon & "&nbsp;" & dv1.Item(0).Item("classC").ToString
                    strUpperTaxon = strUpperTaxon & "&nbsp;>&nbsp;" & dv1.Item(0).Item("familyE").ToString
                    strUpperTaxon = strUpperTaxon & "&nbsp;" & dv1.Item(0).Item("familyC").ToString

                    LabelUpperTaxon.Text = strUpperTaxon

                End If



                dsSpeciesList.Tables(0).PrimaryKey = New DataColumn() {dsSpeciesList.Tables(0).Columns("genusID")}
                dsSpeciesList.Tables(1).PrimaryKey = New DataColumn() {dsSpeciesList.Tables(1).Columns("speciesID")}
            End If


            conn.Close()
            conn.Dispose()
        End If




    End Sub

    Protected Sub DataListGenus_ItemCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataListGenus.ItemCreated

        'Dim drv As DataRowView = DirectCast(e.Item.DataItem, DataRowView)
        'CType(e.Item.FindControl("HyperLinkGenus"), HyperLink).Text = Trim(drv("genusC").ToString & " " & drv("genusE").ToString)

        Dim strHyperLinkText As String

        If RadioButtonList1.SelectedValue = 1 Then

            strHyperLinkText = Trim(dv1.Item(e.Item.ItemIndex).Item("genusC").ToString & " " & dv1.Item(e.Item.ItemIndex).Item("genusE").ToString)

        Else

            strHyperLinkText = Trim(dv1.Item(e.Item.ItemIndex).Item("genusE").ToString & " " & dv1.Item(e.Item.ItemIndex).Item("genusC").ToString)


        End If



        CType(e.Item.FindControl("HyperLinkGenus"), HyperLink).Text = strHyperLinkText

        CType(e.Item.FindControl("HyperLinkGenus"), HyperLink).NavigateUrl = "#" & dv1.Item(e.Item.ItemIndex).Item("genusE").ToString



    End Sub


    Protected Sub DataListGenus_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataListGenus.ItemDataBound


        'CType(e.Item.FindControl("HyperLinkgenus"), HyperLink).Text = Trim(dv1.Item(e.Item.ItemIndex).Item("genusC").ToString & " " & dv1.Item(e.Item.ItemIndex).Item("genusE").ToString)

    End Sub

    Protected Sub DataListGenusSpecies_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataListGenusSpecies.ItemDataBound

        Dim drv As DataRowView = DirectCast(e.Item.DataItem, DataRowView)

        'CType(e.Item.FindControl("LabelGenus"), Label).Text = Trim(drv("genusC").ToString & " " & drv("genusE").ToString)

        Dim strLabelGenus As String
        strLabelGenus = "<a name='"

        strLabelGenus = strLabelGenus & drv("genusE").ToString
        strLabelGenus = strLabelGenus & "'>" & Trim(drv("genusC").ToString & " " & drv("genusE").ToString)
        strLabelGenus = strLabelGenus & "</ a>"

        CType(e.Item.FindControl("LabelGenus"), Label).Text = strLabelGenus

        'SDSSpecies.SelectParameters("genusID").DefaultValue = drv("genusID").ToString

        'Dim SDSspecies As SqlDataSource
        ''If e.Item.ItemType = ListItemType.Item OrElse e.Item.ItemType = ListItemType.AlternatingItem Then
        'SDSspecies = TryCast(e.Item.FindControl("SDSspecies"), SqlDataSource)
        'If SDSspecies IsNot Nothing Then
        '    SDSspecies.SelectParameters("genusID").DefaultValue = TryCast(e.Item.DataItem, DataRowView)("genusID").ToString()

        'End If
        ''End If



        'dv2 = New DataView
        'dv2.Table = dsSpeciesList.Tables(1)
        'dsFamilyList.Tables(1).PrimaryKey = New DataColumn() {dsFamilyList.Tables(1).Columns("strokeID")}
        'dv2.RowFilter = "genusID = " & drv("genusID").ToString

        dv2 = New DataView
        dv2.Table = dsSpeciesList.Tables(1)
        dv2.RowFilter = "genusID = " & dv1.Item(e.Item.ItemIndex).Item("genusID").ToString

        If RadioButtonList1.SelectedValue = 1 Then
            dv2.Sort = "speciesC ASC"
        Else
            dv2.Sort = "speciesE ASC"
        End If



        CType(e.Item.FindControl("DataListSpecies"), DataList).DataSource = dv2
        CType(e.Item.FindControl("DataListSpecies"), DataList).DataBind()

    End Sub

    Protected Sub DataListSpecies_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs)

        'Dim drv As DataRowView = DirectCast(e.Item.DataItem, DataRowView)
        ' CType(e.Item.FindControl("HyperLinkSpecies"), HyperLink).Text = Trim(drv("speciesC").ToString & " " & drv("speciesE").ToString)

        Dim strHyperLinkText As String

        If RadioButtonList1.SelectedValue = 1 Then
            strHyperLinkText = dv2.Item(e.Item.ItemIndex).Item("speciesC").ToString
            strHyperLinkText = strHyperLinkText & " " & dv2.Item(e.Item.ItemIndex).Item("speciesE").ToString

        Else

            strHyperLinkText = dv2.Item(e.Item.ItemIndex).Item("speciesE").ToString
            strHyperLinkText = strHyperLinkText & " " & dv2.Item(e.Item.ItemIndex).Item("speciesC").ToString
        End If

        'strHyperLinkText = dv2.Item(e.Item.ItemIndex).Item("speciesC").ToString
        'strHyperLinkText = strHyperLinkText & dv2.Item(e.Item.ItemIndex).Item("speciesE").ToString
        CType(e.Item.FindControl("HyperLinkSpecies"), HyperLink).Text = strHyperLinkText
        CType(e.Item.FindControl("HyperLinkSpecies"), HyperLink).NavigateUrl = "~/Taxon/speciesDetailC.aspx?speciesID=" & dv2.Item(e.Item.ItemIndex).Item("speciesID").ToString
        CType(e.Item.FindControl("HyperLinkSpecies"), HyperLink).Target = "_self"

    End Sub




    Protected Sub RadioButtonList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList1.SelectedIndexChanged
        'If RadioButtonList1.SelectedValue = 1 Then
        '    dv2.Sort = "speciecsC ASC"
        'Else
        '    dv2.Sort = "speciecsE ASC"

        'End If

        DBConnection()


    End Sub


    Sub DBConnection()


        Dim connSetting As ConnectionStringSettings = WebConfigurationManager.ConnectionStrings("HASTDBConnectionString")
        Dim conn As SqlConnection = New SqlConnection(connSetting.ConnectionString)

        Dim strSQL As String
        strSQL = "SELECT familyID, genusID, genusE, genusC FROM vwGenus ; "
        strSQL = strSQL & "SELECT genusID, speciesID, speciesE, speciesC, speciesExpr FROM vwSpecies "

        Dim sqlCommand As SqlCommand = New SqlCommand(strSQL, conn)
        sqlCommand.CommandType = CommandType.Text


        'Dim dataAdapter = New SqlDataAdapter(sqlCommand)


        Dim dataAdapter = New SqlDataAdapter(sqlCommand)

        conn.Open()

        dataAdapter.Fill(dsSpeciesList)

        dv1 = New DataView
        dv1.Table = dsSpeciesList.Tables(0)

        If Request.QueryString("FamilyID") <> "" Then

            dv1.RowFilter = "familyID = " & Request.QueryString("familyID").ToString
            'dv1.Sort = "genusC ASC"

            If RadioButtonList1.SelectedValue = 1 Then
                dv1.Sort = "genusC ASC"
            Else
                dv1.Sort = "genusE ASC"
            End If




            DataListGenus.DataSource = dv1
            DataListGenus.DataBind()

            DataListGenusSpecies.DataSource = dv1
            DataListGenusSpecies.DataBind()



            dsSpeciesList.Tables(0).PrimaryKey = New DataColumn() {dsSpeciesList.Tables(0).Columns("genusID")}
            dsSpeciesList.Tables(1).PrimaryKey = New DataColumn() {dsSpeciesList.Tables(1).Columns("speciesID")}
        End If


        conn.Close()
        conn.Dispose()

    End Sub


End Class
