Imports System.Data
Imports System.Data.SqlClient

Partial Class Mgm_general_ImageList
    Inherits System.Web.UI.Page
    Function RunQuery(ByVal sqlQuery As SqlCommand) As DataSet
        Dim connectionString As String
        connectionString = ConfigurationManager.ConnectionStrings("PhotoDBConnectionString").ConnectionString
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


    Sub PopulateClassX(ByVal node As TreeNode)

        Dim sqlQuery As New SqlCommand("SELECT classID, classE, classC FROM classX")
        Dim ResultSet As DataSet
        ResultSet = RunQuery(sqlQuery)

        If ResultSet.Tables.Count > 0 Then
            Dim row As DataRow
            For Each row In ResultSet.Tables(0).Rows
                Dim NewNode As TreeNode = New TreeNode(row("classC").ToString, row("classID").ToString)
                NewNode.PopulateOnDemand = True
                NewNode.SelectAction = TreeNodeSelectAction.Expand
                node.ChildNodes.Add(NewNode)
            Next
        End If

    End Sub

    Sub PopulateFamily(ByVal node As TreeNode)

        Dim sqlQuery As New SqlCommand
        sqlQuery.CommandText = "SELECT familyID, familyE, familyC FROM  vwFamily WHERE class = @class ORDER BY familyC"
        sqlQuery.Parameters.Add("@class", SqlDbType.SmallInt).Value = node.Value

        Dim ResultSet As DataSet = RunQuery(sqlQuery)
        If ResultSet.Tables.Count > 0 Then
            Dim row As DataRow
            For Each row In ResultSet.Tables(0).Rows
                Dim NewNode As TreeNode = New TreeNode(row("familyC").ToString(), row("familyID").ToString)
                'NewNode.PopulateOnDemand = False
                'NewNode.SelectAction = TreeNodeSelectAction.None
                NewNode.PopulateOnDemand = True
                NewNode.SelectAction = TreeNodeSelectAction.Expand
                node.ChildNodes.Add(NewNode)
            Next
        End If
    End Sub

    Sub PopulateGenus(ByVal node As TreeNode)

        Dim sqlQuery As New SqlCommand
        sqlQuery.CommandText = "SELECT genusID, genusE, genusC FROM vwGenus WHERE familyID = @familyID ORDER BY genusC"
        sqlQuery.Parameters.Add("@familyID", SqlDbType.Int).Value = node.Value

        Dim ResultSet As DataSet = RunQuery(sqlQuery)
        If ResultSet.Tables.Count > 0 Then
            Dim row As DataRow
            For Each row In ResultSet.Tables(0).Rows
                Dim NewNode As TreeNode = New TreeNode(row("genusC").ToString(), row("genusID").ToString)
                NewNode.PopulateOnDemand = True
                NewNode.SelectAction = TreeNodeSelectAction.Expand
                node.ChildNodes.Add(NewNode)
            Next
        End If
    End Sub

    Sub PopulateSpecies(ByVal node As TreeNode)

        Dim sqlQuery As New SqlCommand
        sqlQuery.CommandText = "SELECT speciesID, speciesE, speciesC FROM vwSpecies WHERE genusID = @genusID ORDER BY speciesC"
        sqlQuery.Parameters.Add("@genusID", SqlDbType.Int).Value = node.Value

        Dim ResultSet As DataSet = RunQuery(sqlQuery)
        If ResultSet.Tables.Count > 0 Then
            Dim row As DataRow
            For Each row In ResultSet.Tables(0).Rows
                Dim NewNode As TreeNode = New TreeNode(row("speciesC").ToString(), row("speciesID").ToString)
                NewNode.PopulateOnDemand = False
                NewNode.SelectAction = TreeNodeSelectAction.Select
                node.ChildNodes.Add(NewNode)
            Next
        End If
    End Sub



    Protected Sub TreeView1_TreeNodePopulate(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.TreeNodeEventArgs) Handles TreeView1.TreeNodePopulate

        If e.Node.ChildNodes.Count = 0 Then

            Select Case e.Node.Depth
                Case 0
                    PopulateClassX(e.Node)
                Case 1
                    PopulateFamily(e.Node)
                Case 2
                    PopulateGenus(e.Node)
                Case 3
                    PopulateSpecies(e.Node)
            End Select
        End If

    End Sub

End Class
