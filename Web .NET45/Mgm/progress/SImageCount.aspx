<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="SImageCount.aspx.vb" Inherits="Mgm_progress_SImageCount" title="未命名頁面" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
            RepeatDirection="Horizontal">
            <asp:ListItem Value="0">科</asp:ListItem>
            <asp:ListItem Value="1">屬</asp:ListItem>
            <asp:ListItem Value="2">種</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        光碟編號：<asp:TextBox ID="TextBoxFirstDiskNo" runat="server"></asp:TextBox>
        ～<asp:TextBox ID="TextBoxLastDiskNo" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="查詢" />
        <br />
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" 
            NavigateUrl="~/Mgm/progress/SImageList.aspx">標本影像清單</asp:HyperLink>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SDSCount">
            <Columns>
                <asp:BoundField DataField="FamilyE" HeaderText="Family" 
                    SortExpression="FamilyE" />
                <asp:BoundField DataField="genusE" HeaderText="Genus" SortExpression="genusE" />
                <asp:BoundField DataField="speciesE" HeaderText="Species" 
                    SortExpression="speciesE" />
                <asp:BoundField DataField="total" HeaderText="Total" ReadOnly="True" 
                    SortExpression="total">
                    <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SDSCount" runat="server" 
            ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>" 
            SelectCommand="prSpecimenImageCount" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="RadioButtonList1" DefaultValue="0" 
                    Name="category" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="TextBoxFirstDiskNo" DefaultValue="0" 
                    Name="firstDiskNo" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="TextBoxLastDiskNo" DefaultValue="0" 
                    Name="lastDiskNo" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

