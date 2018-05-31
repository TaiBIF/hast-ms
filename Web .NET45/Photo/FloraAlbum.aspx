<%@ Page Language="VB" MasterPageFile="~/MasterPageTemp.master" AutoEventWireup="false" CodeFile="FloraAlbum.aspx.vb" Inherits="Photo_FloraAlbum" title="未命名頁面" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:LoginStatus ID="LoginStatus1" runat="server" />
    
    <br />
    &nbsp; 科：<asp:DropDownList ID="DDLFamily" runat="server" AutoPostBack="True">
    </asp:DropDownList>
    <br />
    <br />
    &nbsp; 屬：<asp:DropDownList ID="DDLGenus" runat="server" AutoPostBack="True">
    </asp:DropDownList>
    <br />
    <br />
    &nbsp; 學名：<asp:DropDownList ID="DDLSpecies" runat="server">
    </asp:DropDownList>
    <br />
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button1" runat="server" Text="查詢" />
</asp:Content>

