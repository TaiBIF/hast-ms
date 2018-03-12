
Partial Class Photo_FloraAlbum
    Inherits System.Web.UI.Page

    Dim sqlDS As New SqlDataSource
    Dim dv As Data.DataView

    Dim genusValue As String
    Dim speciesValue As String

    Sub DBconnection()

        sqlDS.ConnectionString = "Data Source=x206;Initial Catalog=PhotoDB;Integrated Security=SSPI"

    End Sub

    Public Function GetFirstSPImage(ByVal speciesID As String) As String

        Return PhotoDB.GetFirstSPImage(speciesID)

    End Function


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            DBconnection()
            sqlDS.SelectCommand = "SELECT familyID, familyE, familyC FROM vwImgFamily  ORDER BY Expr1"

            DDLFamily.Items.Add("All")
            DDLFamily.Items.Item(0).Value = "%"

            dv = sqlDS.Select(New DataSourceSelectArguments)

            For i As Integer = 1 To dv.Count
                'ddl.Items.Add(dv.Item(i - 1).Item("Expr1"))
                DDLFamily.Items.Add(dv.Item(i - 1).Item("familyE") & " " & dv.Item(i - 1).Item("familyC"))
                DDLFamily.Items.Item(i).Value = dv.Item(i - 1).Item("familyID")
            Next

            DDLFamily.SelectedValue = "%"

        End If


    End Sub

    Protected Sub DDLGenus_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDLGenus.SelectedIndexChanged

        ddlspecies.Items.Clear()

        DBconnection()

        sqlDS.SelectCommand = "SELECT speciesID, Expr1, genusID FROM vwImgSpecies WHERE genusID LIKE @genusID AND familyID = @familyID ORDER BY Expr1"

        sqlDS.SelectParameters.Add("genusID", DDLGenus.SelectedValue)
        sqlDS.SelectParameters.Add("familyID", DDLFamily.SelectedValue)

        DDLSpecies.Items.Add("ALL")
        DDLSpecies.Items.Item(0).Value = "%"

        dv = sqlDS.Select(New DataSourceSelectArguments)

        For i As Integer = 1 To dv.Count
            DDLSpecies.Items.Add(dv.Item(i - 1).Item("Expr1"))
            DDLSpecies.Items.Item(i).Value = dv.Item(i - 1).Item("speciesID")
        Next

    End Sub

    Protected Sub DDLFamily_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDLFamily.SelectedIndexChanged

        DDLGenus.Items.Clear()
        DDLSpecies.Items.Clear()


        DBconnection()

        sqlDS.SelectCommand = "SELECT genusID, Expr1,familyID FROM vwImgGenus WHERE familyID LIKE @familyID ORDER BY Expr1"

        sqlDS.SelectParameters.Add("familyID", DDLFamily.SelectedValue)

        If DDLFamily.SelectedValue <> "%" Then

            DDLGenus.Items.Add("ALL")
            DDLGenus.Items.Item(0).Value = "%"

            dv = sqlDS.Select(New DataSourceSelectArguments)

            For i As Integer = 1 To dv.Count
                DDLGenus.Items.Add(dv.Item(i - 1).Item("Expr1"))
                DDLGenus.Items.Item(i).Value = dv.Item(i - 1).Item("genusID")
            Next

        End If

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click

        If DDLFamily.SelectedValue = "%" Then

            Me.Button1.OnClientClick = "alert('請選取科再查詢！');"

        Else

            If DDLGenus.SelectedValue Is Nothing Or DDLGenus.SelectedValue = "%" Then

                genusValue = "%"
                speciesValue = "%"

            Else

                genusValue = DDLGenus.SelectedValue

                If DDLSpecies.SelectedValue Is Nothing Or DDLSpecies.SelectedValue = "%" Then

                    speciesValue = "%"

                Else

                    speciesValue = DDLSpecies.SelectedValue

                End If

            End If

            Response.Redirect("~/test/Photos2.aspx?familyID=" & DDLFamily.SelectedValue & "&genusID=" & genusValue & "&speciesID=" & speciesValue)

        End If

    End Sub

End Class
