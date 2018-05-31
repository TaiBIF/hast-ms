<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="SImageList.aspx.vb" Inherits="Mgm_progress_SImageList" title="未命名頁面" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <br />
        標本影像清單<br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SDSSImageList">
            <Columns>
                <asp:BoundField DataField="diskNo" HeaderText="Disk No." 
                    SortExpression="diskNo" />
                <asp:BoundField DataField="specimenOrderNum" HeaderText="Hast Access N0." 
                    SortExpression="specimenOrderNum" />
                <asp:BoundField DataField="FamilyE" HeaderText="Family" 
                    SortExpression="FamilyE" />
                <asp:BoundField DataField="genusE" HeaderText="Genus" SortExpression="genusE" />
                <asp:BoundField DataField="speciesE" HeaderText="Scientific Name" 
                    SortExpression="speciesE" />
            </Columns>
        </asp:GridView>
    </div>
    <asp:SqlDataSource ID="SDSSImageList" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>" 
        SelectCommand="prSpecimenImageList" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="firstDiskNo" 
                QueryStringField="firstDiskNo" Type="Int32" />
            <asp:QueryStringParameter DefaultValue="0" Name="lastDiskNo" 
                QueryStringField="lastDiskNo" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

