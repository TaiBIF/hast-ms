<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="NoteOfFamily.aspx.vb" Inherits="Mgm_secure_NoteOfFamily" title="未命名頁面" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        &nbsp;&nbsp;科名註記&nbsp;|&nbsp;<a href="NoteOfGenus.aspx" target="_blank">屬名註記</a>&nbsp;|&nbsp;<a 
            href="NoteOfSpecies.aspx" target="_blank">學名註記</a>
        <br />
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
            DataSourceID="SDSClass" DataTextField="classExpr" DataValueField="classID">
        </asp:DropDownList>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="familyID" DataSourceID="SDSFamily" 
            ForeColor="#333333" GridLines="None">
            <Columns>
                <asp:CommandField EditText="修改" ShowEditButton="True" />
                <asp:BoundField DataField="familyE" HeaderText="科名" ReadOnly="True" 
                    SortExpression="familyE" />
                <asp:BoundField DataField="familyC" HeaderText="中文科名" ReadOnly="True" 
                    SortExpression="familyC" />
                <asp:CheckBoxField DataField="twFlora" HeaderText="台灣植物" 
                    SortExpression="twFlora" />
                <asp:CheckBoxField DataField="publicData" HeaderText="公開資料" 
                    SortExpression="publicData" />
            </Columns>
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#E3EAEB" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#7C6F57" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
    </div>
    <asp:SqlDataSource ID="SDSClass" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ScientificNameConnectionString %>" 
        SelectCommand="SELECT classID, classE, classC, classE + ' ' + classC as classExpr FROM classX ORDER BY classID">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDSFamily" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ScientificNameConnectionString %>" 
        SelectCommand="SELECT [class], [familyID], [familyE], [familyC], [twFlora], [publicData] FROM [family] WHERE ([class] = @class) ORDER BY [familyE]" 
        UpdateCommand="UPDATE [family] SET [twFlora] = @twFlora, [publicData] = @publicData WHERE [familyID] = @familyID">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="class" 
                PropertyName="SelectedValue" Type="Int16" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="familyID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="twFlora" Type="Boolean" />
            <asp:Parameter Name="publicData" Type="Boolean" />
            <asp:Parameter Name="familyID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

