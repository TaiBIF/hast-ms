Imports Subgurim.Controles

Partial Class HAST_visit_info
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        StaticGMap1.Key = "ABQIAAAAq0jWk53lNGxTlvPuHGCBdxRZTCaQ_hMcYcflNPLplZuLiN4SNRS6ZSmHjuYtWNdiEjpNkAxZpIXvxA"

        Dim latLng As New GLatLng(25.0430091, 121.6154273)
        Dim staticGMarker As New StaticGMarker(latLng)
        StaticGMap1.addStaticGMarker(staticGMarker)

        'StaticGMap1.span()
        'StaticGMap1.GZoom = 14
        'google map 連結 https://www.google.com.tw/maps/place/%E4%B8%AD%E5%A4%AE%E7%A0%94%E7%A9%B6%E9%99%A2%E6%A4%8D%E7%89%A9%E7%A0%94%E7%A9%B6%E6%89%80%E6%A8%99%E6%9C%AC%E9%A4%A8/@25.0430091,121.6154273,18z/data=!4m2!3m1!1s0x0000000000000000:0x03c7a584a2a07794?hl=zh-TW
        StaticGMap1.setCenter(New Subgurim.Controles.GLatLng(25.0430091, 121.6154273), 16)

    End Sub
End Class
