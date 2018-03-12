<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="FloraAreaSelect.aspx.vb" Inherits="Mgm_Project_FloraAreaSelect" title="HAST - 植物名錄 - 地點選擇" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <link href="../../Styles/Style.css" rel="stylesheet" type="text/css" />
     <link href="../../Styles/TWFlora.css" rel="stylesheet" type="text/css" />
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="container">
    地點 - 植物名錄<br /><br />
        地點 <asp:DropDownList ID="DDListArea" runat="server">
        </asp:DropDownList>
&nbsp;
        <asp:Button ID="Button1" runat="server" Text="查閱" />&nbsp;&nbsp;
            
    </div>
</asp:Content>

