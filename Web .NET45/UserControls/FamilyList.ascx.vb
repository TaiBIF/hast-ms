Imports System.Data
Imports System.Data.SqlClient
Imports TaxonAccess
Imports System.Web.UI.HtmlControls


Partial Class UserControls_FamilyList
    Inherits System.Web.UI.UserControl


    Private m_language As String
    Private m_sort As String

    Private dsFamilyList As New DataSet
    Private dv1, dv2 As DataView 'dv1處理筆劃, dv2處理family

    Private m_country As String

    Public ReadOnly Property PageLanguage() As String '設定頁面語言
        Get
            m_language = DirectCast(Page.Master, ILanguage).Language()
            Return m_language
        End Get
      
    End Property

    Public ReadOnly Property MySort() As String
        Get
            m_sort = DirectCast(Me.Page, ISort).SortBy
            Return m_sort
        End Get
    End Property

    Public ReadOnly Property Country() As String
        Get
            m_country = CType(Me.Parent.FindControl("LabelCountry"), Label).Text.ToString
            Return m_country
        End Get
    End Property


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        DBConnection()

    End Sub

    Protected Sub DataListStroke_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataListStroke.ItemDataBound

        Dim drv As DataRowView = DirectCast(e.Item.DataItem, DataRowView)

        Dim strLabelGroup As String

        If Me.PageLanguage() = "Zh" And Me.MySort = "Zh" Then

            strLabelGroup = "<a name='stroke"

            strLabelGroup = strLabelGroup & Trim(drv("strokeID").ToString)
            strLabelGroup = strLabelGroup & "'>" & Trim(drv("stroke").ToString)
            strLabelGroup = strLabelGroup & "</ a>"

        Else

            strLabelGroup = "<a name='"

            strLabelGroup = strLabelGroup & drv("firstLetter").ToString
            strLabelGroup = strLabelGroup & "'>" & drv("firstLetter").ToString
            strLabelGroup = strLabelGroup & "</ a>"

        End If


        CType(e.Item.FindControl("LabelGroup"), Label).Text = strLabelGroup


        dv2 = New DataView
        dv2.Table = dsFamilyList.Tables(0)

        'If RadioButtonList1.SelectedValue = 1 Then
        If Me.PageLanguage() = "Zh" And Me.MySort = "Zh" Then
            dv2.RowFilter = "strokeID = " & dv1.Item(e.Item.ItemIndex).Item("strokeID").ToString
            dv2.Sort = "familyC ASC"

        Else
            Dim strFilter As String
            strFilter = "firstLetter = '" & dv1.Item(e.Item.ItemIndex).Item("firstLetter").ToString & "'"

            dv2.RowFilter = strFilter '"firstLetter = " & dv1.Item(e.Item.ItemIndex).Item("firstLetter").ToString
            dv2.Sort = "familyE ASC"

        End If

        CType(e.Item.FindControl("DataListFamily"), DataList).DataSource = dv2
        CType(e.Item.FindControl("DataListFamily"), DataList).DataBind()

    End Sub


    Protected Sub DataListFamily_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs)

        Dim strHyperLinkText As String


        'If RadioButtonList1.SelectedValue = "2" Then
        If Me.PageLanguage = "Zh" Then


            If Me.MySort() = "Zh" Then
                strHyperLinkText = dv2.Item(e.Item.ItemIndex).Item("familyC") & " " & dv2.Item(e.Item.ItemIndex).Item("familyE")

            Else
                strHyperLinkText = dv2.Item(e.Item.ItemIndex).Item("familyE") & " " & dv2.Item(e.Item.ItemIndex).Item("familyC")

            End If
        Else
            strHyperLinkText = dv2.Item(e.Item.ItemIndex).Item("familyE")
        End If

        CType(e.Item.FindControl("HyperLinkFamily"), HyperLink).Text = Trim(strHyperLinkText)

        Dim stringHyperLink As String = ""
        stringHyperLink = "~/Taxon/Genus_SpeciesList"

        If Country() = "TW" Then
            stringHyperLink += "Tw"
        End If

        If PageLanguage = "Zh" Then
            stringHyperLink += "C"
        Else
            stringHyperLink += "E"
        End If

        stringHyperLink += ".aspx?familyID="

        CType(e.Item.FindControl("HyperLinkFamily"), HyperLink).NavigateUrl = stringHyperLink & dv2.Item(e.Item.ItemIndex).Item("familyID")

    End Sub

    Public Sub DBConnection()

        'Dim country As String = CType(Me.Parent.FindControl("LabelCountry"), Label).Text.ToString

        If Country() = "TW" Then
            dsFamilyList = GetFamilyStrock("TW")
        Else
            dsFamilyList = GetFamilyStrock("")
        End If


        dv1 = New DataView

        'If RadioButtonList1.SelectedValue = 1 Then
        If Me.PageLanguage() = "Zh" And Me.MySort = "Zh" Then

            dv1.Table = dsFamilyList.Tables(1)
            dv1.Sort = "strokeID ASC"
        Else
            dv1.Table = dsFamilyList.Tables(2)
            dv1.Sort = "firstLetter ASC"

        End If

        DataListStroke.DataSource = dv1
        DataListStroke.DataBind()


        DataListGroup.DataSource = dv1
        DataListGroup.DataBind()

    End Sub

    Protected Sub DataListGroup_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataListGroup.ItemDataBound

        Dim drv As DataRowView = DirectCast(e.Item.DataItem, DataRowView)

        Dim strHyperLinkGroup As String

        'If RadioButtonList1.SelectedValue = 1 Then
        If Me.PageLanguage() = "Zh" And Me.MySort() = "Zh" Then
            strHyperLinkGroup = Trim(drv("stroke"))
            DataListGroup.RepeatColumns = 2

            'CType(e.Item.FindControl("HyperLinkGroup"), HyperLink).NavigateUrl = "#stroke" & drv("strokeID").ToString
            '在使用者控制項中，若用上面作法，會產生href=../UserControls/#Strock....，無法在主頁面中找到錨點
            CType(e.Item.FindControl("HyperLinkGroup"), HyperLink).Attributes.Add("href", "#stroke" & drv("strokeID").ToString)

            CType(e.Item.FindControl("HyperLinkGroup"), HyperLink).Text = Trim(drv("stroke"))

        Else
            strHyperLinkGroup = drv("firstLetter")
            DataListGroup.RepeatColumns = 26

            'CType(e.Item.FindControl("HyperLinkGroup"), HyperLink).NavigateUrl = "#" & drv("firstLetter").ToString
            CType(e.Item.FindControl("HyperLinkGroup"), HyperLink).Attributes.Add("href", "#" & drv("firstLetter").ToString)

            CType(e.Item.FindControl("HyperLinkGroup"), HyperLink).Text = drv("firstLetter")
        End If

        'If RadioButtonList1.SelectedValue = 1 Then
        If Me.PageLanguage() = "Zh" And Me.MySort() = "Zh" Then
            '填入該筆劃科名的字首
            dv2.Table = dsFamilyList.Tables(0)
            dv2.Sort = "strokeID"


            dv2.RowFilter = "strokeID = '" & drv("strokeID").ToString & "'"
            'Dim tmpView As DataView = Dt.DefaultView
            Dim tmpTable As DataTable = dv2.ToTable("firstword", True, "strokeID", "fword")

            Dim strFilter = "strokeID = '" & drv("strokeID").ToString & "'"
            tmpTable.Select(strFilter)

            CType(e.Item.FindControl("DataListFirstWord"), DataList).DataSource = tmpTable
            CType(e.Item.FindControl("DataListFirstWord"), DataList).DataBind()
        End If

    End Sub
End Class
