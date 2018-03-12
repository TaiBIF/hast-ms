<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="genusM.aspx.vb" Inherits="Mgm_secure_genusM" title="未命名頁面" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    科：<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
        DataSourceID="SqlDataSource1" DataTextField="familyExpr" 
        DataValueField="familyID">
    </asp:DropDownList>
    <br />
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="genusID" 
        DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <Columns>
            <asp:BoundField DataField="genusE" HeaderText="genusE" 
                SortExpression="genusE" />
            <asp:BoundField DataField="genusC" HeaderText="genusC" 
                SortExpression="genusC" />
            <asp:BoundField DataField="reference" HeaderText="reference" 
                SortExpression="reference" />
            <asp:BoundField DataField="note" HeaderText="note" SortExpression="note" />
            <asp:CommandField ShowEditButton="True" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" 
                        NavigateUrl='<%# "~/Mgm/secure/speciesM.aspx?genusID=" & Eval("genusID") %>'>學名</asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
    <br />
    <asp:Button ID="btnAddGenus" runat="server" Text="新增屬名" />
    <br />
    <br />
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="genusID" 
        DataSourceID="SqlDataSource2" DefaultMode="Insert">
        <InsertItemTemplate>
            <table style="width: 500px">
                <tr>
                    <td style="width: 80px">
                        建檔者：</td>
                    <td style="width: 400px">
                        <asp:Label ID="lblDataRecorder" runat="server" 
                            Text='<%# Bind("dataRecorder") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 80px; height: 40px;">
                        科名：</td>
                    <td style="width: 400px">
                        <asp:Label ID="lblFamilyE" runat="server"></asp:Label>
                        &nbsp;
                        <asp:Label ID="lblFamilyID" runat="server" Text='<%# Bind("familyID") %>' 
                            Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 80px">
                        屬名：</td>
                    <td style="width: 400px">
                        <asp:TextBox ID="txtGenusE" runat="server" Text='<%# Bind("genusE") %>' 
                            Width="300px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="txtGenusE" ErrorMessage="必填" Visible="False"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="CustomValidator1" runat="server" 
                            ControlToValidate="txtGenusE" 
                            OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 80px">
                        中文屬名：</td>
                    <td style="width: 400px">
                        <asp:TextBox ID="txtGenusC" runat="server" Text='<%# Bind("genusC") %>' 
                            Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 80px">
                        參考資料：</td>
                    <td style="width: 400px">
                        <asp:TextBox ID="txtReference" runat="server" Rows="3" 
                            Text='<%# Bind("reference") %>' Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 80px">
                        備註：</td>
                    <td style="width: 400px">
                        <asp:TextBox ID="txtNote" runat="server" Rows="5" Text='<%# Bind("note") %>' 
                            TextMode="MultiLine" Width="250px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 80px">
                    </td>
                    <td style="width: 400px">
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Insert" Text="確定"></asp:LinkButton>
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                            CommandName="Cancel" Text="取消"></asp:LinkButton>
                    </td>
                </tr>
            </table>
            <br />
            &nbsp;
        </InsertItemTemplate>
    </asp:FormView>
    <br />
    &nbsp;<br />
    &nbsp;
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ScientificNameConnectionString %>" 
        SelectCommand="SELECT * FROM [vwFamily] ORDER BY [familyExpr]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ScientificNameConnectionString %>" 
        DeleteCommand="DELETE FROM [genus] WHERE [genusID] = @genusID" 
        InsertCommand="INSERT INTO [genus] ([familyID], [genusE], [genusC], [reference], [dataRecorder], [note]) VALUES (@familyID, @genusE, @genusC, @reference, @dataRecorder, @note)" 
        SelectCommand="SELECT * FROM [genus] WHERE ([familyAPGIVID] = @familyID) ORDER BY [genusE]" 
        UpdateCommand="UPDATE [genus] SET [genusE] = @genusE, [genusC] = @genusC, [reference] = @reference, [reviewer] = @reviewer, [updateDate] = @updateDate, [note] = @note WHERE [genusID] = @genusID">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="familyID" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="genusID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="genusE" Type="String" />
            <asp:Parameter Name="genusC" Type="String" />
            <asp:Parameter Name="reference" Type="String" />
            <asp:Parameter Name="reviewer" Type="String" />
            <asp:Parameter Name="updateDate" Type="DateTime" />
            <asp:Parameter Name="note" Type="String" />
            <asp:Parameter Name="genusID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="familyID" Type="Int32" />
            <asp:Parameter Name="genusE" Type="String" />
            <asp:Parameter Name="genusC" Type="String" />
            <asp:Parameter Name="reference" Type="String" />
            <asp:Parameter Name="dataRecorder" Type="String" />
            <asp:Parameter Name="note" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    &nbsp;
</asp:Content>

