<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="DupsList.aspx.vb" Inherits="Mgm_exchange_DupsList" title="未命名頁面" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
            RepeatDirection="Horizontal">
            <asp:ListItem Value="%">全部</asp:ListItem>
            <asp:ListItem Value="1">蕨類植物</asp:ListItem>
            <asp:ListItem Value="2">裸子植物</asp:ListItem>
            <asp:ListItem Value="3">雙子葉植物</asp:ListItem>
            <asp:ListItem Value="4">單子葉植物</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <asp:GridView ID="GridViewFamily" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="familyID">
            <Columns>
                <asp:BoundField DataField="familyE" HeaderText="科名" />
                <asp:BoundField DataField="familyC" HeaderText="中文科名" />
                <asp:BoundField DataField="total" HeaderText="小計" />
                <asp:HyperLinkField DataNavigateUrlFields="familyID" 
                    DataNavigateUrlFormatString="~/Mgm/exchange/DupsListGenus.aspx?familyID={0}" 
                    HeaderText="科庫存統計" Text="統計" />
                <asp:HyperLinkField DataNavigateUrlFields="familyID" 
                    DataNavigateUrlFormatString="~/Mgm/exchange/DupsDetail.aspx?familyID={0}" 
                    HeaderText="科庫存清單" Text="清單" />
            </Columns>
        </asp:GridView>
    </div>
    <asp:SqlDataSource ID="SqlDS" runat="server"></asp:SqlDataSource>
</asp:Content>

