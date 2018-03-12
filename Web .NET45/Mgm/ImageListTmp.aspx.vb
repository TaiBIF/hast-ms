Imports System.Web.Configuration
Imports System.Data
Imports System.Data.SqlClient

Partial Class Mgm_ImageListTmp
    Inherits System.Web.UI.Page

    Dim strFamilySelectCommand As String
    Dim strGenusSelectCommand As String
    Dim strSpeciesSelectCommand As String




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

    Sub QueryFamily(ByVal options As Integer)

        strFamilySelectCommand = "SELECT class, familyID, familyE, familyC, familyExpr, total FROM vwImgCountFamily WHERE (class = @paramClass) "

        'strFamilySelectCommand = "SELECT familyID AS ID, familyE AS 科名, familyC AS 中文科名, total AS 影像張數 FROM vwImgCountFamily WHERE (class = @paramClass) "



        Dim strCondition As String
        strCondition = ""

        Select Case options

            Case 0  '列出全部科
                strCondition = "ORDER BY familyE"
            Case 1  '列出有影像的科
                strCondition = "AND total <> 0 ORDER BY familyE"
            Case 2  '列出沒影像的科
                strCondition = "AND total = 0 ORDER BY familyE"
        End Select

        strFamilySelectCommand += strCondition

        'Dim classParameter As New ControlParameter
        'classParameter.Name = "paramClass"
        ''classParameter.Type = TypeCode.Int16
        'classParameter.ControlID = TreeView1.ID.ToString
        'classParameter.DefaultValue = TreeView1.SelectedValue

        'Dim classparameter As New ControlParameter("paramClass", "TreeView1", "SelectedValue")

        SDSFamily.SelectCommand = strFamilySelectCommand
        'SDSFamily.SelectParameters.Add(classParameter)

        gridViewFamily.DataSourceID = SDSFamily.ID

    End Sub

    Sub QueryGenus(ByVal options As Integer)

        strGenusSelectCommand = "SELECT familyID, genusID, genusE, genusC, genusExpr, total FROM vwImgCountGenus WHERE (familyID = @paramFamilyID) "

        Dim strCondition As String
        strCondition = ""

        Select Case options
            Case 0  '
                strCondition = "ORDER BY genusE"
            Case 1  '
                strCondition = "AND total <> 0 ORDER BY genusE"
            Case 2  '
                strCondition = "AND total = 0 ORDER BY genusE"
        End Select

        strGenusSelectCommand += strCondition

        SDSGenus.SelectCommand = strGenusSelectCommand

        gridViewGenus.DataSourceID = SDSGenus.ID


    End Sub

    Sub QuerySpecies(ByVal options As Integer, ByVal qryGenusID As Integer)

        '此判斷式用來處理不同來源傳入之qryGenusID值
        If qryGenusID <> 0 Then '若qryGenusID不為0，表示是由treeview1或gridviewGenus傳入
            Session("genusID") = qryGenusID  '將qryGenusID存入Session中，取代舊值
        Else
            '若為qryGenusID為0，表示由RadioButton2傳入，則直接取用session舊值
        End If

        'strSpeciesSelectCommand = "SELECT genusID, speciesID, speciesE, speciesC, speciesExpr, total FROM vwImgCountSpecies WHERE (genusID = @paramGenusID) "
        'strSpeciesSelectCommand = "SELECT familyID, genusID, speciesID, speciesE, speciesC, speciesExpr, total FROM vwImgCountSpecies WHERE (genusID = " & qryGenusID & ") "

        strSpeciesSelectCommand = "SELECT familyID, genusID, speciesID, speciesE, speciesC, speciesExpr, total FROM vwImgCountSpecies WHERE (genusID = " & Session("genusID") & ") "

        Dim strCondition As String
        strCondition = ""

        Select Case options
            Case 0  '
                strCondition = "ORDER BY speciesE"
            Case 1  '
                strCondition = "AND total <> 0 ORDER BY speciesE"
            Case 2  '
                strCondition = "AND total = 0 ORDER BY speciesE"
        End Select

        strSpeciesSelectCommand += strCondition

        SDSSpecies.SelectCommand = strSpeciesSelectCommand

        gridViewSpecies.DataSourceID = SDSSpecies.ID

    End Sub


    Sub PopulateClassX(ByVal node As TreeNode)

        Dim sqlQuery As New SqlCommand("SELECT classID, classE, classC FROM classX")
        Dim ResultSet As DataSet
        ResultSet = RunQuery(sqlQuery)

        If ResultSet.Tables.Count > 0 Then
            Dim row As DataRow
            For Each row In ResultSet.Tables(0).Rows
                Dim NewNode As TreeNode = New TreeNode(row("classC").ToString, row("classID").ToString)
                NewNode.PopulateOnDemand = True
                'NewNode.SelectAction = TreeNodeSelectAction.Expand
                NewNode.SelectAction = TreeNodeSelectAction.SelectExpand

                node.ChildNodes.Add(NewNode)
            Next
        End If

    End Sub

    Sub PopulateFamily(ByVal node As TreeNode)

        Dim sqlQuery As New SqlCommand
        sqlQuery.CommandText = "SELECT familyID, familyE, familyC FROM  family WHERE class = @class ORDER BY familyE"
        sqlQuery.Parameters.Add("@class", SqlDbType.SmallInt).Value = node.Value

        Dim ResultSet As DataSet = RunQuery(sqlQuery)
        If ResultSet.Tables.Count > 0 Then
            Dim row As DataRow
            For Each row In ResultSet.Tables(0).Rows
                Dim NewNode As TreeNode = New TreeNode(row("familyE").ToString(), row("familyID").ToString)
                'NewNode.PopulateOnDemand = False
                'NewNode.SelectAction = TreeNodeSelectAction.None
                NewNode.PopulateOnDemand = True
                'NewNode.SelectAction = TreeNodeSelectAction.Expand
                NewNode.SelectAction = TreeNodeSelectAction.SelectExpand
                node.ChildNodes.Add(NewNode)
            Next
        End If
    End Sub

    Sub PopulateGenus(ByVal node As TreeNode)

        Dim sqlQuery As New SqlCommand
        sqlQuery.CommandText = "SELECT genusID, genusE, genusC FROM vwGenus WHERE familyID = @familyID ORDER BY genusE"
        sqlQuery.Parameters.Add("@familyID", SqlDbType.Int).Value = node.Value

        Dim ResultSet As DataSet = RunQuery(sqlQuery)

        If ResultSet.Tables.Count > 0 Then
            Dim row As DataRow
            For Each row In ResultSet.Tables(0).Rows
                Dim NewNode As TreeNode = New TreeNode(row("genusE").ToString(), row("genusID").ToString)
                NewNode.PopulateOnDemand = True
                NewNode.SelectAction = TreeNodeSelectAction.Select
                node.ChildNodes.Add(NewNode)
            Next
        End If

    End Sub

    Sub PopulateSpecies(ByVal node As TreeNode)

        Dim sqlQuery As New SqlCommand
        sqlQuery.CommandText = "SELECT speciesID, speciesE, speciesC FROM vwSpecies WHERE genusID = @genusID ORDER BY speciesE"
        sqlQuery.Parameters.Add("@genusID", SqlDbType.Int).Value = node.Value

        Dim ResultSet As DataSet = RunQuery(sqlQuery)
        If ResultSet.Tables.Count > 0 Then
            Dim row As DataRow
            For Each row In ResultSet.Tables(0).Rows
                Dim NewNode As TreeNode = New TreeNode(row("speciesE").ToString(), row("speciesID").ToString)
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
                    'Case 3
                    '    PopulateSpecies(e.Node)
            End Select

        End If

    End Sub

    Protected Sub TreeView1_SelectedNodeChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles TreeView1.SelectedNodeChanged

        Select Case TreeView1.SelectedNode.Depth
            'Case 0
            '    mv.ActiveViewIndex = 0
            Case 1
                mv.ActiveViewIndex = 0
                'gridViewFamily.DataSourceID = SDSFamily.ID
                QueryFamily(0)

            Case 2
                mv.ActiveViewIndex = 1
                QueryGenus(0)

            Case 3
                mv.ActiveViewIndex = 2
                Dim selectedGenusID As Integer
                selectedGenusID = TreeView1.SelectedValue
                QuerySpecies(0, selectedGenusID)

        End Select

        'Dim XXX As String
        'XXX = TreeView1.SelectedValue.ToString
        'MsgBox(XXX)

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim strConnectionString As String
        strConnectionString = WebConfigurationManager.ConnectionStrings("PhotoDBConnectionString").ConnectionString

        SDSFamily.ConnectionString = strConnectionString
        SDSGenus.ConnectionString = strConnectionString
        SDSSpecies.ConnectionString = strConnectionString

        '已於類別階層定義
        'Dim strFamilySelectCommand As String
        'Dim strGenusSelectCommand As String
        'Dim strSpeciesSelectCommand As String

        'strFamilySelectCommand = "SELECT class, familyID, familyE, familyC, familyExpr, total FROM vwImgCountFamily WHERE (class = @paramClass)"
        'Dim classParameter As New QueryStringParameter
        'classParameter.Name = "paramClass"
        'classParameter.Type = TypeCode.Int16
        'SDSFamily.SelectParameters.Add(classParameter)

        'strGenusSelectCommand = ""
        'strSpeciesSelectCommand = ""

        Dim classParameter As New ControlParameter("paramClass", "TreeView1", "SelectedValue")
        Dim familyIDparameter As New ControlParameter("paramFamilyID", "TreeView1", "SelectedValue")
        'Dim genusIDParameter As New ControlParameter("paramGenusID", "gridViewSpecies", "SelectedValue")

        If Not IsPostBack Then

            SDSFamily.SelectParameters.Add(classParameter)
            SDSGenus.SelectParameters.Add(familyIDparameter)
            'SDSSpecies.SelectParameters.Add(genusIDParameter)  直接傳值時，不用訂參數

        End If

        '測試javascript
        'Dim jv As String = ""
        'Dim Url As String
        'Url = """photos.aspx?imageCode=" & "0000123"""
        'Me.ClientScript.RegisterStartupScript(Me.GetType, "msg", jv)


        '原本以下程式寫在button_Load事件中，但這樣要多一個postback執行
        'Dim JavaScript As String
        'Dim Url As String

        'Url = "'photos.aspx?imageCode=' + " & "document.getElementById(" & Chr(34) & Me.textBoxImageCode.ClientID & Chr(34) & ").value"     'Chr(34)為字元 (")
        ''Url = "encodeURIComponent(" & Url & ")"
        'JavaScript = "window.open(" & Url & ", 'newwindow', 'height=800, width=1024, toolbar =no, menubar=no, scrollbars=yes , resizable=yes , location=no, status=no') ;"
        'Me.Button1.Attributes("onclick") = JavaScript

        ''Url = "'photos.aspx?imageCode=' + " & "Form1." & Me.textBoxImageCode.ClientID & ".value"
        ''Url = "'photos.aspx?imageCode=" & "document.getElementById(" & """" & Me.textBoxImageCode.ClientID & """" & ").value'"
        ''Me.btn100Img.Attributes("onclick") = "window.open('photos.aspx?imageCode=document.getElementByID(" & """" & Me.textBoxImageCode.ClientID & """" & ").value');"

        '將上述程式到一個html的button控制項，並將該控制項改為「以伺服器控制項執行」
        Dim JavaScript As String
        Dim Url As String

        Url = "'photos.aspx?imageCode=' + " & "document.getElementById(" & Chr(34) & Me.textBoxImageCode.ClientID & Chr(34) & ").value"     'Chr(34)為字元 (")
        JavaScript = "window.open(" & Url & ", 'newwindow', 'height=800, width=1024, toolbar =no, menubar=no, scrollbars=yes , resizable=yes , location=no, status=no') ;"

        Me.btn50Img.Attributes("onclick") = JavaScript


    End Sub

    Protected Sub RadioButtonList2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList2.SelectedIndexChanged

        Select Case RadioButtonList2.SelectedValue

            Case 0
                Select Case mv.ActiveViewIndex
                    Case 0
                        QueryFamily(0)
                    Case 1
                        QueryGenus(0)
                    Case 2
                        QuerySpecies(0, 0)   '將第二個引數設為0，用來判斷是由RadioButtonList2傳入，以下同
                End Select

            Case 1
                Select Case mv.ActiveViewIndex
                    Case 0
                        QueryFamily(1)
                    Case 1
                        QueryGenus(1)
                    Case 2
                        QuerySpecies(1, 0)

                End Select
            Case 2
                Select Case mv.ActiveViewIndex
                    Case 0
                        QueryFamily(2)
                    Case 1
                        QueryGenus(2)
                    Case 2
                        QuerySpecies(2, 0)
                End Select

        End Select

    End Sub



    Protected Sub gridViewGenus_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gridViewGenus.SelectedIndexChanged

        Dim selectedGenusID As Integer
        selectedGenusID = Me.gridViewGenus.SelectedValue
        'MsgBox(tmp)
        QuerySpecies(0, selectedGenusID)
        mv.ActiveViewIndex = 2

    End Sub

End Class
