Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration
Imports System.Data.Common


Partial Class Taxon_Genus_SpeciesListTwE
    Inherits System.Web.UI.Page

    Private dsSpeciesList As New DataSet

    Dim dv1, dv2 As DataView 'dv1處理筆劃, dv2處理family

    Private _ds As DataSet

    'Dim dv As DataView
    Dim container As Object

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

           

            Dim comm As DbCommand = GenericDataAccess.CreateCommand("ScientificName")
            comm.CommandText = "prSpeciesListTW"
            _ds = GenericDataAccess.ExecuteSelectCommandDataSet(comm)

            dv1 = New DataView
            dv1.Table = _ds.Tables(0)
            'dsFamilyList.Tables(1).PrimaryKey = New DataColumn() {dsFamilyList.Tables(1).Columns("strokeID")}

            If Request.QueryString("FamilyID") <> "" Then

                dv1.RowFilter = "familyID = " & Request.QueryString("familyID").ToString

                dv1.Sort = "genusE ASC"

                DataListGenus.DataSource = dv1
                DataListGenus.DataBind()

                DataListGenusSpecies.DataSource = dv1
                DataListGenusSpecies.DataBind()

                If dv1.Count = 0 Then
                    LabelUpperTaxon.Text = "無查詢結果"
                Else

                    Dim strUpperTaxon As String
                    strUpperTaxon = dv1.Item(0).Item("tracheophyte").ToString
                    ' strUpperTaxon = strUpperTaxon & "&nbsp;" & dv1.Item(0).Item("classC").ToString
                    strUpperTaxon = strUpperTaxon & "&nbsp;>&nbsp;" & dv1.Item(0).Item("orderE").ToString
                    strUpperTaxon = strUpperTaxon & "&nbsp;>&nbsp;" & dv1.Item(0).Item("familyE").ToString
                    strUpperTaxon = strUpperTaxon & "&nbsp;" & dv1.Item(0).Item("familyC").ToString

                    LabelUpperTaxon.Text = strUpperTaxon

                End If

                'dsSpeciesList.Tables(0).PrimaryKey = New DataColumn() {dsSpeciesList.Tables(0).Columns("genusID")}
                'dsSpeciesList.Tables(1).PrimaryKey = New DataColumn() {dsSpeciesList.Tables(1).Columns("speciesID")}

            End If

        End If

    End Sub

    Protected Sub DataListGenus_ItemCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataListGenus.ItemCreated

        Dim strHyperLinkText As String

        strHyperLinkText = dv1.Item(e.Item.ItemIndex).Item("genusE").ToString '& " " & dv1.Item(e.Item.ItemIndex).Item("genusC").ToString)

        CType(e.Item.FindControl("HyperLinkGenus"), HyperLink).Text = strHyperLinkText

        CType(e.Item.FindControl("HyperLinkGenus"), HyperLink).NavigateUrl = "#" & dv1.Item(e.Item.ItemIndex).Item("genusE").ToString

    End Sub

    Protected Sub DataListGenusSpecies_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataListGenusSpecies.ItemDataBound

        Dim drv As DataRowView = DirectCast(e.Item.DataItem, DataRowView)

        Dim strLabelGenus As String
        strLabelGenus = "<a name='"

        strLabelGenus = strLabelGenus & drv("genusE").ToString
        'strLabelGenus = strLabelGenus & "'>" & Trim(drv("genusC").ToString & " " & drv("genusE").ToString)
        strLabelGenus = strLabelGenus & "'>" & drv("genusE").ToString
        strLabelGenus = strLabelGenus & "</ a>"

        CType(e.Item.FindControl("LabelGenus"), Label).Text = strLabelGenus

        dv2 = New DataView

        dv2.Table = _ds.Tables(1)
        dv2.RowFilter = "genusID = " & dv1.Item(e.Item.ItemIndex).Item("genusID").ToString

        dv2.Sort = "speciesE ASC"

        CType(e.Item.FindControl("DataListSpecies"), DataList).DataSource = dv2
        CType(e.Item.FindControl("DataListSpecies"), DataList).DataBind()

    End Sub

    Protected Sub DataListSpecies_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs)

        Dim strHyperLinkText As String

        strHyperLinkText = dv2.Item(e.Item.ItemIndex).Item("speciesE").ToString
       
        CType(e.Item.FindControl("HyperLinkSpecies"), HyperLink).Text = strHyperLinkText
        CType(e.Item.FindControl("HyperLinkSpecies"), HyperLink).NavigateUrl = "~/Taxon/speciesDetailE.aspx?speciesID=" & dv2.Item(e.Item.ItemIndex).Item("speciesID").ToString
        CType(e.Item.FindControl("HyperLinkSpecies"), HyperLink).Target = "_self"

    End Sub


    'Sub DBConnection()


    '    Dim connSetting As ConnectionStringSettings = WebConfigurationManager.ConnectionStrings("HASTDBConnectionString")
    '    Dim conn As SqlConnection = New SqlConnection(connSetting.ConnectionString)

    '    Dim strSQL As String
    '    strSQL = "SELECT DISTINCT familyID, genusID, genusE, genusC FROM vwSpeciesListTW ; "
    '    strSQL = strSQL & "SELECT DISTINCT genusID, speciesID, speciesE, speciesC, speciesExpr FROM vwSpeciesListTW "

    '    Dim sqlCommand As SqlCommand = New SqlCommand(strSQL, conn)
    '    sqlCommand.CommandType = CommandType.Text


    '    'Dim dataAdapter = New SqlDataAdapter(sqlCommand)


    '    Dim dataAdapter = New SqlDataAdapter(sqlCommand)

    '    conn.Open()

    '    dataAdapter.Fill(dsSpeciesList)

    '    dv1 = New DataView
    '    dv1.Table = dsSpeciesList.Tables(0)

    '    If Request.QueryString("FamilyID") <> "" Then

    '        dv1.RowFilter = "familyID = " & Request.QueryString("familyID").ToString
    '        'dv1.Sort = "genusC ASC"

    '        'If RadioButtonList1.SelectedValue = 1 Then
    '        '    dv1.Sort = "genusC ASC"
    '        'Else
    '        dv1.Sort = "genusE ASC"
    '        'End If


    '        DataListGenus.DataSource = dv1
    '        DataListGenus.DataBind()

    '        DataListGenusSpecies.DataSource = dv1
    '        DataListGenusSpecies.DataBind()



    '        dsSpeciesList.Tables(0).PrimaryKey = New DataColumn() {dsSpeciesList.Tables(0).Columns("genusID")}
    '        dsSpeciesList.Tables(1).PrimaryKey = New DataColumn() {dsSpeciesList.Tables(1).Columns("speciesID")}
    '    End If


    '    conn.Close()
    '    conn.Dispose()

    'End Sub

End Class
