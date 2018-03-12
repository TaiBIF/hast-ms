<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ImageDetailTmp.aspx.vb" Inherits="Mgm_ImageDetailTmp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>未命名頁面</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:DataList ID="DataList1" runat="server" cssclass="view"
            repeatColumns="5" repeatdirection="Horizontal" borderwidth="0px" cellpadding="3" DataSourceID="SqlDataSource1">
            <ItemStyle cssClass="item" />
            <ItemTemplate>
                <!--開在新視窗，先取消回上一頁功能
                <a href="photos2.aspx?speciesID=<%# Eval("speciesID")  %>"><-- back </a>
                -->
                <br />
                

                <table border="0" cellpadding="0" cellspacing="0" class="collection">
                   
                    <tr>
                        <td class="viewphototitle" valign="top">
                            <b>圖檔名：<%#Server.HtmlEncode(Eval("imageCode").ToString())%> </b>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "management/powerUser/download.aspx?imageCode=" + Eval("imageCode") %>'>Download</asp:HyperLink>
                        </td>
                    </tr>                  
                     <tr>                        
                        <td class="viewphototitle" valign="top">
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("speciesE") & " " & Eval("speciesc") %>'></asp:Label>
                        <!--<br /><%#Server.HtmlEncode(Eval("speciesC").ToString())%><br /> -->
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="top">
                            <asp:Label ID="lblAuthor" runat="server" Text='<%# "拍攝者：" & Eval("authorNameC") %>'></asp:Label><br />
                    <asp:Label ID="lblDate" runat="server" Text='<%# "拍攝日期：" & Eval("photoDate", "{0:d}") %>'></asp:Label><br />
                            <asp:Label ID="lblCollector" runat="server" Text='<%#"採集號：" & Eval("collectionNo") %>'></asp:Label>
                            <asp:Label ID="lblCollectNo" runat="server" Text='<%# Eval("collectNo") %>'></asp:Label><br />
                    <asp:Label ID="lblHsienCity" runat="server" Text='<%# "拍攝地點：" & Eval("hsienCityC") %>'></asp:Label>
                    <asp:Label ID="lblHsiangTown" runat="server" Text='<%# Eval("hsiangTownC") %>'></asp:Label>
                    <asp:Label ID="lblPark" runat="server" Text='<%# Eval("parkC") %>'></asp:Label>
                    <asp:Label ID="lblDesc" runat="server" Text='<%# Eval("additionalDescr") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="viewphototext" valign="top" style="height: 19px">
                        <!--<%#Server.HtmlEncode(Eval("speciesE").ToString())%>-->
                        </td>
				       
                    </tr>      
                </table>
                <table style="vertical-align: text-top; text-align: left">
                    <tr>
                        <td align="left" style="width: 100px" valign="top">
                            &nbsp;<img class="viewphoto" src="<%# GetImageFilePath(Eval("imageCode")) %>" alt="" /></td>
                        <td colspan="1" rowspan="1" valign="top">
                    </td>
                    </tr>
                </table>
                &nbsp; &nbsp;<!-- 以html的超連結下載 <a href="management/powerUser/download.aspx?imageCode=<%# Eval("imageCode") %>"><br />download</a> &nbsp;  -->
              </ItemTemplate>
        </asp:DataList><br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PhotoDBConnectionString %>"
            SelectCommand="SELECT imageCode, imgSubject, authorNameC, photoDate, provinceC, provinceE, hsienCityC, hsienCityE, hsiangTownC, hsiangTownE, parkC, parkE, additionalDescr, familyE, familyC, genusE, genusC, speciesID, speciesE, speciesC, publicWeb, collectionNo, collectNo FROM vwImgDetail WHERE (imageCode = @imageCode)">
            <SelectParameters>
                <asp:QueryStringParameter Name="imageCode" QueryStringField="imageCode" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
