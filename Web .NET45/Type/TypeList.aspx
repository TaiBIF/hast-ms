<%@ Page Language="VB" AutoEventWireup="false" CodeFile="TypeList.aspx.vb" Inherits="Type_TypeList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>模式標本清單</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="font-weight: normal; font-family: 標楷體">
        &nbsp;<img src="../images/title.jpg" />
        <br />
        <img id="IMG1" src="../images/leave2.jpg" onclick="return IMG1_onclick()" /><font face="標楷體" color="#336600" size="4">模式標本目錄</font>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>" SelectCommand="SELECT [SN], [specimenOrderNum], [subjNameE], [speciesE], [speciesC], [reference], [literaryLink], [typeCategory] FROM [vwTypeDetail]"></asp:SqlDataSource>
        <table style="width: 736px">
            <tr>
                <td style="width: 223px; height: 13px">
                    <asp:DropDownList ID="DropDownList1" runat="server" Width="192px" AutoPostBack="True">
                    </asp:DropDownList></td>
                <td style="width: 334px; height: 13px">
                </td>
                <td style="height: 13px">
                    <br />
                    <asp:RadioButtonList ID="RadioButtonListSortBy" runat="server" RepeatDirection="Horizontal" AutoPostBack="True">
                        <asp:ListItem Value="species">學名</asp:ListItem>
                        <asp:ListItem Value="typeCate">模式</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
        </table>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Height="32px"
            Width="736px" Font-Names="標楷體" Font-Size="14px" ForeColor="#336600" Font-Overline="False">
            <Columns>
                <asp:BoundField HeaderText="科名" DataField="verFamilyE" />
                <asp:HyperLinkField HeaderText="學名" DataNavigateUrlFields="specimenOrderNum" DataNavigateUrlFormatString="http://gissrv1.sinica.edu.tw/lizardtech/iserv/calcrgn?cat=plant_sid&amp;item=S_{0:000000}.SID&amp;style=default/view.xsl&amp;wid=800&amp;hei=800&amp;browser=win_ns6&amp;plugin=false#" DataTextField="verSpeciesE" Target="_blank" >
                    <ItemStyle ForeColor="#336600" />
                </asp:HyperLinkField>
                <asp:BoundField HeaderText="中文名" DataField="verSpeciesC" />
                <asp:HyperLinkField HeaderText="發表文獻" DataTextField="reference" DataNavigateUrlFields="LiteraryLink" />
                <asp:BoundField HeaderText="館號" DataField="specimenOrderNum" />
                <asp:BoundField HeaderText="模式" DataField="typeCategory" />
            </Columns>
            <RowStyle BackColor="#FFFFCC" BorderColor="#CCFFCC" Font-Italic="False" Font-Names="Verdana" />
            <HeaderStyle BackColor="#CCFFCC" />
        </asp:GridView>
    </form>
    
    <!-- Google Analytics追蹤 -->
    <script type="text/javascript">
        var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
        document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
    </script>
    <script type="text/javascript">
        try {
            var pageTracker = _gat._getTracker("UA-1848514-5");
            pageTracker._trackPageview();   
            } 
         catch(err) {}
    </script>
    
</body>
</html>
