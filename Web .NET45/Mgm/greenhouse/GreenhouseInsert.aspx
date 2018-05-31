<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="GreenhouseInsert.aspx.vb" Inherits="Mgm_greenhouse_GreenhouseInsert" title="未命名頁面" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    &nbsp;<asp:FormView ID="FormView1" runat="server" DataKeyNames="potID" 
        DataSourceID="SDSGreenhouse" DefaultMode="Insert">
        <EditItemTemplate>
            植栽編號：<asp:Label ID="potIDLabel1" runat="server" Text='<%# Eval("potID") %>'></asp:Label>
            <br />
            <br />
            <table style="border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                border-bottom: 1px solid; width:500px">
                <tr>
                    <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        border-bottom: 1px solid;">
                    </td>
                    <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        border-bottom: 1px solid; background-color: lightcyan;">
                        採集資料 A (♂)</td>
                    <td style="width: 10px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        border-bottom: 1px solid;">
                        ×</td>
                    <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        border-bottom: 1px solid;">
                        採集資料 B (♀)
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        border-bottom: 1px solid;">
                        採集者</td>
                    <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        border-bottom: 1px solid; background-color: lightcyan;">
                        <asp:DropDownList ID="DDListCollectorA" runat="server" 
                            AppendDataBoundItems="True" DataSourceID="SDSCollector" 
                            DataTextField="nameLFC1" DataValueField="pid" 
                            SelectedValue='<%# Bind("collectorID_A") %>'>
                            <asp:ListItem Value="">請選擇</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td style="width: 10px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        border-bottom: 1px solid;">
                    </td>
                    <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        border-bottom: 1px solid;">
                        <asp:DropDownList ID="DDLCollectorB" runat="server" AppendDataBoundItems="True" 
                            DataSourceID="SDSCollector" DataTextField="nameLFC1" DataValueField="pid" 
                            SelectedValue='<%# Bind("collectorID_B") %>'>
                            <asp:ListItem Value="">請選擇</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        border-bottom: 1px solid;">
                        採集號一(數字)</td>
                    <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        border-bottom: 1px solid; background-color: lightcyan;">
                        <asp:TextBox ID="collectNumA1TextBox" runat="server" 
                            Text='<%# Bind("collectNumA1") %>'>
                        </asp:TextBox>
                    </td>
                    <td style="width: 10px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        border-bottom: 1px solid;">
                    </td>
                    <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        border-bottom: 1px solid;">
                        <asp:TextBox ID="collectNumB1TextBox" runat="server" 
                            Text='<%# Bind("collectNumB1") %>'>
                        </asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        border-bottom: 1px solid;">
                        採集號二(文字)</td>
                    <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        border-bottom: 1px solid; background-color: lightcyan;">
                        <asp:TextBox ID="collectNumA2TextBox" runat="server" 
                            Text='<%# Bind("collectNumA2") %>'>
                        </asp:TextBox>
                    </td>
                    <td style="width: 10px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        border-bottom: 1px solid;">
                    </td>
                    <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        border-bottom: 1px solid;">
                        <asp:TextBox ID="collectNumB2TextBox" runat="server" 
                            Text='<%# Bind("collectNumB2") %>'>
                        </asp:TextBox>
                    </td>
                </tr>
            </table>
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="儲存"></asp:LinkButton>
            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                CommandName="Cancel" Text="取消">
            </asp:LinkButton>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;
        </EditItemTemplate>
        <InsertItemTemplate>
            植栽編號：<asp:TextBox ID="potIDTextBox" runat="server" Text='<%# Bind("potID") %>'></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="potIDTextBox" ErrorMessage="請填入植栽編號"></asp:RequiredFieldValidator>
            &nbsp; &nbsp;<br />
            <br />
            <table style="border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                border-bottom: 1px solid">
                <tr>
                    <td style="border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        width: 100px; border-bottom: 1px solid">
                    </td>
                    <td style="border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        width: 125px; border-bottom: 1px solid; background-color: lightcyan">
                        採集資料 A (♂)</td>
                    <td style="border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        width: 10px; border-bottom: 1px solid">
                        ×</td>
                    <td style="border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        width: 125px; border-bottom: 1px solid">
                        採集資料 B (♀)
                    </td>
                </tr>
                <tr>
                    <td style="border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        width: 100px; border-bottom: 1px solid">
                        採集者</td>
                    <td style="border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        width: 125px; border-bottom: 1px solid; background-color: lightcyan">
                        <asp:DropDownList ID="DDListCollectorA0" runat="server" 
                            AppendDataBoundItems="True" DataSourceID="SDSCollector" 
                            DataTextField="nameLFC1" DataValueField="pid" 
                            SelectedValue='<%# Bind("collectorID_A") %>'>
                            <asp:ListItem Value="">請選擇</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td style="border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        width: 10px; border-bottom: 1px solid">
                    </td>
                    <td style="border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        width: 125px; border-bottom: 1px solid">
                        <asp:DropDownList ID="DDListCollectorB" runat="server" 
                            AppendDataBoundItems="True" DataSourceID="SDSCollector" 
                            DataTextField="nameLFC1" DataValueField="pid" 
                            SelectedValue='<%# Bind("collectorID_B") %>'>
                            <asp:ListItem Value="">請選擇</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        width: 100px; border-bottom: 1px solid">
                        採集號一(數字)</td>
                    <td style="border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        width: 125px; border-bottom: 1px solid; background-color: lightcyan">
                        <asp:TextBox ID="collectNumA1TextBox0" runat="server" 
                            Text='<%# Bind("collectNumA1") %>'>
                        </asp:TextBox>
                    </td>
                    <td style="border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        width: 10px; border-bottom: 1px solid">
                    </td>
                    <td style="border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        width: 125px; border-bottom: 1px solid">
                        <asp:TextBox ID="collectNumB1TextBox0" runat="server" 
                            Text='<%# Bind("collectNumB1") %>'>
                        </asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        width: 100px; border-bottom: 1px solid">
                        採集號二(文字)</td>
                    <td style="border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        width: 125px; border-bottom: 1px solid; background-color: lightcyan">
                        <asp:TextBox ID="collectNumA2TextBox0" runat="server" 
                            Text='<%# Bind("collectNumA2") %>'>
                        </asp:TextBox>
                    </td>
                    <td style="border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        width: 10px; border-bottom: 1px solid">
                    </td>
                    <td style="border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        width: 125px; border-bottom: 1px solid">
                        <asp:TextBox ID="collectNumB2TextBox0" runat="server" 
                            Text='<%# Bind("collectNumB2") %>'>
                        </asp:TextBox>
                    </td>
                </tr>
            </table>
            <asp:Button ID="btnCopy" runat="server" OnClick="btnCopy_Click" Text="複製" />
            使用複製功能時，請先複製輸入資料後，再儲存<br />
            <asp:Button ID="btnPaste" runat="server" OnClick="btnPaste_Click" Text="貼上" />
            貼上前，請先輸入植栽編號(POT-XXXXX)<br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="儲存"></asp:LinkButton>
            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                CommandName="Cancel" Text="取消">
            </asp:LinkButton>
            &nbsp;&nbsp;
        </InsertItemTemplate>
        <ItemTemplate>
            植栽編號：<asp:Label ID="potIDLabel2" runat="server" Text='<%# Eval("potID") %>'></asp:Label>
            <br />
            <br />
            <table style="border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                border-bottom: 1px solid">
                <tr>
                    <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        border-bottom: 1px solid;">
                    </td>
                    <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        border-bottom: 1px solid; background-color: lightcyan;">
                        採集資料 A (♂)</td>
                    <td style="width: 10px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        border-bottom: 1px solid;">
                        ×</td>
                    <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        border-bottom: 1px solid;">
                        採集資料 B (♀)
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        border-bottom: 1px solid;">
                        採集者</td>
                    <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        border-bottom: 1px solid; background-color: lightcyan;">
                        <asp:DropDownList ID="DDListCollectorA1" runat="server" 
                            AppendDataBoundItems="True" DataSourceID="SDSCollector" 
                            DataTextField="nameLFC1" DataValueField="pid" 
                            SelectedValue='<%# Eval("collectorID_A") %>'>
                            <asp:ListItem Value="">請選擇</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td style="width: 10px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        border-bottom: 1px solid;">
                    </td>
                    <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        border-bottom: 1px solid;">
                        <asp:DropDownList ID="DDLCollectorB0" runat="server" 
                            AppendDataBoundItems="True" DataSourceID="SDSCollector" 
                            DataTextField="nameLFC1" DataValueField="pid" 
                            SelectedValue='<%# Eval("collectorID_B") %>'>
                            <asp:ListItem Value="">請選擇</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        border-bottom: 1px solid;">
                        採集號一(數字)</td>
                    <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        border-bottom: 1px solid; background-color: lightcyan;">
                        <asp:Label ID="lblCollectNumA1" runat="server" 
                            Text='<%# Eval("collectNumA1") %>'></asp:Label>
                    </td>
                    <td style="width: 10px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        border-bottom: 1px solid;">
                    </td>
                    <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        border-bottom: 1px solid;">
                        <asp:Label ID="lblCollectNumB1" runat="server" 
                            Text='<%# Eval("collectNumB1") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        border-bottom: 1px solid;">
                        採集號二(文字)</td>
                    <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        border-bottom: 1px solid; background-color: lightcyan;">
                        <asp:Label ID="lblCollectNumA2" runat="server" 
                            Text='<%# Eval("collectNumA2") %>'></asp:Label>
                    </td>
                    <td style="width: 10px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        border-bottom: 1px solid;">
                    </td>
                    <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid;
                        border-bottom: 1px solid;">
                        <asp:Label ID="lblCollectNumB2" runat="server" 
                            Text='<%# Eval("collectNumB2") %>'></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="編輯">
            </asp:LinkButton>
            &nbsp;
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="新增">
            </asp:LinkButton>
            &nbsp;
        </ItemTemplate>
    </asp:FormView>
&nbsp;&nbsp;
    <br />
    <asp:SqlDataSource ID="SDSGreenhouse" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>" 
        DeleteCommand="DELETE FROM [greenhouse] WHERE [potID] = @potID" 
        InsertCommand="INSERT INTO [greenhouse] ([potID], [collectorID_A], [collectNumA1], [collectNumA2], [collectorID_B], [collectNumB1], [collectNumB2]) VALUES (@potID, @collectorID_A, @collectNumA1, @collectNumA2, @collectorID_B, @collectNumB1, @collectNumB2)" 
        SelectCommand="SELECT [potID], [areaID], [collectorID_A], [collectNumA1], [collectNumA2], [collectorID_B], [collectNumB1], [collectNumB2] FROM [greenhouse]" 
        UpdateCommand="UPDATE [greenhouse] SET [areaID] = @areaID, [collectorID_A] = @collectorID_A, [collectNumA1] = @collectNumA1, [collectNumA2] = @collectNumA2, [collectorID_B] = @collectorID_B, [collectNumB1] = @collectNumB1, [collectNumB2] = @collectNumB2 WHERE [potID] = @potID">
        <DeleteParameters>
            <asp:Parameter Name="potID" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="areaID" Type="Int32" />
            <asp:Parameter Name="collectorID_A" Type="Int32" />
            <asp:Parameter Name="collectNumA1" Type="Int32" />
            <asp:Parameter Name="collectNumA2" Type="String" />
            <asp:Parameter Name="collectorID_B" Type="Int32" />
            <asp:Parameter Name="collectNumB1" Type="Int32" />
            <asp:Parameter Name="collectNumB2" Type="String" />
            <asp:Parameter Name="potID" Type="String" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="potID" Type="String" />
            <asp:Parameter Name="collectorID_A" Type="Int32" />
            <asp:Parameter Name="collectNumA1" Type="Int32" />
            <asp:Parameter Name="collectNumA2" Type="String" />
            <asp:Parameter Name="collectorID_B" Type="Int32" />
            <asp:Parameter Name="collectNumB1" Type="Int32" />
            <asp:Parameter Name="collectNumB2" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDSCollector" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>" 
        SelectCommand="SELECT [pid], [nameLFC1], [Collector] FROM [vwPersonName] WHERE (collector = 1) ORDER BY [nameLFC1]">
    </asp:SqlDataSource>
    <br />
    <br />
    <br />
</asp:Content>

