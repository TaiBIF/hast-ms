<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="BegoniaStock.aspx.vb" Inherits="Mgm_progress_BegoniaStock" title="Begonia 複份庫存" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SDSBegoniaStock">
            <Columns>
                <asp:BoundField DataField="speciesID" HeaderText="speciesID" 
                    SortExpression="speciesID" />
                <asp:BoundField DataField="speciesE" HeaderText="speciesE" 
                    SortExpression="speciesE" />
                <asp:BoundField DataField="speciesC" HeaderText="speciesC" 
                    SortExpression="speciesC" />
                <asp:BoundField DataField="total" HeaderText="total" SortExpression="total" />
            </Columns>
        </asp:GridView>
    </div>
    <asp:SqlDataSource ID="SDSBegoniaStock" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>" 
        SelectCommand="SELECT speciesID, speciesE, speciesC, count(*) AS total FROM vwDupStock WHERE familyID = 453  GROUP BY speciesID, speciesE, speciesC ORDER BY  speciesE ">
    </asp:SqlDataSource>
</asp:Content>

