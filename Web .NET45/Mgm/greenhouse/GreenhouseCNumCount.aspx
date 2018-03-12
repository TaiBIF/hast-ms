<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="GreenhouseCNumCount.aspx.vb" Inherits="Mgm_greenhouse_GreenhouseCNumCount" title="未命名頁面" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataSourceID="SqlDataSource1" Font-Size="Small" ForeColor="#333333" 
        GridLines="None" PageSize="100">
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="collectionNumA,collectionNumB" 
                DataNavigateUrlFormatString="~/Mgm/greenhouse/GreenhouseListCNum.aspx?collectionNumA={0}&amp;collectionNumb={1}" 
                DataTextField="collectionNumA" HeaderText="採集號 A" 
                SortExpression="collectionNumA" Target="_blank" />
            <asp:BoundField DataField="collectionNumB" HeaderText="採集號 B" 
                SortExpression="collectionNumB" />
            <asp:BoundField DataField="total" HeaderText="盆數小計" SortExpression="total" />
        </Columns>
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>" 
        SelectCommand="SELECT [collectionNumA], [collectionNumB] , COUNT(collectionNumA) AS total FROM [vwGreenhouseDetail] GROUP BY collectionNumA, collectionNumB">
    </asp:SqlDataSource>
</asp:Content>

