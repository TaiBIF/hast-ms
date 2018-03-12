<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="GreenhouseList.aspx.vb" Inherits="Mgm_greenhouse_GreenhouseList" title="未命名頁面" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        植栽編號：<asp:TextBox ID="TextBoxPotID" runat="server"></asp:TextBox>
        <asp:Button ID="btnQuery" runat="server" Text="查詢" />
        <br />
        <br />
        溫室地點：<asp:DropDownList ID="DDListArea" runat="server" 
            AppendDataBoundItems="true" AutoPostBack="True" DataSourceID="SDSGhArea" 
            DataTextField="greenhouseArea" DataValueField="areaID">
            <asp:ListItem Value="0">請選擇</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <asp:Button ID="btnSNNull" runat="server" Height="25px" Text="列出SN未填資料" 
            Width="120px" />
        &nbsp;
        <asp:Button ID="btnAll" runat="server" Height="25px" Text="列出全部資料" 
            Width="120px" />
        <br />
        <br />
        <a href="GreenhouseCNumCount.aspx" target="_blank">採集號-植栽統計</a>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="potID" 
            Font-Size="14px" PageSize="100">
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="potID" 
                    DataNavigateUrlFormatString="~/Mgm/greenhouse/GreenhouseDetailEdit.aspx?potID={0}" 
                    DataTextField="potID" HeaderText="POT ID" SortExpression="potID" 
                    Target="_blank" />
                <asp:BoundField DataField="greenhouseArea" HeaderText="溫室位置" 
                    SortExpression="greenhouseArea" />
                <asp:BoundField DataField="removed" HeaderText="移出" SortExpression="removed" />
                <asp:HyperLinkField DataNavigateUrlFields="collectionNumA,collectionNumB" 
                    DataNavigateUrlFormatString="~/Mgm/greenhouse/GreenhouseListCNum.aspx?collectionNumA={0}&amp;collectionNumB={1}" 
                    DataTextField="collectionNumA" HeaderText="採集號 A" 
                    SortExpression="collectionNumA" Target="_blank" />
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
                <asp:BoundField DataField="originalData" HeaderText="原填入資料" 
                    SortExpression="originalData">
                    <ItemStyle Font-Size="12px" Width="150px" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
        <br />
        <br />
        <asp:SqlDataSource ID="SDSGHList" runat="server" 
            ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>" 
            SelectCommand="SELECT [potID], [hastSNA], [hastSNB], [collectorA], [collectNum1A], [collectNum2A], [collectionNumA], [collectorB], [collectNum1B], [collectNum2B], [collectionNumB], [originalData], [verFamilyEA], [verSpeciesEA], [countryA], [verFamilyEB], [verSpeciesEB], [countryB], [greenhouseArea], [removeID], [removed] FROM [vwGreenhouseDetail]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SDSGhListArea" runat="server" 
            ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SDSGhArea" runat="server" 
            ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>" 
            SelectCommand="SELECT [areaID], [greenhouseArea] FROM [greenhouseArea] ORDER BY [greenhouseArea]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SDSGhListPotID" runat="server" 
            ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SDSGhSNNull" runat="server" 
            ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>" 
            SelectCommand="SELECT [potID], [hastSNA], [hastSNB], [collectorA], [collectNum1A], [collectNum2A], [collectionNumA], [collectorB], [collectNum1B], [collectNum2B], [collectionNumB], [originalData], [verFamilyEA], [verSpeciesEA], [countryA], [verFamilyEB], [verSpeciesEB], [countryB], [greenhouseArea], [removeID], [removed] FROM [vwGreenhouseDetail]">
        </asp:SqlDataSource>
        &nbsp; &nbsp;
    </div>
</asp:Content>

