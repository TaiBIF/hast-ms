<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="GreenhouseListCnum.aspx.vb" Inherits="Mgm_greenhouse_GreenhouseListCnum" title="未命名頁面" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="potID" DataSourceID="SDSCollectNum" Font-Size="Small" 
        ForeColor="#333333" GridLines="None" PageSize="100">
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="potID" 
                DataNavigateUrlFormatString="~/Mgm/greenhouse/GreenhouseDetailEdit.aspx?potID={0}" 
                DataTextField="potID" HeaderText="POT ID" SortExpression="potID" 
                Target="_blank" />
            <asp:BoundField DataField="greenhouseArea" HeaderText="溫室位置" 
                SortExpression="greenhouseArea" />
            <asp:BoundField DataField="removed" HeaderText="移出" SortExpression="removed" />
            <asp:BoundField DataField="collectionNumA" HeaderText="採集號 A" 
                SortExpression="collectionNumA" />
            <asp:BoundField DataField="verSpeciesEA" HeaderText="學名A" 
                SortExpression="verSpeciesE" />
            <asp:BoundField DataField="countryA" HeaderText="產地 A" 
                SortExpression="countryA" />
            <asp:BoundField DataField="collectionNumB" HeaderText="採集號 B" 
                SortExpression="collectionNumB" />
            <asp:BoundField DataField="verSpeciesEB" HeaderText="學名 B" 
                SortExpression="verSpeciesEB" />
            <asp:BoundField DataField="countryB" HeaderText="產地 B" 
                SortExpression="countryB" />
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
    <asp:SqlDataSource ID="SDSCollectNum" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>" 
        SelectCommand="SELECT [potID], [hastSNA], [hastSNB], [collectionNumA], [collectionNumB], [originalData], [verFamilyEA], [verSpeciesEA], [countryA], [verFamilyEB], [verSpeciesEB], [countryB], [greenhouseArea], [removeID], [removed] FROM [vwGreenhouseDetail] WHERE collectionNumA=@collectionNumA AND (COALESCE(collectionNumB, ISNULL(collectionNumB,1)) = COALESCE(NULLIF(@collectionNumB,'0'), ISNULL(collectionNumB,1)))">
        <SelectParameters>
            <asp:QueryStringParameter Name="collectionNumA" 
                QueryStringField="collectionNumA" Type="String" />
            <asp:QueryStringParameter Defaultvalue="0" Name="collectionNumB" 
                QueryStringField="collectionNumB" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

