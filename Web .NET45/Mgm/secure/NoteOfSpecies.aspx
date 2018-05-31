<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="NoteOfSpecies.aspx.vb" Inherits="Mgm_secure_NoteOfSpecies" title="未命名頁面" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        &nbsp;&nbsp;<a href="NoteOfFamily.aspx" target="_blank">科名註記</a>&nbsp;|&nbsp;<a 
            href="NoteOfGenus.aspx" target="_blank">屬名註記</a>&nbsp;|&nbsp;學名註記 
        <br />
        <br />
        類群：<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
            DataSourceID="SDSClass" DataTextField="classExpr" DataValueField="classID">
        </asp:DropDownList>
        <br />
        <br />
        科：<asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
            DataSourceID="SDSFamily" DataTextField="familyExpr" DataValueField="familyID">
        </asp:DropDownList>
        <br />
        <br />
        屬：<asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SDSGenus" 
            DataTextField="genusExpr" DataValueField="genusID">
        </asp:DropDownList>
        <asp:Button ID="Button1" runat="server" Text="查詢" />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="speciesID" DataSourceID="SDSSpecies" 
            ForeColor="#333333" GridLines="None">
            <Columns>
                <asp:CommandField EditText="修改" ShowEditButton="True" />
                <asp:BoundField DataField="speciesE" HeaderText="學名" ReadOnly="True" 
                    SortExpression="speciesE" />
                <asp:BoundField DataField="speciesC" HeaderText="中文名" ReadOnly="True" 
                    SortExpression="speciesC" />
                <asp:CheckBoxField DataField="flora2" HeaderText="Flora II" 
                    SortExpression="accepted">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:CheckBoxField>
                <asp:CheckBoxField DataField="manualTWVP" HeaderText="簡誌">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:CheckBoxField>
                <asp:CheckBoxField DataField="twFlora" HeaderText="台灣植物" 
                    SortExpression="twFlora">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:CheckBoxField>
                <asp:CheckBoxField DataField="publicData" HeaderText="公開資料" 
                    SortExpression="publicData">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:CheckBoxField>
            </Columns>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
        <br />
    </div>
    <asp:SqlDataSource ID="SDSClass" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ScientificNameConnectionString %>" 
        SelectCommand="SELECT [classID], classE + classC as classExpr FROM [classX] ORDER BY [classID]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDSFamily" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ScientificNameConnectionString %>" 
        SelectCommand="SELECT [class], [familyID], [familyExpr] FROM [vwFamily] WHERE ([class] = @class) ORDER BY [familyExpr]">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="class" 
                PropertyName="SelectedValue" Type="Int16" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDSGenus" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ScientificNameConnectionString %>" 
        SelectCommand="SELECT [familyID], [genusID], [genusExpr] FROM [vwGenus] WHERE ([familyID] = @familyID) ORDER BY [genusExpr]">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList2" Name="familyID" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDSSpecies" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ScientificNameConnectionString %>" 
        SelectCommand="SELECT [genusID], [speciesID], [speciesE], [speciesC], [flora2], manualTWVP, [publicData], [twFlora] FROM [species] WHERE ([genusID] = @genusID) ORDER BY [speciesE]" 
        UpdateCommand="UPDATE [species] SET flora2 = @flora2, manualTWVP = @manualTWVP, [publicData] = @publicData, [twFlora] = @twFlora WHERE [speciesID] = @speciesID">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList3" Name="genusID" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="flora2" Type="Boolean" />
            <asp:Parameter Name="manualTWVP" Type="Boolean" />
            <asp:Parameter Name="publicData" Type="Boolean" />
            <asp:Parameter Name="twFlora" Type="Boolean" />
            <asp:Parameter Name="speciesID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

