Imports System.Web.Configuration
Imports System.Data

Partial Class Ascx_WebUserControl
    Inherits System.Web.UI.UserControl


    Dim dv As New DataView
    Dim SDSSql As New SqlDataSource
    Dim strConnectionstring As String
    Private _language As String

    Private Sub DBConnection()

        strConnectionstring = WebConfigurationManager.ConnectionStrings("HASTDBConnectionString").ConnectionString

    End Sub

    Public Sub Reset()

        DDListFamily.SelectedValue = ""
        DDListGenus.SelectedValue = ""
        DDListSpecies.SelectedValue = ""

        DDListFamily.Items.Clear()
        DDListGenus.Items.Clear()
        DDListSpecies.Items.Clear()

        FillFamilyList()

    End Sub

    Public Property language() As String '設定頁面語言
        Get
            Select Case Right((Request.FilePath), 6).ToLower
                Case "e.aspx"
                    _language = "En"
                Case Else
                    _language = "Ch"
            End Select
            Return _language
        End Get
        Set(ByVal value As String)

        End Set
    End Property

    Public Property trachID() As String
        Get
            Return RadioButtonListTrach.SelectedValue
        End Get
        Set(value As String)
            RadioButtonListTrach.SelectedValue = value
        End Set
    End Property


    Public Property OrderID() As String
        Get
            Return DDListOrders.SelectedValue
        End Get
        Set(value As String)
            DDListOrders.SelectedValue = value
        End Set
    End Property


    Public Property familyID() As String
        Get
            Return DDListFamily.SelectedValue
        End Get
        Set(ByVal value As String)
            DDListFamily.SelectedValue = value
        End Set
    End Property

    Public Property genusID() As String
        Get
            Return DDListGenus.SelectedValue
        End Get
        Set(ByVal value As String)
            DDListGenus.SelectedValue = value
        End Set
    End Property

    Public Property speciesID() As String
        Get
            Return DDListSpecies.SelectedValue
        End Get
        Set(ByVal value As String)
            DDListSpecies.SelectedValue = value
        End Set
    End Property


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If language = "Ch" Then
            LabelOrders.Text = "目名"
            LabelFamily.Text = "科名"
            LabelGenus.Text = "屬名"
            LabelSpecies.Text = "學名"
        Else
            LabelOrders.Text = "Order Name"
            LabelFamily.Text = "Family name"
            LabelGenus.Text = "Genus name"
            LabelSpecies.Text = "Scientific name"
        End If

        If Not IsPostBack Then

            RadioButtonList1.SelectedValue = 0

            RadioButtonListTrach.Enabled = False


            DDListOrders.Enabled = False

            'FillTracheophyte()

            'FillOrdersList()
            FillFamilyList()

        End If

    End Sub

    Protected Sub FillTracheophyte()

        DDListOrders.Items.Clear()
        DDListFamily.Items.Clear()
        DDListGenus.Items.Clear()
        DDListSpecies.Items.Clear()



        DBConnection()

        '------------------
        SDSSql.ConnectionString = strConnectionstring
        SDSSql.SelectCommandType = SqlDataSourceCommandType.StoredProcedure
        SDSSql.SelectCommand = "prTracheophyte"

        'DDListOrders.Items.Add("")
        'DDListOrders.Items.Item(0).Value = ""


        dv = SDSSql.Select(New DataSourceSelectArguments)
        dv.Sort = "trachID"

        If language = "Ch" Then
            For i = 1 To dv.Count

                ' MsgBox(dv.Item(i - 1).Item("tracheophyte"))

                RadioButtonListTrach.Items.Add(dv.Item(i - 1).Item("tracheophyte") + " " + dv.Item(i - 1).Item("tracheophyteC"))
                RadioButtonListTrach.Items.Item(i - 1).Value = dv.Item(i - 1).Item("trachID")

            Next
        Else
            For i = 1 To dv.Count
                RadioButtonListTrach.Items.Add(dv.Item(i - 1).Item("tracheophyte"))
                RadioButtonListTrach.Items.Item(i).Value = dv.Item(i - 1).Item("trachID")

            Next
        End If


        'RadioButtonListTrach.SelectedValue = Nothing


    End Sub



    Protected Sub FillOrdersList()

        DDListFamily.Items.Clear()
        DDListGenus.Items.Clear()
        DDListSpecies.Items.Clear()


        DBConnection()

        '------------------
        SDSSql.ConnectionString = strConnectionstring
        SDSSql.SelectCommandType = SqlDataSourceCommandType.StoredProcedure
        SDSSql.SelectCommand = "prOrders"

        DDListOrders.Items.Add("")
        DDListOrders.Items.Item(0).Value = ""

        dv = SDSSql.Select(New DataSourceSelectArguments)
        dv.Sort = "OrderE"

        If language = "Ch" Then
            For i = 1 To dv.Count
                DDListOrders.Items.Add(dv.Item(i - 1).Item("OrderExpr"))
                DDListOrders.Items.Item(i).Value = dv.Item(i - 1).Item("OrderID")
            Next
        Else
            For i = 1 To dv.Count
                DDListOrders.Items.Add(dv.Item(i - 1).Item("OrderE"))
                DDListOrders.Items.Item(i).Value = dv.Item(i - 1).Item("OrderID")
            Next
        End If


        DDListOrders.SelectedValue = ""


    End Sub




    Protected Sub FillFamilyList()

        DBConnection()

        '------------------
        SDSSql.ConnectionString = strConnectionstring
        SDSSql.SelectCommandType = SqlDataSourceCommandType.StoredProcedure
        SDSSql.SelectCommand = "prFamily"

        DDListFamily.Items.Add("")
        DDListFamily.Items.Item(0).Value = ""

        dv = SDSSql.Select(New DataSourceSelectArguments)
        dv.Sort = "familyE"

        If language = "Ch" Then
            For i = 1 To dv.Count
                DDListFamily.Items.Add(dv.Item(i - 1).Item("familyExpr"))
                DDListFamily.Items.Item(i).Value = dv.Item(i - 1).Item("familyID")
            Next
        Else
            For i = 1 To dv.Count
                DDListFamily.Items.Add(dv.Item(i - 1).Item("familyE"))
                DDListFamily.Items.Item(i).Value = dv.Item(i - 1).Item("familyID")
            Next
        End If


        DDListFamily.SelectedValue = ""


    End Sub



    Protected Sub DDListFamily_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDListFamily.SelectedIndexChanged

        DDListGenus.Items.Clear()
        DDListSpecies.Items.Clear()

        DBConnection()
        SDSSql.ConnectionString = strConnectionstring
        SDSSql.SelectCommandType = SqlDataSourceCommandType.StoredProcedure
        SDSSql.SelectCommand = "prGenus"


        SDSSql.SelectParameters.Add("familyID", DDListFamily.SelectedValue)

        If DDListFamily.SelectedValue <> "" Then

            DDListGenus.Items.Add("")
            DDListGenus.Items.Item(0).Value = ""

            dv = SDSSql.Select(New DataSourceSelectArguments)
            dv.Sort = "genusE"

            If language = "Ch" Then
                For i As Integer = 1 To dv.Count
                    DDListGenus.Items.Add(dv.Item(i - 1).Item("genusExpr"))
                    DDListGenus.Items.Item(i).Value = dv.Item(i - 1).Item("genusID")
                Next
            Else
                For i As Integer = 1 To dv.Count
                    DDListGenus.Items.Add(dv.Item(i - 1).Item("genusE"))
                    DDListGenus.Items.Item(i).Value = dv.Item(i - 1).Item("genusID")
                Next
            End If


        End If

    End Sub

    Protected Sub DDListGenus_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDListGenus.SelectedIndexChanged

        DDListSpecies.Items.Clear()

        DBConnection()
        SDSSql.ConnectionString = strConnectionstring
        SDSSql.SelectCommandType = SqlDataSourceCommandType.StoredProcedure
        SDSSql.SelectCommand = "prSpecies"

        SDSSql.SelectParameters.Add("genusID", DDListGenus.SelectedValue)

        DDListSpecies.Items.Add("")
        DDListSpecies.Items.Item(0).Value = ""

        If DDListGenus.SelectedValue <> "" Then

            dv = SDSSql.Select(New DataSourceSelectArguments)
            dv.Sort = "speciesE"

            If language = "Ch" Then
                For i As Integer = 1 To dv.Count
                    DDListSpecies.Items.Add(dv.Item(i - 1).Item("speciesExpr"))
                    DDListSpecies.Items.Item(i).Value = dv.Item(i - 1).Item("speciesID")
                Next
            Else
                For i As Integer = 1 To dv.Count
                    DDListSpecies.Items.Add(dv.Item(i - 1).Item("speciesE"))
                    DDListSpecies.Items.Item(i).Value = dv.Item(i - 1).Item("speciesID")
                Next
            End If


        End If

    End Sub



    Protected Sub RadioButtonList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles RadioButtonList1.SelectedIndexChanged

        If RadioButtonList1.SelectedValue = 0 Then
            RadioButtonListTrach.Enabled = False

            RadioButtonListTrach.Enabled = False
            RadioButtonListTrach.Items.Clear()

            DDListOrders.Items.Clear()
            DDListFamily.Items.Clear()
            DDListGenus.Items.Clear()
            DDListSpecies.Items.Clear()



            DDListOrders.Enabled = False
            FillFamilyList()

        Else
            RadioButtonListTrach.Enabled = True
            DDListOrders.Enabled = True

            RadioButtonListTrach.Items.Clear()

            DDListOrders.Items.Clear()
            DDListFamily.Items.Clear()
            DDListGenus.Items.Clear()
            DDListSpecies.Items.Clear()


            FillTracheophyte()

        End If

    End Sub

    Protected Sub RadioButtonListTrach_SelectedIndexChanged(sender As Object, e As EventArgs) Handles RadioButtonListTrach.SelectedIndexChanged

        DDListOrders.Items.Clear()
        DDListFamily.Items.Clear()
        DDListGenus.Items.Clear()
        DDListSpecies.Items.Clear()

        DBConnection()

        '------------------
        SDSSql.ConnectionString = strConnectionstring
        SDSSql.SelectCommandType = SqlDataSourceCommandType.StoredProcedure
        SDSSql.SelectCommand = "prOrders"

        SDSSql.SelectParameters.Add("trachID", RadioButtonListTrach.SelectedValue)


        DDListOrders.Items.Add("")
        DDListOrders.Items.Item(0).Value = ""



        dv = SDSSql.Select(New DataSourceSelectArguments)
        dv.Sort = "OrderE"

        If language = "Ch" Then
            For i = 1 To dv.Count
                DDListOrders.Items.Add(dv.Item(i - 1).Item("OrderExpr"))
                DDListOrders.Items.Item(i).Value = dv.Item(i - 1).Item("OrderID")
            Next
        Else
            For i = 1 To dv.Count
                DDListOrders.Items.Add(dv.Item(i - 1).Item("OrderE"))
                DDListOrders.Items.Item(i).Value = dv.Item(i - 1).Item("OrderID")
            Next
        End If


        DDListOrders.SelectedValue = ""

    End Sub


    Protected Sub DDListOrders_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DDListOrders.SelectedIndexChanged

        DDListFamily.Items.Clear()
        DDListGenus.Items.Clear()
        DDListSpecies.Items.Clear()

        DBConnection()

        '------------------
        SDSSql.ConnectionString = strConnectionstring
        SDSSql.SelectCommandType = SqlDataSourceCommandType.StoredProcedure
        SDSSql.SelectCommand = "prFamilyApg"

        SDSSql.SelectParameters.Add("orderID", DDListOrders.SelectedValue)

        If DDListOrders.SelectedValue <> "" Then


            DDListFamily.Items.Add("")
            DDListFamily.Items.Item(0).Value = ""

            dv = SDSSql.Select(New DataSourceSelectArguments)
            dv.Sort = "familyE"

            If language = "Ch" Then
                For i = 1 To dv.Count
                    DDListFamily.Items.Add(dv.Item(i - 1).Item("familyExpr"))
                    DDListFamily.Items.Item(i).Value = dv.Item(i - 1).Item("familyID")
                Next
            Else
                For i = 1 To dv.Count
                    DDListFamily.Items.Add(dv.Item(i - 1).Item("familyE"))
                    DDListFamily.Items.Item(i).Value = dv.Item(i - 1).Item("familyID")
                Next
            End If

        End If





    End Sub
End Class
