Imports System.Data
Imports System.Data.SqlClient

Partial Class Project_SinicaOutskirtsHierachicalC
    Inherits System.Web.UI.Page

    Function RunQuery(ByVal sqlQuery As SqlCommand) As DataSet
        Dim connectionString As String
        connectionString = ConfigurationManager.ConnectionStrings("HASTDBConnectionString").ConnectionString
        Dim dbConnection As New SqlConnection
        dbConnection.ConnectionString = connectionString
        Dim dbAdapter As New SqlDataAdapter
        dbAdapter.SelectCommand = sqlQuery
        sqlQuery.Connection = dbConnection
        Dim resultsDataSet As DataSet = New DataSet
        'Try
        dbAdapter.Fill(resultsDataSet)
        'Catch ex As Exception
        'End Try

        Return resultsDataSet

    End Function

    Sub PopulateFamily(ByVal node As TreeNode)

        Dim strSQL As String
        'strSQL = "SELECT familyID, familyE, familyC FROM  vwFamilyList WHERE class = @class "
        strSQL = "SELECT DISTINCT l.familyID, l.familyE, l.familyC FROM vwAreaSpeciesList AS l "
        strSQL += " LEFT JOIN speciesDescriptions AS dc ON l.speciesID = dc.speciesID "
        strSQL += " LEFT JOIN speciesDistributionArea AS dt ON l.speciesID = dt.speciesID "
        strSQL += " AND l.areaID = dt.areaID "
        strSQL += " WHERE classID = @class AND l.areaID = 2"
        strSQL += " AND characteristicC IS NOT NULL "

        If RadioButtonList1.SelectedValue = 1 Then
            strSQL = strSQL & " ORDER BY familyC"
        Else
            strSQL = strSQL & " ORDER BY familyE"
        End If


        Dim sqlQuery As New SqlCommand
        sqlQuery.CommandText = strSQL
        sqlQuery.Parameters.Add("@class", SqlDbType.SmallInt).Value = node.Value

        Dim ResultSet As DataSet = RunQuery(sqlQuery)
        If ResultSet.Tables.Count > 0 Then
            Dim row As DataRow
            For Each row In ResultSet.Tables(0).Rows
                'Dim NewNode As TreeNode = New TreeNode(row("familyC").ToString(), row("familyID").ToString)
                Dim NewNode As New TreeNode
                NewNode.Value = row("familyID").ToString
                If RadioButtonList1.SelectedValue = 1 Then
                    NewNode.Text = Trim(row("familyC").ToString() & " " & row("familyE").ToString())
                Else
                    NewNode.Text = Trim(row("familyE").ToString() & " " & row("familyC").ToString())
                End If

                'NewNode.PopulateOnDemand = False
                'NewNode.SelectAction = TreeNodeSelectAction.None
                NewNode.PopulateOnDemand = True
                NewNode.SelectAction = TreeNodeSelectAction.Expand
                node.ChildNodes.Add(NewNode)
            Next
        End If
    End Sub

    Sub PopulateGenus(ByVal node As TreeNode)

        Dim strSQL As String
        'strSQL = "SELECT genusID, genusE, genusC FROM vwGenusList WHERE familyID = @familyID "
        strSQL = "SELECT DISTINCT l.genusID, l.genusE, l.genusC FROM vwAreaSpeciesList as l "
        strSQL += " LEFT JOIN speciesDescriptions AS dc ON l.speciesID = dc.speciesID "
        strSQL += " LEFT JOIN speciesDistributionArea AS dt ON l.speciesID = dt.speciesID "
        strSQL += " AND l.areaID = dt.areaID "
        strSQL += " WHERE familyID = @familyID AND l.areaID = 2"
        strSQL += " AND characteristicC IS NOT NULL "


        If RadioButtonList1.SelectedValue = 1 Then
            strSQL = strSQL & " ORDER BY genusC"
        Else
            strSQL = strSQL & " ORDER BY genusE"
        End If



        Dim sqlQuery As New SqlCommand
        sqlQuery.CommandText = strSQL
        sqlQuery.Parameters.Add("@familyID", SqlDbType.Int).Value = node.Value

        Dim ResultSet As DataSet = RunQuery(sqlQuery)
        If ResultSet.Tables.Count > 0 Then
            Dim row As DataRow
            For Each row In ResultSet.Tables(0).Rows
                'Dim NewNode As TreeNode = New TreeNode(row("genusC").ToString(), row("genusID").ToString)

                Dim NewNode As New TreeNode

                NewNode.Value = row("genusID").ToString
                If RadioButtonList1.SelectedValue = 1 Then
                    NewNode.Text = Trim(row("genusC").ToString() & " " & row("genusE").ToString())
                Else
                    NewNode.Text = Trim(row("genusE").ToString() & " " & row("genusC").ToString())
                End If

                NewNode.PopulateOnDemand = True
                NewNode.SelectAction = TreeNodeSelectAction.Expand
                node.ChildNodes.Add(NewNode)
            Next
        End If
    End Sub

    Sub PopulateSpecies(ByVal node As TreeNode)

        Dim strSQL As String
        'strSQL = "SELECT DISTINCT speciesID, speciesE, speciesC FROM vwSpeciesWeb WHERE genusID = @genusID "
        strSQL = "SELECT DISTINCT l.listID, l.speciesID, l.speciesE, l.speciesC FROM vwAreaSpeciesList AS l "
        strSQL += " LEFT JOIN speciesDescriptions AS dc ON l.speciesID = dc.speciesID "
        strSQL += " LEFT JOIN speciesDistributionArea AS dt ON l.speciesID = dt.speciesID "
        strSQL += " AND l.areaID = dt.areaID "
        strSQL += " WHERE genusID = @genusID AND l.areaID = 2"

        strSQL += " AND characteristicC IS NOT NULL "


        If RadioButtonList1.SelectedValue = 1 Then
            strSQL = strSQL & " ORDER BY speciesC"
        Else
            strSQL = strSQL & " ORDER BY speciesE"
        End If



        Dim sqlQuery As New SqlCommand
        sqlQuery.CommandText = strSQL
        sqlQuery.Parameters.Add("@genusID", SqlDbType.Int).Value = node.Value

        Dim ResultSet As DataSet = RunQuery(sqlQuery)
        If ResultSet.Tables.Count > 0 Then
            Dim row As DataRow
            For Each row In ResultSet.Tables(0).Rows
                'Dim NewNode As TreeNode = New TreeNode(row("speciesC").ToString(), row("speciesID").ToString)

                Dim NewNode As New TreeNode
                NewNode.Value = row("speciesID").ToString
                If RadioButtonList1.SelectedValue = 1 Then
                    NewNode.Text = Trim(row("speciesC").ToString() & " " & row("speciesE").ToString())
                Else
                    NewNode.Text = Trim(row("speciesE").ToString() & " " & row("speciesC").ToString())
                End If
                'NewNode.NavigateUrl = "~/Taxon/SpeciesDetailC.aspx?speciesID=" & row("speciesID").ToString
                NewNode.NavigateUrl = "~/Project/SpeciesDetailC.aspx?lID=" & row("listID").ToString
                NewNode.NavigateUrl += "&QP=" & "SinicaOutskirts"
                NewNode.Target = "_blank"

                NewNode.PopulateOnDemand = False
                NewNode.SelectAction = TreeNodeSelectAction.Select
                node.ChildNodes.Add(NewNode)
            Next
        End If
    End Sub


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            PopulateClass(0)

        End If

        'TreeView1.ExpandAll()




    End Sub

    Protected Sub TreeView1_TreeNodePopulate(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.TreeNodeEventArgs) Handles TreeView1.TreeNodePopulate
        '新的作法，綱已先填入，再填科屬種

        If e.Node.ChildNodes.Count = 0 Then

            Select Case e.Node.Depth
                'Case 0
                '   PopulateClassX(e.Node)
                Case 0
                    PopulateFamily(e.Node)
                Case 1
                    PopulateGenus(e.Node)
                Case 2
                    PopulateSpecies(e.Node)
            End Select
        End If

    End Sub

    Sub PopulateClass(ByVal classID As Integer)

        Dim strSQL As String

        'If classID = 0 Then
        'strSQL = "SELECT classID, classE, classC FROM classX ORDER BY classID"
        'Else
        '    strSQL = "SELECT classID, classE, classC FROM classX WHERE classID = " & classID.ToString

        'End If

        If RadioButtonList1.SelectedValue = 1 Then
            'strSQL = "SELECT classID, classE, classC FROM classX ORDER BY classID"
            strSQL = "SELECT DISTINCT classID, classE, classC FROM vwAreaSpeciesList ORDER BY classID"

        Else
            'strSQL = "SELECT classID, classE, classC FROM classX ORDER BY classE"
            strSQL = "SELECT DISTINCT classID, classE, classC FROM vwAreaSpeciesList ORDER BY classE"

        End If



        Dim sqlQuery As New SqlCommand(strSQL)

        Dim ResultSet As DataSet
        ResultSet = RunQuery(sqlQuery)

        If ResultSet.Tables.Count > 0 Then
            Dim row As DataRow
            For Each row In ResultSet.Tables(0).Rows
                'Dim NewNode As TreeNode = New TreeNode(row("classC").ToString, row("classID").ToString)
                Dim NewNode As New TreeNode
                If RadioButtonList1.SelectedValue = 1 Then
                    NewNode.Text = Trim(row("classC").ToString & " " & row("classE").ToString)
                Else
                    NewNode.Text = Trim(row("classE").ToString & " " & row("classC").ToString)
                End If


                NewNode.Value = row("classID").ToString

                NewNode.PopulateOnDemand = True
                NewNode.SelectAction = TreeNodeSelectAction.Expand
                NewNode.Expanded = False
                'root.ChildNodes.Add(NewNode)
                TreeView1.Nodes.Add(NewNode)
            Next
        End If

    End Sub

    Protected Sub RadioButtonList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList1.SelectedIndexChanged

        TreeView1.Nodes.Clear()

        PopulateClass(0)

    End Sub
End Class
