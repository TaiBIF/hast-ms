Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration

Partial Class Taxon_FamilyListTwC
    Inherits System.Web.UI.Page

    Implements ISort

    Private m_sortBy As String

    Public Sub SetSortBy(ByVal sortItem As String) Implements ISort.SetSortBy
        m_sortBy = sortItem
    End Sub

    Public Property SortBy() As String Implements ISort.SortBy
        Get
            Return m_sortBy
        End Get
        Set(ByVal value As String)
            value = m_sortBy
        End Set
    End Property


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        SetSortBy(RadioButtonList1.SelectedValue)
        LabelCountry.Visible = False

    End Sub

    Protected Sub RadioButtonList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList1.SelectedIndexChanged

        SetSortBy(RadioButtonList1.SelectedValue)

        FamilyList1.DataBind()

    End Sub

End Class
