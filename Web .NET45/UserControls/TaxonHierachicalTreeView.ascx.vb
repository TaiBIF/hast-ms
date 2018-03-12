Imports System.Data
Imports System.Data.SqlClient
Imports TaxonAccess
Imports System.Web.UI.HtmlControls

Partial Class UserControls_TaxonHierachicalTreeView
    Inherits System.Web.UI.UserControl

    '=================================================
    '控制項用法
    '在MasterPage設定語言(Zh,En),MasterPage實作ILanguage界面
    'parent page實作ISort界面
    '在parent page中的page_load事件中，設定SetSortBy()
    '中文頁面中RadioButtonList1.SelectedValue設定值"Zh"、"En"




    Private m_language As String
    Private m_sort As String

    Public ReadOnly Property PageLanguage() As String '設定頁面語言
        Get
            m_language = DirectCast(Page.Master, ILanguage).Language()
            Return m_language
        End Get
        'Set(ByVal value As String)

        'End Set
    End Property

    Public ReadOnly Property MySort() As String
        Get
            m_sort = DirectCast(Me.Page, ISort).SortBy
            Return m_sort
        End Get
    End Property


    
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

       


        If Not IsPostBack Then

            'MsgBox(DirectCast(Page.Master, ILanguage).Language())

            'PopulateClass()

            populateTrach()

        End If

    End Sub

    Public Sub PopulateClass() '()(ByVal orderBy As String)

        Dim sortBy As String

        Select Case Me.MySort()
            Case "Zh"
                sortBy = "orderID"
            Case Else
                sortBy = "orderID"
        End Select

        Dim country As String = CType(Me.Parent.Parent.FindControl("LabelCountry"), Label).Text.ToString

        'Dim resultDataTable As DataTable = GetClass()
        Dim resultDataTable As DataTable = GetHierachical("Class", country, 0)

        If resultDataTable.Rows.Count > 0 Then

            Dim row As DataRow
            Dim dataTableSort As DataTable = New DataTable()

            '將resultDataTable資料結構複製給dataTableSort
            dataTableSort = resultDataTable.Clone()
            'Dim dr As DataRow
            For Each row In resultDataTable.Select("", sortBy)
                dataTableSort.ImportRow(row)
            Next
            resultDataTable.Clear()

            For Each row In dataTableSort.Rows

                'Dim NewNode As TreeNode = New TreeNode(row("classC").ToString, row("classID").ToString)
                Dim NewNode As New TreeNode
                If Me.PageLanguage() = "Zh" Then
                    If Me.MySort() = "Zh" Then
                        NewNode.Text = Trim(row("classC").ToString & " " & row("classE").ToString)
                    Else
                        NewNode.Text = Trim(row("classE").ToString & " " & row("classC").ToString)
                    End If
                Else
                    NewNode.Text = Trim(row("classE").ToString)
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

    Public Sub PopulateTrach() '()(ByVal orderBy As String)

        Dim sortBy As String

        'Select Case Me.MySort()
        '    Case "Zh"
        '        sortBy = "trachID"
        '    Case Else
        '        sortBy = "trachID"
        'End Select

        sortBy = "trachID"

        Dim country As String = CType(Me.Parent.Parent.FindControl("LabelCountry"), Label).Text.ToString

        'Dim resultDataTable As DataTable = GetClass()
        Dim resultDataTable As DataTable = GetHierachical("tracheophyte", country, 0)

        If resultDataTable.Rows.Count > 0 Then

            Dim row As DataRow
            Dim dataTableSort As DataTable = New DataTable()

            '將resultDataTable資料結構複製給dataTableSort
            dataTableSort = resultDataTable.Clone()
            'Dim dr As DataRow
            For Each row In resultDataTable.Select("", sortBy)
                dataTableSort.ImportRow(row)
            Next
            resultDataTable.Clear()

            For Each row In dataTableSort.Rows

                'Dim NewNode As TreeNode = New TreeNode(row("classC").ToString, row("classID").ToString)
                Dim NewNode As New TreeNode
                If Me.PageLanguage() = "Zh" Then
                    If Me.MySort() = "Zh" Then
                        NewNode.Text = Trim(row("tracheophyteC").ToString & " " & row("tracheophyte").ToString)
                    Else
                        NewNode.Text = Trim(row("tracheophyte").ToString & " " & row("tracheophyteC").ToString)
                    End If
                Else
                    NewNode.Text = Trim(row("tracheophyte").ToString)
                End If

                NewNode.Value = row("trachID").ToString
                NewNode.PopulateOnDemand = True
                NewNode.SelectAction = TreeNodeSelectAction.Expand
                NewNode.Expanded = False
                'root.ChildNodes.Add(NewNode)
                TreeView1.Nodes.Add(NewNode)

            Next

        End If

    End Sub


    Sub PopulateOrders(ByVal node As TreeNode)

        Dim sortBy As String

        'Select Case Me.MySort()
        '    Case "Zh"
        '        sortBy = "orderC"
        '    Case Else
        '        sortBy = "orderE"
        'End Select

        sortBy = "orderID"


        Dim trachID As Integer = node.Value
        Dim country As String = CType(Me.Parent.Parent.FindControl("LabelCountry"), Label).Text.ToString

        Dim resultDataTable As DataTable = GetHierachical("orders", country, trachID)
        'Dim resultDataTable As DataTable = GetFamily(classID)

        If resultDataTable.Rows.Count > 0 Then

            Dim row As DataRow
            Dim dataTableSort As DataTable = New DataTable()

            '將resultDataTable資料結構複製給dataTableSort
            dataTableSort = resultDataTable.Clone()
            'Dim dr As DataRow
            For Each row In resultDataTable.Select("", sortBy)
                dataTableSort.ImportRow(row)
            Next
            resultDataTable.Clear()

            For Each row In dataTableSort.Rows

                Dim NewNode As New TreeNode
                If Me.PageLanguage() = "Zh" Then
                    'If Me.MySort() = "Zh" Then
                    '    NewNode.Text = Trim(row("orderC").ToString() & " " & row("orderE").ToString())
                    'Else
                    '    NewNode.Text = Trim(row("orderE").ToString & " " & row("orderC").ToString)
                    'End If

                    NewNode.Text = Trim(row("orderE").ToString & " " & row("orderC").ToString)
                Else
                    NewNode.Text = Trim(row("orderE").ToString)
                End If

                NewNode.Value = row("orderID").ToString
                NewNode.PopulateOnDemand = True
                NewNode.SelectAction = TreeNodeSelectAction.Expand
                NewNode.Expanded = False

                node.ChildNodes.Add(NewNode)

            Next

        End If


    End Sub




    Sub PopulateFamily(ByVal node As TreeNode)

        Dim sortBy As String

        'Select Case Me.MySort()
        '    Case "Zh"
        '        sortBy = "familyC"
        '    Case Else
        '        sortBy = "familyE"
        'End Select

        sortBy = "ApgIVFamilyID"


        Dim classID As Integer = node.Value
        Dim country As String = CType(Me.Parent.Parent.FindControl("LabelCountry"), Label).Text.ToString

        Dim resultDataTable As DataTable = GetHierachical("family", country, classID)
        'Dim resultDataTable As DataTable = GetFamily(classID)

        If resultDataTable.Rows.Count > 0 Then

            Dim row As DataRow
            Dim dataTableSort As DataTable = New DataTable()

            '將resultDataTable資料結構複製給dataTableSort
            dataTableSort = resultDataTable.Clone()
            'Dim dr As DataRow
            For Each row In resultDataTable.Select("", sortBy)
                dataTableSort.ImportRow(row)
            Next
            resultDataTable.Clear()

            For Each row In dataTableSort.Rows

                Dim NewNode As New TreeNode
                Dim familyE As String

                familyE = row("familyE").ToString()
                familyE = Left(familyE, 1) + Right(familyE, Len(familyE) - 1).ToLower()

                If Me.PageLanguage() = "Zh" Then
                    'If Me.MySort() = "Zh" Then
                    '    ' NewNode.Text = Trim(row("familyC").ToString() & " " & row("familyE").ToString())
                    '    NewNode.Text = familyE & " " & row("familyC").ToString
                    'Else
                    '    'NewNode.Text = Trim(row("familyE").ToString() & " " & row("familyC").ToString)
                    '    NewNode.Text = familyE & " " & row("familyC").ToString
                    'End If

                    NewNode.Text = familyE & " " & row("familyC").ToString
                Else
                    'NewNode.Text = Trim(row("familyE").ToString)
                    NewNode.Text = familyE
                End If

                NewNode.Value = row("familyID").ToString
                NewNode.PopulateOnDemand = True
                NewNode.SelectAction = TreeNodeSelectAction.Expand
                NewNode.Expanded = False

                node.ChildNodes.Add(NewNode)

            Next

        End If


    End Sub

    Sub PopulateGenus(ByVal node As TreeNode)

        Dim sortBy As String

        'Select Case Me.MySort()
        '    Case "Zh"
        '        sortBy = "genusC"
        '    Case Else
        '        sortBy = "genusE"
        'End Select

        sortBy = "genusE"

        Dim familyID As Integer = node.Value
        Dim country As String = CType(Me.Parent.Parent.FindControl("LabelCountry"), Label).Text.ToString

        Dim resultDataTable As DataTable = GetHierachical("genus", country, familyID)
        'Dim resultDataTable As DataTable = GetGenus(familyID)

        If resultDataTable.Rows.Count > 0 Then

            Dim row As DataRow
            Dim dataTableSort As DataTable = New DataTable()

            '將resultDataTable資料結構複製給dataTableSort
            dataTableSort = resultDataTable.Clone()
            'Dim dr As DataRow
            For Each row In resultDataTable.Select("", sortBy)
                dataTableSort.ImportRow(row)
            Next
            resultDataTable.Clear()

            For Each row In dataTableSort.Rows

                'Dim NewNode As TreeNode = New TreeNode(row("classC").ToString, row("classID").ToString)
                Dim NewNode As New TreeNode
                If Me.PageLanguage() = "Zh" Then
                    'If Me.MySort() = "Zh" Then
                    '    NewNode.Text = Trim(row("genusC").ToString() & " " & row("genusE").ToString())
                    'Else
                    '    NewNode.Text = Trim(row("genusE").ToString & " " & row("genusC").ToString)
                    'End If

                    NewNode.Text = Trim(row("genusE").ToString & " " & row("genusC").ToString)

                Else
                    NewNode.Text = Trim(row("genusE").ToString)
                End If


                NewNode.Value = row("genusID").ToString
                NewNode.PopulateOnDemand = True
                NewNode.SelectAction = TreeNodeSelectAction.Expand
                NewNode.Expanded = False

                node.ChildNodes.Add(NewNode)
            Next

        End If

    End Sub

    Sub PopulateSpecies(ByVal node As TreeNode)

        Dim sortBy As String

        'Select Case Me.MySort()
        '    Case "Zh"
        '        sortBy = "speciesC"
        '    Case Else
        '        sortBy = "speciesE"
        'End Select

        sortBy = "speciesE"

        Dim genusID As Integer = node.Value
        Dim country As String = CType(Me.Parent.Parent.FindControl("LabelCountry"), Label).Text.ToString

        Dim resultDataTable As DataTable = GetHierachical("species", country, genusID)
        'Dim resultDataTable As DataTable = GetSpecies(genusID)

        If resultDataTable.Rows.Count > 0 Then

            Dim row As DataRow
            Dim dataTableSort As DataTable = New DataTable()

            '將resultDataTable資料結構複製給dataTableSort
            dataTableSort = resultDataTable.Clone()
            'Dim dr As DataRow
            For Each row In resultDataTable.Select("", "")
                dataTableSort.ImportRow(row)
            Next
            resultDataTable.Clear()

            For Each row In dataTableSort.Rows

                'Dim NewNode As TreeNode = New TreeNode(row("classC").ToString, row("classID").ToString)
                Dim NewNode As New TreeNode
                If Me.PageLanguage() = "Zh" Then
                    'If Me.MySort() = "Zh" Then
                    '    NewNode.Text = Trim(row("speciesC").ToString() & " " & row("speciesE").ToString())
                    'Else
                    '    NewNode.Text = Trim(row("speciesE").ToString & " " & row("speciesC").ToString)
                    'End If

                    NewNode.Text = Trim(row("speciesE").ToString & " " & row("speciesC").ToString)
                Else
                    NewNode.Text = Trim(row("speciesE").ToString)
                End If




                NewNode.Value = row("speciesID").ToString


                NewNode.NavigateUrl = "~/Taxon/speciesDetailC.aspx?speciesID=" & row("speciesID").ToString
                NewNode.Target = "_blank"

                NewNode.PopulateOnDemand = False
                NewNode.SelectAction = TreeNodeSelectAction.Select
                node.ChildNodes.Add(NewNode)

            Next

        End If

    End Sub


    Protected Sub TreeView1_TreeNodePopulate(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.TreeNodeEventArgs) Handles TreeView1.TreeNodePopulate

        '新的作法，綱已先填入，再填科屬種

        If e.Node.ChildNodes.Count = 0 Then

            Select Case e.Node.Depth
                'Case 0
                '   PopulateClassX(e.Node)
                Case 0
                    PopulateOrders(e.Node)

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
