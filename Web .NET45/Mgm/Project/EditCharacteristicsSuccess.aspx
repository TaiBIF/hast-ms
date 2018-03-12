<%@ Page Language="VB" AutoEventWireup="false" CodeFile="EditCharacteristicsSuccess.aspx.vb" Inherits="Mgm_Project_EditCharacteristicsSuccess" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
        新增<br />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
        特徵：<br />
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
        <asp:Button ID="btnClose" runat="server" 
            onclientclick="window.opener=null;window.open(&quot;&quot;,&quot;_self&quot;);window.close();" 
            Text="確定" />
    
    </div>
    </form>
</body>
</html>
