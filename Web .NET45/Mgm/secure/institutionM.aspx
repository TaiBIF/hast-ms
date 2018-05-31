<%@ Page Title="單位/機構 清單" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="institutionM.aspx.vb" Inherits="Mgm_secure_institutionM" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <p>
    &nbsp;&nbsp;&nbsp;<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="institutionDetailM.aspx">新增</asp:HyperLink>

    </p>
   
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDsInstitution" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="institutionID" DataNavigateUrlFormatString="institutionDetailM.aspx?institutionID={0}" Text="編輯" NavigateUrl="institutionDetailM.aspx" />
            <asp:BoundField DataField="institutionAbbr" HeaderText="單位代碼" />
            <asp:HyperLinkField DataNavigateUrlFields="website" DataNavigateUrlFormatString="{0}" DataTextField="institutionE" HeaderText="單位名稱（英）" />
            <asp:BoundField DataField="institutionC" HeaderText="單位名稱（中）" />
            <asp:BoundField DataField="country2Code" HeaderText="國家" />
            <asp:HyperLinkField DataTextField="note" HeaderText="備註" />
        </Columns>
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
        <SortedAscendingCellStyle BackColor="#F4F4FD" />
        <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
        <SortedDescendingCellStyle BackColor="#D8D8F0" />
        <SortedDescendingHeaderStyle BackColor="#3E3277" />
    </asp:GridView>
    
    <br />
    <br />
    &nbsp;&nbsp;&nbsp;<a href="javascript:history.go(-1)" title="回上一頁">回上一頁</a><asp:SqlDataSource ID="SqlDsInstitution" runat="server" ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>" SelectCommand="SELECT [institutionID], [institutionAbbr], [institutionE], [institutionC], [note], [website], [country2Code] FROM [institution] ORDER BY [institutionAbbr]"></asp:SqlDataSource>


    
</asp:Content>

