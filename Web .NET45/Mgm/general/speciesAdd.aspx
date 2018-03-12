<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="speciesAdd.aspx.vb" Inherits="Mgm_general_speciesAdd" title="未命名頁面" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <a href="javascript:history.go(-1)" title="回上一頁">回上一頁</a><br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="speciesID" DataSourceID="SqlDataSource1" 
        ForeColor="#333333" GridLines="None" PageSize="50">
        <Columns>
            <asp:CommandField SelectText="詳細資料" ShowSelectButton="True" />
            <asp:BoundField DataField="speciesE" HeaderText="學名" 
                SortExpression="speciesE" />
            <asp:BoundField DataField="speciesC" HeaderText="中文名" 
                SortExpression="speciesC" />
        </Columns>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
    &nbsp;<br />
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="speciesID" 
        DataSourceID="SqlDataSource2">
        <EditItemTemplate>
            <table style="width: 800px">
                <tr>
                    <td style="font-size: 12pt; width: 120px; background-color: powderblue;">
                        學名：</td>
                    <td style="font-size: 12pt">
                        <asp:TextBox ID="speciesETextBox" runat="server" Text='<%# Bind("speciesE") %>' 
                            Width="600px"></asp:TextBox>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="font-size: 12pt; width: 120px; background-color: powderblue;">
                        中文名：</td>
                    <td style="font-size: 12pt">
                        <asp:TextBox ID="speciesCTextBox" runat="server" Text='<%# Bind("speciesC") %>' 
                            Width="600px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12pt; width: 120px; background-color: powderblue">
                        Section：</td>
                    <td>
                        <asp:TextBox ID="sectionNameTextBox" runat="server" 
                            Text='<%# Bind("sectionName") %>'></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12pt; width: 120px; background-color: powderblue;">
                        參考文獻：</td>
                    <td style="font-size: 12pt">
                        <asp:TextBox ID="referenceTextBox" runat="server" 
                            Text='<%# Bind("reference") %>' Width="600px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12pt; width: 120px; background-color: powderblue;">
                        參考文獻連結：</td>
                    <td style="font-size: 12pt">
                        <asp:TextBox ID="referenceLinkTextBox" runat="server" 
                            Text='<%# Bind("referenceLink") %>' Width="600px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12pt; width: 120px; background-color: powderblue;">
                        發表文獻：</td>
                    <td style="font-size: 12pt">
                        <asp:TextBox ID="protologueTextBox" runat="server" 
                            Text='<%# Bind("protologue") %>' Width="600px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12pt; width: 120px; background-color: powderblue;">
                        發表文獻連結：</td>
                    <td style="font-size: 12pt">
                        <asp:TextBox ID="protologueLinkTextBox" runat="server" 
                            Text='<%# Bind("protologueLink") %>' Width="600px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12pt; width: 120px; background-color: powderblue;">
                        備註：</td>
                    <td style="font-size: 12pt">
                        <asp:TextBox ID="noteTextBox" runat="server" Rows="5" 
                            Text='<%# Bind("note") %>' TextMode="MultiLine" Width="550px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12pt; width: 120px; background-color: powderblue;">
                        建檔者：</td>
                    <td style="font-size: 12pt">
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("dataRecorder") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12pt; width: 120px; background-color: powderblue;">
                        建檔日期：</td>
                    <td style="font-size: 12pt">
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("recordDate") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12pt; width: 120px; background-color: powderblue;">
                        訂正者：</td>
                    <td style="font-size: 12pt">
                        <asp:TextBox ID="updateDateTextBox" runat="server" Enabled="False" 
                            Text='<%# Bind("updateDate") %>' Width="300px"></asp:TextBox>
                        <asp:TextBox ID="reviewerTextBox" runat="server" Enabled="False" 
                            Text='<%# Bind("reviewer") %>' Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12pt; width: 120px; background-color: powderblue;">
                        訂正日期：</td>
                    <td style="font-size: 12pt">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="font-size: 12pt; width: 120px; background-color: powderblue">
                        Continent：</td>
                    <td>
                        <asp:TextBox ID="continentTextBox" runat="server" 
                            ontextchanged="TextBox2_TextChanged" Text='<%# Bind("continent") %>' 
                            Width="520px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12pt; width: 120px; background-color: powderblue;">
                        Distribution：</td>
                    <td>
                        <asp:TextBox ID="distributionTextBox" runat="server" 
                            Text='<%# Bind("distribution") %>' Width="520px"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </EditItemTemplate>
        <InsertItemTemplate>
            <table style="font-size: 12pt" width="800">
                <tr>
                    <td style="font-size: 12pt; width: 120px; background-color: powderblue">
                        學名：</td>
                    <td style="height: 26px">
                        <asp:TextBox ID="speciesETextBox0" runat="server" 
                            Text='<%# Bind("speciesE") %>' Width="520px"></asp:TextBox>
                        &nbsp;
                        <asp:CustomValidator ID="CustomValidator1" runat="server" 
                            ControlToValidate="speciesETextBox0" ErrorMessage="CustomValidator" 
                            OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12pt; width: 120px; background-color: powderblue">
                        &nbsp;</td>
                    <td style="height: 26px;">
                        <a href="http://www.tropicos.org/" target="_blank">MO Tropicos</a></td>
                </tr>
                <tr>
                    <td style="font-size: 12pt; width: 120px; background-color: powderblue">
                        中文名：</td>
                    <td>
                        <asp:TextBox ID="speciesCTextBox0" runat="server" 
                            Text='<%# Bind("speciesC") %>' Width="520px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12pt; width: 120px; background-color: powderblue">
                        Section：</td>
                    <td>
                        <asp:TextBox ID="sectionNameTextBox0" runat="server" 
                            Text='<%# Bind("sectionName") %>'></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12pt; width: 120px; background-color: powderblue">
                         參考文獻：</td>
                    <td>
                        <asp:TextBox ID="referenceTextBox0" runat="server" 
                            Text='<%# Bind("reference") %>' Width="200px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12pt; width: 120px; background-color: powderblue">
                        參考文獻連結：</td>
                    <td>
                        <asp:TextBox ID="referenceLinkTextBox0" runat="server" 
                            Text='<%# Bind("referenceLink") %>' Width="520px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12pt; width: 120px; background-color: powderblue">
                       發表文獻：</td>
                    <td>
                        <asp:TextBox ID="protologueTextBox0" runat="server" 
                            Text='<%# Bind("protologue") %>' Width="520px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12pt; width: 120px; background-color: powderblue">
                        發表文獻連結：</td>
                    <td>
                        <asp:TextBox ID="protologueLinkTextBox0" runat="server" 
                            Text='<%# Bind("protologueLink") %>' Width="520px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12pt; width: 120px; background-color: powderblue">
                        備註</td>
                    <td>
                        <asp:TextBox ID="noteTextBox0" runat="server" Rows="5" 
                            Text='<%# Bind("note") %>' TextMode="MultiLine" Width="500px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12pt; width: 120px; background-color: powderblue">
                        </td>
                    <td>
                        <asp:TextBox ID="dataRecorderTextBox" runat="server" Enabled="False" 
                            Text='<%# Bind("dataRecorder") %>' Width="300px"></asp:TextBox>
                        <asp:Label ID="Label3" runat="server" Text="genusID: " Visible="False"></asp:Label>
                        <asp:TextBox ID="genusIDTextBox" runat="server" Text='<%# Bind("genusID") %>' 
                            Visible="False"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12pt; width: 120px; background-color: powderblue">
                        建檔者：</td>
                    <td>
                        <asp:TextBox ID="recordDateTextBox" runat="server" Enabled="False" 
                            Text='<%# Bind("recordDate") %>' Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12pt; width: 120px; background-color: powderblue">
                        建檔日期：Continent：</td>
                    <td>
                        <asp:TextBox ID="continentTextBox0" runat="server" 
                            ontextchanged="TextBox2_TextChanged" Text='<%# Bind("continent") %>' 
                            Width="520px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12pt; width: 120px; background-color: powderblue;">
                        Distribution：</td>
                    <td>
                        <asp:TextBox ID="distributionTextBox0" runat="server" 
                            Text='<%# Bind("distribution") %>' Width="520px"></asp:TextBox>
                    </td>
                </tr>
            </table>
            &nbsp;
        </InsertItemTemplate>
        <ItemTemplate>
            <table style="width: 800px">
                <tr>
                    <td style="font-size: 12pt; width: 120px; background-color: powderblue;">
                        學名：</td>
                    <td style="font-size: 12pt">
                        <asp:Label ID="speciesELabel" runat="server" Text='<%# Bind("speciesE") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12pt; width: 120px; background-color: powderblue;">
                        中文名：</td>
                    <td style="font-size: 12pt; height: 21px;">
                        <asp:Label ID="speciesCLabel" runat="server" Text='<%# Bind("speciesC") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12pt; width: 120px; background-color: powderblue;">
                        Section：</td>
                    <td style="font-size: 12pt; height: 21px;">
                        <asp:Label ID="sectionName" runat="server" Text='<%# Eval("sectionName") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12pt; width: 120px; background-color: powderblue;">
                        參考文獻：</td>
                    <td style="font-size: 12pt">
                        <asp:Label ID="referenceLabel" runat="server" Text='<%# Bind("reference") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12pt; width: 120px; background-color: powderblue;">
                        參考文獻連結：</td>
                    <td style="font-size: 12pt">
                        <asp:Label ID="referenceLinkLabel" runat="server" 
                            Text='<%# Bind("referenceLink") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12pt; width: 120px; background-color: powderblue;">
                        發表文獻：</td>
                    <td style="font-size: 12pt">
                        <asp:Label ID="protologueLabel" runat="server" Text='<%# Bind("protologue") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12pt; width: 120px; background-color: powderblue;">
                        發表文獻連結：</td>
                    <td style="font-size: 12pt">
                        <asp:Label ID="protologueLinkLabel" runat="server" 
                            Text='<%# Bind("protologueLink") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12pt; width: 120px; background-color: powderblue;">
                        備註：</td>
                    <td style="font-size: 12pt">
                        <asp:Label ID="noteLabel" runat="server" Text='<%# Bind("note") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12pt; width: 120px; background-color: powderblue;">
                        建檔者：</td>
                    <td style="font-size: 12pt">
                        <asp:Label ID="dataRecorderLabel" runat="server" 
                            Text='<%# Bind("dataRecorder") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12pt; width: 120px; background-color: powderblue;">
                        建檔日期：</td>
                    <td style="font-size: 12pt">
                        <asp:Label ID="recordDateLabel" runat="server" Text='<%# Bind("recordDate") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12pt; width: 120px; background-color: powderblue;">
                        訂正者：</td>
                    <td style="font-size: 12pt">
                        <asp:Label ID="reviewerLabel" runat="server" Text='<%# Bind("reviewer") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12pt; width: 120px; background-color: powderblue;">
                        訂正日期：</td>
                    <td style="font-size: 12pt">
                        <asp:Label ID="updateDateLabel" runat="server" Text='<%# Bind("updateDate") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12pt; width: 120px; background-color: powderblue;">
                        Continent：</td>
                    <td style="font-size: 12pt">
                        <asp:Label ID="continent" runat="server" Text='<%# Eval("continent") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12pt; width: 120px; background-color: powderblue;">
                        Distribution：</td>
                    <td style="font-size: 12pt">
                        <asp:Label ID="distribution" runat="server" Text='<%# Eval("distribution") %>'></asp:Label>
                    </td>
                </tr>
            </table>
            &nbsp;
        </ItemTemplate>
    </asp:FormView>
    &nbsp;<asp:Button ID="btnUpdate" runat="server" Text="編輯" />
    &nbsp;
    <asp:Button ID="btnInsert" runat="server" Text="新增" />
    &nbsp;
    <asp:Button ID="btnCancel" runat="server" Text="取消" />
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ScientificNameConnectionString %>" 
        SelectCommand="SELECT * FROM [species] WHERE ([genusID] = @genusID) ORDER BY [speciesE]">
        <SelectParameters>
            <asp:QueryStringParameter Name="genusID" QueryStringField="genusID" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ScientificNameConnectionString %>" 
        InsertCommand="INSERT INTO [species] ([genusID], [speciesE], [speciesC], [dataRecorder], [recordDate], [reference], [referenceLink], [protologue], [protologueLink], [note], [sectionName], [continent], [distribution]) VALUES (@genusID, @speciesE, @speciesC, @dataRecorder, @recordDate, @reference, @referenceLink, @protologue, @protologueLink, @note, @sectionName, @continent, @distribution)" 
        SelectCommand="SELECT * FROM [species] WHERE ([speciesID] = @speciesID)" 
        UpdateCommand="UPDATE [species] SET [speciesE] = @speciesE, [speciesC] = @speciesC, [reviewer] = @reviewer, [updateDate] =@updateDate, [reference] = @reference, [referenceLink] = @referenceLink, [protologue] = @protologue, [protologueLink] = @protologueLink, [note] = @note , [sectionName] = @sectionName, [continent] = @continent, [distribution] = @distribution WHERE [speciesID] = @speciesID">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="speciesID" 
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
            <asp:Parameter Name="sectionName" Type="String" />
            <asp:Parameter Name="continent" Type="String" />
            <asp:Parameter Name="distribution" Type="String" />
            <asp:Parameter Name="speciesID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="genusID" Type="Int32" />
            <asp:Parameter Name="speciesE" Type="String" />
            <asp:Parameter Name="speciesC" Type="String" />
            <asp:Parameter Name="dataRecorder" Type="String" />
            <asp:Parameter Name="recordDate" Type="DateTime" />
            <asp:Parameter Name="reference" Type="String" />
            <asp:Parameter Name="referenceLink" Type="String" />
            <asp:Parameter Name="protologue" Type="String" />
            <asp:Parameter Name="protologueLink" Type="String" />
            <asp:Parameter Name="note" Type="String" />
            <asp:Parameter Name="sectionName" Type="String" />
            <asp:Parameter Name="continent" Type="String" />
            <asp:Parameter Name="distribution" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>

