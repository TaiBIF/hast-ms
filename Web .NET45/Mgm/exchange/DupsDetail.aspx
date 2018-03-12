<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="DupsDetail.aspx.vb" Inherits="Mgm_exchange_DupsDetail" title="未命名頁面" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDS">
            <Columns>
                <asp:BoundField DataField="CKSN" HeaderText="清查序號" />
                <asp:BoundField DataField="familyE" HeaderText="科名" />
                <asp:BoundField DataField="genusE" HeaderText="屬名" />
                <asp:BoundField DataField="speciesE" HeaderText="學名" />
                <asp:BoundField DataField="speciesC" HeaderText="中文名" />
                <asp:BoundField DataField="collectNum" HeaderText="採集號" />
                <asp:BoundField DataField="storedSite" HeaderText="存放地點" />
                <asp:CheckBoxField DataField="blnBored" HeaderText="蟲蛀" />
                <asp:CheckBoxField DataField="blnDestroyed" HeaderText="損毀" />
                <asp:CheckBoxField DataField="blnNoFlwFruit" HeaderText="缺花果" />
                <asp:BoundField DataField="specimenOrderNum" HeaderText="正份館號" />
            </Columns>
        </asp:GridView>
    </div>
    <asp:SqlDataSource ID="SqlDS" runat="server"></asp:SqlDataSource>
</asp:Content>

