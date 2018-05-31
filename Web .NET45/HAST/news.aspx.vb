
Partial Class HAST_news
    Inherits System.Web.UI.Page

    

    Protected Sub GridViewNewsSubject_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewNewsSubject.SelectedIndexChanged


        SDSNewsContent.SelectParameters.Clear()

        MultiView1.ActiveViewIndex = 1
        Dim pNewsID As New ControlParameter("newsID", TypeCode.Int32, "GridViewNewsSubject", "SelectedValue")
        pNewsID.Direction = Data.ParameterDirection.Input
        SDSNewsContent.SelectParameters.Add(pNewsID)

        DetailsViewNewsContent.Caption = "新聞內容"

    End Sub

   
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        MultiView1.ActiveViewIndex = 0
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load




        If Not IsPostBack Then



            If Request.QueryString.ToString.Contains("newsID=") Then

                MultiView1.ActiveViewIndex = 1

                Dim paramNewsID As New QueryStringParameter("newsID", TypeCode.Int32, "newsID")
                paramNewsID.Direction = Data.ParameterDirection.Input
                SDSNewsContent.SelectParameters.Add(paramNewsID)



            End If

        End If




    End Sub
End Class
