<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="SpeciesMS.aspx.vb" Inherits="Mgm_general_SpeciesMS" title="未命名頁面" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        科名：<asp:DropDownList ID="DDListFamily" runat="server" AutoPostBack="True">
        </asp:DropDownList>
    </p>
    <p>
        屬名：<asp:DropDownList ID="DDListGenus" runat="server">
        </asp:DropDownList>
    &nbsp;
        <asp:Button ID="btnQuery" runat="server" Text="查詢" />
    </p>
</asp:Content>

