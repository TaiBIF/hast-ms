<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="NoteOfGenus.aspx.vb" Inherits="Mgm_secure_NoteOfGenus" title="未命名頁面" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        &nbsp;&nbsp;<a href="NoteOfFamily.aspx" target="_blank">科名註記</a>&nbsp;|&nbsp;屬名註記&nbsp;|&nbsp;<a 
            href="NoteOfSpecies.aspx" target="_blank">學名註記</a>
        <br />
        <br />
        類群：<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
            DataSourceID="SDSClass" DataTextField="classExpr" DataValueField="classID">
        </asp:DropDownList>
        <br />
        <br />
        科：<asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SDSFamily" 
            DataTextField="familyExpr" DataValueField="familyID">
        </asp:DropDownList>
        &nbsp;
        <asp:Button ID="Button1" runat="server" Text="查詢" />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="genusID" DataSourceID="SDSGenus" 
            ForeColor="#333333" GridLines="None">
            <Columns>
                <asp:CommandField EditText="修改" ShowEditButton="True" />
                <asp:BoundField DataField="genusE" HeaderText="屬名" ReadOnly="True" 
                    SortExpression="genusE" />
                <asp:BoundField DataField="genusC" HeaderText="中文屬名" ReadOnly="True" 
                    SortExpression="genusC" />
                <asp:CheckBoxField DataField="twFlora" HeaderText="台灣植物" 
                    SortExpression="twFlora" />
                <asp:CheckBoxField DataField="publicData" HeaderText="公開資料" 
                    SortExpression="publicData" />
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#EFF3FB" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
    </div>
    <asp:SqlDataSource ID="SDSClass" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ScientificNameConnectionString %>" 
        SelectCommand="SELECT classID, classE + classC AS classExpr FROM classX ORDER BY classID">
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
        SelectCommand="SELECT [familyID], [genusID], [genusE], [genusC], [twFlora], [publicData] FROM [genus] WHERE ([familyID] = @familyID) ORDER BY [genusE]" 
        UpdateCommand="UPDATE [genus] SET [twFlora] = @twFlora, [publicData] = @publicData WHERE [genusID] = @genusID">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList2" Name="familyID" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="twFlora" Type="Boolean" />
            <asp:Parameter Name="publicData" Type="Boolean" />
            <asp:Parameter Name="genusID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

