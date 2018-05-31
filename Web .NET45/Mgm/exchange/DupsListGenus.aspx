<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="DupsListGenus.aspx.vb" Inherits="Mgm_exchange_DupsGenus" title="未命名頁面" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="familyE" HeaderText="科名" />
                <asp:BoundField DataField="familyC" HeaderText="中文科名" />
                <asp:BoundField DataField="genusE" HeaderText="屬名" />
                <asp:BoundField DataField="genusC" HeaderText="中文屬名" />
                <asp:BoundField DataField="total" HeaderText="小計" />
                <asp:HyperLinkField DataNavigateUrlFields="familyID,genusID" 
                    DataNavigateUrlFormatString="~/Mgm/exchange/DupsListSpecies.aspx?familyID={0}&amp;genusID={1}" 
                    HeaderText="屬庫存統計" Text="統計" />
                <asp:HyperLinkField DataNavigateUrlFields="familyID,genusID" 
                    DataNavigateUrlFormatString="~/Mgm/exchange/DupsDetail.aspx?familyID={0}&amp;genusID={1}" 
                    HeaderText="屬庫存清單" Text="查詢" />
            </Columns>
        </asp:GridView>
        &nbsp;</div>
    <asp:SqlDataSource ID="SqlDS" runat="server"></asp:SqlDataSource>
</asp:Content>

