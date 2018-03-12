
Partial Class Project_SinicaOutskirtsQueryC
    Inherits System.Web.UI.Page

    Protected Sub btnQuery_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnQuery.Click

        Dim strOptions As String
        strOptions = ""

        Dim j As Integer

        j = 0
        For i = 0 To stem.Items.Count - 1
            If stem.Items(i).Selected Then
                j += stem.Items(i).Value
            End If
        Next

        For i = 0 To habitation.Items.Count - 1
            If habitation.Items(i).Selected Then
                j += habitation.Items(i).Value
            End If
        Next

        For i = 0 To flowerColor.Items.Count - 1
            If flowerColor.Items(i).Selected Then
                j += flowerColor.Items(i).Value
            End If
        Next

        For i = 0 To perianth.Items.Count - 1
            If perianth.Items(i).Selected Then
                j += perianth.Items(i).Value
            End If
        Next

        For i = 0 To anthotaxy.Items.Count - 1
            If anthotaxy.Items(i).Selected Then
                j += anthotaxy.Items(i).Value
            End If
        Next

        For i = 0 To inflorescene.Items.Count - 1
            If inflorescene.Items(i).Selected Then
                j += inflorescene.Items(i).Value
            End If
        Next

        For i = 0 To fruit.Items.Count - 1
            If fruit.Items(i).Selected Then
                j += fruit.Items(i).Value
            End If
        Next

        For i = 0 To phyllotaxy.Items.Count - 1
            If phyllotaxy.Items(i).Selected Then
                j += phyllotaxy.Items(i).Value
            End If
        Next

        For i = 0 To pinnate.Items.Count - 1
            If pinnate.Items(i).Selected Then
                j += pinnate.Items(i).Value
            End If
        Next

        For i = 0 To perispore.Items.Count - 1
            If perispore.Items(i).Selected Then
                j += perispore.Items(i).Value
            End If
        Next

        For i = 0 To perisporeType.Items.Count - 1
            If perisporeType.Items(i).Selected Then
                j += perisporeType.Items(i).Value
            End If
        Next

        For i = 0 To plantCate.Items.Count - 1
            If plantCate.Items(i).Selected Then
                j += plantCate.Items(i).Value
            End If
        Next

        For i = 0 To petal.Items.Count - 1
            If petal.Items(i).Selected Then
                j += petal.Items(i).Value
            End If
        Next


        For i = 0 To leaf.Items.Count - 1
            If leaf.Items(i).Selected Then
                j += leaf.Items(i).Value
            End If
        Next

        For i = 0 To compoundLeaf.Items.Count - 1
            If compoundLeaf.Items(i).Selected Then
                j += compoundLeaf.Items(i).Value
            End If
        Next

        '============================================================
        If j <> 0 Then


            For i = 0 To stem.Items.Count - 1
                If stem.Items(i).Selected Then
                    strOptions += stem.Items(i).Value + ","
                End If
            Next

            For i = 0 To habitation.Items.Count - 1
                If habitation.Items(i).Selected Then
                    strOptions += habitation.Items(i).Value + ","
                End If
            Next

            For i = 0 To flowerColor.Items.Count - 1
                If flowerColor.Items(i).Selected Then
                    strOptions += flowerColor.Items(i).Value + ","
                End If
            Next

            For i = 0 To perianth.Items.Count - 1
                If perianth.Items(i).Selected Then
                    strOptions += perianth.Items(i).Value + ","
                End If
            Next

            For i = 0 To anthotaxy.Items.Count - 1
                If anthotaxy.Items(i).Selected Then
                    strOptions += anthotaxy.Items(i).Value + ","
                End If
            Next

            For i = 0 To inflorescene.Items.Count - 1
                If inflorescene.Items(i).Selected Then
                    strOptions += inflorescene.Items(i).Value + ","
                End If
            Next

            For i = 0 To fruit.Items.Count - 1
                If fruit.Items(i).Selected Then
                    strOptions += fruit.Items(i).Value + ","
                End If
            Next

            For i = 0 To phyllotaxy.Items.Count - 1
                If phyllotaxy.Items(i).Selected Then
                    strOptions += phyllotaxy.Items(i).Value + ","
                End If
            Next

            j = 0
            For i = 0 To pinnate.Items.Count - 1
                If pinnate.Items(i).Selected Then
                    strOptions += pinnate.Items(i).Value + ","
                End If
            Next

            For i = 0 To perispore.Items.Count - 1
                If perispore.Items(i).Selected Then
                    strOptions += perispore.Items(i).Value + ","
                End If
            Next

            For i = 0 To perisporeType.Items.Count - 1
                If perisporeType.Items(i).Selected Then
                    strOptions += perisporeType.Items(i).Value + ","
                End If
            Next

            For i = 0 To plantCate.Items.Count - 1
                If plantCate.Items(i).Selected Then
                    strOptions += plantCate.Items(i).Value + ","
                End If
            Next

            For i = 0 To petal.Items.Count - 1
                If petal.Items(i).Selected Then
                    strOptions += petal.Items(i).Value + ","
                End If
            Next

            For i = 0 To leaf.Items.Count - 1
                If leaf.Items(i).Selected Then
                    strOptions += leaf.Items(i).Value + ","
                End If
            Next

            For i = 0 To compoundLeaf.Items.Count - 1
                If compoundLeaf.Items(i).Selected Then
                    strOptions += compoundLeaf.Items(i).Value + ","
                End If
            Next

        End If

        If Len(strOptions) > 0 Then
            strOptions = Left(strOptions, Len(strOptions) - 1)

            Dim strRedirectUrl As String
            strRedirectUrl = "~/Project/SinicaOutskirtsResultC.aspx?options="
            strRedirectUrl += strOptions
            Response.Redirect(strRedirectUrl)
        End If

    End Sub

    Protected Sub btnReset_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnReset.Click

        stem.SelectedIndex = -1

        compoundLeaf.SelectedIndex = -1
        habitation.SelectedIndex = -1

        flowerColor.SelectedIndex = -1


        perianth.SelectedIndex = -1
        anthotaxy.SelectedIndex = -1

        inflorescene.SelectedIndex = -1

        fruit.SelectedIndex = -1

        phyllotaxy.SelectedIndex = -1

        pinnate.SelectedIndex = -1
        perispore.SelectedIndex = -1

        perisporeType.SelectedIndex = -1

        plantCate.SelectedIndex = -1

        petal.SelectedIndex = -1
        plantCate.SelectedIndex = -1

        leaf.SelectedIndex = -1

    End Sub
End Class
