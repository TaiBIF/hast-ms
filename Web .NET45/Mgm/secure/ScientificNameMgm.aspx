<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ScientificNameMgm.aspx.vb" Inherits="Mgm_secure_ScientificNameMgm" title="未命名頁面" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    科：<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
        DataSourceID="SqlDataSource1" DataTextField="familyExpr" DataValueField="familyID">
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
            <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
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
            <table>
                <tr>
                    <td style="width: 100px">
                        建檔者：</td>
                    <td style="width: 333px">
                        <asp:Label ID="lblDataRecorder" runat="server" 
                            Text='<%# Bind("dataRecorder") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px">
                        科名：</td>
                    <td style="width: 333px">
                        <asp:Label ID="lblFamilyE" runat="server"></asp:Label>
                        &nbsp;
                        <asp:Label ID="lblFamilyID" runat="server" Text='<%# Bind("familyID") %>' 
                            Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px">
                        屬名：</td>
                    <td style="width: 333px">
                        <asp:TextBox ID="txtGenusE" runat="server" Text='<%# Bind("genusE") %>'></asp:TextBox>
                        <asp:CustomValidator ID="CustomValidator1" runat="server" 
                            ControlToValidate="txtGenusE" 
                            OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px">
                        中文屬名：</td>
                    <td style="width: 333px">
                        <asp:TextBox ID="txtGenusC" runat="server" Text='<%# Bind("genusC") %>'></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px">
                        參考資料：</td>
                    <td style="width: 333px">
                        <asp:TextBox ID="txtReference" runat="server" Rows="3" 
                            Text='<%# Bind("reference") %>' TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px">
                        備註：</td>
                    <td style="width: 333px">
                        <asp:TextBox ID="txtNote" runat="server" Rows="5" Text='<%# Bind("note") %>' 
                            TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px">
                    </td>
                    <td style="width: 333px">
                    </td>
                </tr>
            </table>
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="新增"></asp:LinkButton>
            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                CommandName="Cancel" Text="取消"></asp:LinkButton>
        </InsertItemTemplate>
    </asp:FormView>
    <br />
    <br />
    &nbsp; &nbsp; &nbsp; &nbsp;<asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="speciesID" 
        DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="speciesE" HeaderText="學名" 
                SortExpression="speciesE" />
            <asp:BoundField DataField="speciesC" HeaderText="中文名" 
                SortExpression="speciesC" />
        </Columns>
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#E3EAEB" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#7C6F57" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <br />
    &nbsp;<asp:Button ID="btnAddSpecies" runat="server" Text="新增學名" />
    &nbsp;<br />
    <br />
    &nbsp;<br />
    &nbsp;<asp:FormView ID="FormView2" runat="server" DataKeyNames="speciesID" 
        DataSourceID="SqlDataSource4">
        <EditItemTemplate>
            <table>
                <tr>
                    <td style="font-size: 12px; width: 85px; text-align: right">
                        學名：</td>
                    <td style="width: 760px">
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("speciesE") %>' 
                            Width="600px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12px; width: 85px; text-align: right">
                        中文名：</td>
                    <td style="width: 760px">
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("speciesC") %>' 
                            Width="400px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12px; width: 85px; text-align: right">
                        參考文獻：</td>
                    <td style="width: 760px">
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("reference") %>' 
                            Width="600px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12px; width: 85px; text-align: right">
                        參考文獻連結：</td>
                    <td style="width: 760px">
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("referenceLink") %>' 
                            Width="600px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12px; width: 85px; text-align: right">
                        發表文獻：</td>
                    <td style="width: 760px">
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("protologue") %>' 
                            Width="600px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12px; width: 85px; text-align: right">
                        發表文獻連結：</td>
                    <td style="width: 760px">
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("protologueLink") %>' 
                            Width="600px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12px; width: 85px; text-align: right">
                        備註：</td>
                    <td style="width: 760px">
                        <asp:TextBox ID="TextBox7" runat="server" Columns="60" Rows="4" 
                            Text='<%# Bind("note") %>' TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <asp:TextBox ID="reviewerTextBox" runat="server" Enabled="False" 
                Text='<%# Bind("reviewer") %>'></asp:TextBox>
            <asp:TextBox ID="updateDateTextBox" runat="server" 
                Text='<%# Bind("updateDate") %>'></asp:TextBox>
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="更新"></asp:LinkButton>
            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                CommandName="Cancel" Text="取消"></asp:LinkButton>
        </EditItemTemplate>
        <InsertItemTemplate>
            <table>
                <tr>
                    <td style="font-size: 12px; width: 85px; height: 26px; text-align: right">
                        屬名：</td>
                    <td style="width: 760px; height: 26px">
                        <asp:Label ID="lblGenusE" runat="server"></asp:Label>
                        <asp:Label ID="lblGenusID" runat="server" Text='<%# Bind("genusID") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12px; width: 85px; height: 26px; text-align: right">
                        學名：</td>
                    <td style="width: 760px; height: 26px">
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("speciesE") %>' 
                            Width="600px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12px; width: 85px; text-align: right">
                        中文名：</td>
                    <td style="width: 760px">
                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("speciesC") %>'></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12px; width: 85px; text-align: right">
                        參考文獻：</td>
                    <td style="width: 760px">
                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("reference") %>'></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12px; width: 85px; text-align: right">
                        參考文獻連結：</td>
                    <td style="width: 760px">
                        <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("referenceLink") %>'></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12px; width: 85px; text-align: right">
                        發表文獻：</td>
                    <td style="width: 760px">
                        <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("protologue") %>'></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12px; width: 85px; text-align: right">
                        發表文獻連結：</td>
                    <td style="width: 760px">
                        <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("protologueLink") %>'></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12px; width: 85px; text-align: right">
                        備註：</td>
                    <td style="width: 760px">
                        <asp:TextBox ID="TextBox14" runat="server" Columns="60" Rows="4" 
                            Text='<%# Bind("note") %>' TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12px; width: 85px; text-align: right">
                        建檔人員：</td>
                    <td style="width: 760px">
                    </td>
                </tr>
            </table>
            <asp:TextBox ID="genusIDTextBox" runat="server" Text='<%# Bind("genusID") %>'></asp:TextBox>
            <asp:TextBox ID="dataRecorderTextBox" runat="server" 
                Text='<%# Bind("dataRecorder") %>'></asp:TextBox>
            <br />
            <asp:LinkButton ID="InsertButton0" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="插入"></asp:LinkButton>
            <asp:LinkButton ID="InsertCancelButton0" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
        </InsertItemTemplate>
        <ItemTemplate>
            <table style="font-size: 12pt; width: 800px">
                <tr>
                    <td style="width: 100px;">
                        學名：</td>
                    <td>
                        <asp:Label ID="speciesELabel" runat="server" Text='<%# Bind("speciesE") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px;">
                        中文名：</td>
                    <td>
                        <asp:Label ID="speciesCLabel" runat="server" Text='<%# Bind("speciesC") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px;">
                        參考文獻：</td>
                    <td>
                        <asp:Label ID="referenceLabel" runat="server" Text='<%# Bind("reference") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px;">
                        參考文獻連結：</td>
                    <td>
                        <asp:Label ID="referenceLinkLabel" runat="server" 
                            Text='<%# Bind("referenceLink") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px;">
                        發表文獻：</td>
                    <td>
                        <asp:Label ID="protologueLabel" runat="server" Text='<%# Bind("protologue") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px;">
                        發表文獻連結：</td>
                    <td>
                        <asp:Label ID="protologueLinkLabel" runat="server" 
                            Text='<%# Bind("protologueLink") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px;">
                        備註：</td>
                    <td>
                        <asp:Label ID="noteLabel" runat="server" Text='<%# Bind("note") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px;">
                        修訂者：</td>
                    <td>
                    </td>
                </tr>
            </table>
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="編輯"></asp:LinkButton>
            &nbsp;&nbsp;
        </ItemTemplate>
    </asp:FormView>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ScientificNameConnectionString %>" 
        SelectCommand="SELECT * FROM [vwFamily] ORDER BY [familyE]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ScientificNameConnectionString %>" 
        DeleteCommand="DELETE FROM [genus] WHERE [genusID] = @genusID" 
        InsertCommand="INSERT INTO [genus] ([familyID], [genusE], [genusC], [reference], [dataRecorder], [note]) VALUES (@familyID, @genusE, @genusC, @reference, @dataRecorder, @note)" 
        SelectCommand="SELECT * FROM [genus] WHERE ([familyID] = @familyID) ORDER BY [genusE]" 
        UpdateCommand="UPDATE [genus] SET [familyID] = @familyID, [genusNo] = @genusNo, [genusE] = @genusE, [genusC] = @genusC, [attributeNo] = @attributeNo, [reference] = @reference, [checkerID] = @checkerID, [dataRecorder] = @dataRecorder, [reviewer] = @reviewer, [recordDate] = @recordDate, [updateDate] = @updateDate, [note] = @note, [unicodeChar] = @unicodeChar, [msrepl_tran_version] = @msrepl_tran_version WHERE [genusID] = @genusID">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="familyID" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="genusID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="familyID" Type="Int32" />
            <asp:Parameter Name="genusNo" Type="String" />
            <asp:Parameter Name="genusE" Type="String" />
            <asp:Parameter Name="genusC" Type="String" />
            <asp:Parameter Name="attributeNo" Type="Int16" />
            <asp:Parameter Name="reference" Type="String" />
            <asp:Parameter Name="checkerID" Type="Int32" />
            <asp:Parameter Name="dataRecorder" Type="String" />
            <asp:Parameter Name="reviewer" Type="String" />
            <asp:Parameter Name="recordDate" Type="DateTime" />
            <asp:Parameter Name="updateDate" Type="DateTime" />
            <asp:Parameter Name="note" Type="String" />
            <asp:Parameter Name="unicodeChar" Type="String" />
            <asp:Parameter Name="msrepl_tran_version" Type="Object" />
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
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ScientificNameConnectionString %>" 
        SelectCommand="SELECT [genusID], [speciesID], [speciesE], [speciesC], [reference], [referenceLink], [protologue], [protologueLink], [note] FROM [species] WHERE ([genusID] = @genusID) ORDER BY [speciesE]">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="genusID" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ScientificNameConnectionString %>" 
        DeleteCommand="DELETE FROM [species] WHERE [speciesID] = @speciesID" 
        InsertCommand="INSERT INTO [species] ([genusID], [speciesE], [speciesC], [dataRecorder], [reference], [referenceLink], [protologue], [protologueLink], [note]) VALUES (@genusID, @speciesE, @speciesC, @dataRecorder, @reference, @referenceLink, @protologue, @protologueLink, @note)" 
        SelectCommand="SELECT * FROM [species] WHERE ([speciesID] = @speciesID)" 
        UpdateCommand="UPDATE [species] SET [speciesE] = @speciesE, [speciesC] = @speciesC, [reviewer] = @reviewer, [updateDate] = @updateDate, [reference] = @reference, [referenceLink] = @referenceLink, [protologue] = @protologue, [protologueLink] = @protologueLink, [note] = @note WHERE [speciesID] = @speciesID">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView2" Name="speciesID" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="speciesID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="speciesE" Type="String" />
            <asp:Parameter Name="speciesC" Type="String" />
            <asp:Parameter Name="reviewer" Type="String" />
            <asp:Parameter Name="updateDate" Type="DateTime" />
            <asp:Parameter Name="reference" Type="String" />
            <asp:Parameter Name="referenceLink" Type="String" />
            <asp:Parameter Name="protologue" Type="String" />
            <asp:Parameter Name="protologueLink" Type="String" />
            <asp:Parameter Name="note" Type="String" />
            <asp:Parameter Name="speciesID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="genusID" Type="Int32" />
            <asp:Parameter Name="speciesE" Type="String" />
            <asp:Parameter Name="speciesC" Type="String" />
            <asp:Parameter Name="dataRecorder" Type="String" />
            <asp:Parameter Name="reference" Type="String" />
            <asp:Parameter Name="referenceLink" Type="String" />
            <asp:Parameter Name="protologue" Type="String" />
            <asp:Parameter Name="protologueLink" Type="String" />
            <asp:Parameter Name="note" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>

