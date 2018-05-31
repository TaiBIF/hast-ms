<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Main.aspx.vb" Inherits="Mgm_Main" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>HAST 管理主頁</title>
    <link rel='stylesheet' type='text/css' href='~/Styles/two-column.css' />

</head>
<body>    
    <form id="form1" runat="server">
        <div id='header'>
           <h1>HAST 管理主頁</h1>
        </div>
        <div id='container'>
            <div id='first-column'>
                
                    <asp:LoginView ID="LoginView1" runat="server">
                        <LoggedInTemplate>
                            <asp:TreeView ID="TreeView1" runat="server" DataSourceID="SiteMapDataSource1" 
                                ImageSet="Simple" NodeIndent="10">
                                <ParentNodeStyle Font-Bold="False" />
                                <HoverNodeStyle Font-Underline="True" ForeColor="#DD5555" />
                                <SelectedNodeStyle Font-Underline="True" ForeColor="#DD5555" 
                                    HorizontalPadding="0px" VerticalPadding="0px" />
                                <NodeStyle Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" 
                                    HorizontalPadding="0px" NodeSpacing="0px" VerticalPadding="0px" />
                            </asp:TreeView>
                        </LoggedInTemplate>
                            <AnonymousTemplate>
                                請先<asp:LoginStatus ID="LoginStatus1" runat="server" />
                                ！
                            </AnonymousTemplate>
                    </asp:LoginView>
                    
                
                            
                            
                
            </div>
            <div id='content'>
                HAST 相關連結：<br /><br />
                    
                                <a  href="http://hast.sinica.edu.tw" target="_blank" >HAST 首頁 </a>
                                <br /><br />
                                <a  href="http://www.hast.biodiv.tw/Announce/newsC.aspx" target="_blank" >台灣本土植物資料庫</a>
                                <br /><br />
                                <a  href="QrySpecimenImage.aspx" target="_blank" >標本影像-館號查詢（數典標本拍攝人員查核館號用）</a>
                                <br /><br />
                   
            </div>
        </div>
        <div id='footer'>
            <h6>Footer</h6>
        </div>
   
    <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />
    </form>
</body>
</html>
