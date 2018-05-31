Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration
Imports HAST

Partial Class HAST_links
    Inherits System.Web.UI.Page

    Private datasetWeb As New DataSet
    Private dataAdapter As New SqlDataAdapter

    Dim dv1, dv2, dv5 As DataView



    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        Dim connSetting As ConnectionStringSettings = WebConfigurationManager.ConnectionStrings("HASTAnnounceConnectionString")
        Dim conn As SqlConnection = New SqlConnection(connSetting.ConnectionString)

        If Not IsPostBack Then

            Dim strSQL As String = "prHastWebsite"
            Dim sqlCommand As SqlCommand = New SqlCommand(strSQL, conn)
            sqlCommand.CommandType = CommandType.StoredProcedure

            Dim dataAdapter = New SqlDataAdapter(sqlCommand)

            conn.Open()
            dataAdapter.Fill(datasetWeb)

            dv1 = New DataView
            dv1.Table = datasetWeb.Tables(1)

            ''異動程式碼
            'dv1.RowFilter = "groupset = 7"
            'dv1.Sort = "classID ASC"




            Repeater1.DataSource = dv1
            Repeater1.DataBind()


            ''異動程式碼, 不設primaryKey???
            'dsImage.Tables(1).PrimaryKey = New DataColumn() {dsImage.Tables(1).Columns("rownum")}

            conn.Close()
            conn.Dispose()


        End If

    End Sub

    Protected Sub DataList2_ItemDataBound(sender As Object, e As DataListItemEventArgs)


        Dim strHyperLink As String
        strHyperLink = dv2.Item(e.Item.ItemIndex).Item("websiteC").ToString
        '  MsgBox(strHyperLink)

        CType(e.Item.FindControl("HyperLink1"), HyperLink).Text = strHyperLink

        Dim strUrl As String


        strUrl = dv2.Item(e.Item.ItemIndex).Item("link")



        CType(e.Item.FindControl("HyperLink1"), HyperLink).NavigateUrl = strUrl
        'CType(e.Item.FindControl("HyperLink3"), HyperLink).NavigateUrl = strUrl
    End Sub




    Protected Sub DataList3_ItemDataBound(sender As Object, e As DataListItemEventArgs)


        Dim strHyperLink As String
        strHyperLink = dv2.Item(e.Item.ItemIndex).Item("websiteC").ToString


        CType(e.Item.FindControl("HyperLink2"), HyperLink).Text = strHyperLink

        Dim strUrl As String


        strUrl = dv2.Item(e.Item.ItemIndex).Item("link")



        CType(e.Item.FindControl("HyperLink2"), HyperLink).NavigateUrl = strUrl

    End Sub

    Protected Sub Repeater1_ItemCreated1(sender As Object, e As RepeaterItemEventArgs) Handles Repeater1.ItemCreated

        'Dim strclass As String
        'strclass = dv1.Item(e.Item.ItemIndex).Item("classE").ToString & "&nbsp;" & dv1.Item(e.Item.ItemIndex).Item("classC").ToString
        'CType(e.Item.FindControl("Label1"), Label).Text = strclass

        dv2 = New DataView

        dv2.Table = datasetWeb.Tables(0)

        'dv2.RowFilter = "classID = " & dv1.Item(e.Item.ItemIndex).Item("classID").ToString

        Dim newDRV As DataRowView = dv2.AddNew()
        newDRV("webCategoryID") = dv1.Item(e.Item.ItemIndex).Item("webCategoryID").ToString
        newDRV("websiteC") = "<br /><br />"
        newDRV("link") = " "
        newDRV.EndEdit()

        dv2.RowFilter = "webCategoryID = " & dv1.Item(e.Item.ItemIndex).Item("webCategoryID").ToString



    End Sub

    Protected Sub Repeater1_ItemDataBound(sender As Object, e As RepeaterItemEventArgs) Handles Repeater1.ItemDataBound

        CType(e.Item.FindControl("DataList3"), DataList).DataSource = dv2
        CType(e.Item.FindControl("DataList3"), DataList).DataBind()


    End Sub

End Class
