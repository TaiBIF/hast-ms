<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="GreenhouseDetailEdit.aspx.vb" Inherits="Mgm_greenhouse_GreenhouseDetail" title="未命名頁面" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <a href="javascript:history.go(-1)" title="回上一頁">回上一頁</a>
    <div>
        <br />
        <br />
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="potID" 
            DataSourceID="SDSGreenhouse" DefaultMode="Edit">
            <EditItemTemplate>
                植栽編號：<asp:Label ID="potIDLabel1" runat="server" Text='<%# Eval("potID") %>'></asp:Label>
                <br />
                溫室位置：<asp:DropDownList ID="DDListGhArea" runat="server" 
                    AppendDataBoundItems="True" DataSourceID="SDSGhArea" 
                    DataTextField="greenhouseArea" DataValueField="areaID" 
                    SelectedValue='<%# Bind("areaID") %>'>
                    <asp:ListItem Value="">請選擇</asp:ListItem>
                </asp:DropDownList>
                &nbsp; &nbsp;<br />
                移出：<asp:DropDownList ID="DDListRemoved" runat="server" 
                    AppendDataBoundItems="true" DataSourceID="SDSRemoved" DataTextField="removed" 
                    DataValueField="removeID" SelectedValue='<%# Bind("removeID") %>'>
                    <asp:ListItem Value="">請選擇</asp:ListItem>
                </asp:DropDownList>
                (移出請填寫備註欄，日期及原因)<br />
                <br />
                <table style="border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid">
                    <tr>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                        </td>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid; background-color: #e0ffff;">
                            採集資料 A (♂)</td>
                        <td style="width: 10px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                            ×</td>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                            採集資料 B (♀)
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                            採集者</td>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid; background-color: #e0ffff;">
                            <asp:DropDownList ID="DDListCollectorA" runat="server" 
                                AppendDataBoundItems="True" DataSourceID="SDSCollector" 
                                DataTextField="nameLFC1" DataValueField="pid" 
                                SelectedValue='<%# Bind("collectorID_A") %>'>
                                <asp:ListItem Value="">請選擇</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td style="width: 10px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                        </td>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                            <asp:DropDownList ID="DDLCollectorB" runat="server" AppendDataBoundItems="True" 
                                DataSourceID="SDSCollector" DataTextField="nameLFC1" DataValueField="pid" 
                                SelectedValue='<%# Bind("collectorID_B") %>'>
                                <asp:ListItem Value="">請選擇</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                            採集號一(數字)</td>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid; background-color: #e0ffff;">
                            <asp:TextBox ID="collectNumA1TextBox" runat="server" 
                                Text='<%# Bind("collectNumA1") %>'>
                            </asp:TextBox>
                        </td>
                        <td style="width: 10px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                        </td>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                            <asp:TextBox ID="collectNumB1TextBox" runat="server" 
                                Text='<%# Bind("collectNumB1") %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                            採集號二(文字)</td>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid; background-color: #e0ffff;">
                            <asp:TextBox ID="collectNumA2TextBox" runat="server" 
                                Text='<%# Bind("collectNumA2") %>'>
                            </asp:TextBox>
                        </td>
                        <td style="width: 10px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                        </td>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                            <asp:TextBox ID="collectNumB2TextBox" runat="server" 
                                Text='<%# Bind("collectNumB2") %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                            HAST ID</td>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid; background-color: #e0ffff;">
                            <asp:TextBox ID="hastSNATextBox" runat="server" Text='<%# Bind("hastSNA") %>'>
                            </asp:TextBox>
                        </td>
                        <td style="width: 10px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                        </td>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                            <asp:TextBox ID="hastSNBTextBox" runat="server" Text='<%# Bind("hastSNB") %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                        </td>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid; background-color: #e0ffff;">
                            <asp:HyperLink ID="HyperLink1" runat="server" 
                                NavigateUrl='<%# "~/Specimens/specimenListC.aspx?collectorID=" & Eval("collectorID_A") & "&collectionNum=" & Eval("collectNumA1") %>' 
                                Target="_blank" Text="查詢採集資料A" Width="112px"></asp:HyperLink>
                        </td>
                        <td style="width: 10px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                        </td>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                            <asp:HyperLink ID="HyperLink2" runat="server" 
                                NavigateUrl='<%# "~/Specimens/specimenListC.aspx?collectorID=" & Eval("collectorID_B") & "&collectionNum=" & Eval("collectNumB1") %>' 
                                Target="_blank" Text="查詢採集資料B" Width="112px"></asp:HyperLink>
                        </td>
                    </tr>
                </table>
                來源：<asp:TextBox ID="sourceTextBox" runat="server" Text='<%# Bind("source") %>'>
                </asp:TextBox>
                <br />
                DNA 實驗編號： 
                <asp:TextBox ID="DNAExpTextBox" runat="server" Text='<%# Bind("DNAExp") %>'>
                </asp:TextBox>
                <br />
                染色體數： 
                <asp:TextBox ID="chromosomeTextBox" runat="server" 
                    Text='<%# Bind("chromosome") %>'>
                </asp:TextBox>
                <br />
                備註： &nbsp;<asp:TextBox ID="TextBox1" runat="server" Columns="3" 
                    Text='<%# Bind("note") %>' TextMode="MultiLine" Width="320px"></asp:TextBox>
                <br />
                <br />
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
                <br />
                溫室位置：<asp:DropDownList ID="DDListGhArea0" runat="server" 
                    AppendDataBoundItems="True" DataSourceID="SDSGhArea" 
                    DataTextField="greenhouseArea" DataValueField="areaID" 
                    SelectedValue='<%# Bind("areaID") %>'>
                    <asp:ListItem Value="">請選擇</asp:ListItem>
                </asp:DropDownList>
                &nbsp; &nbsp;<br />
                移出：<asp:DropDownList ID="DDListRemoved0" runat="server" 
                    AppendDataBoundItems="true" DataSourceID="SDSRemoved" DataTextField="removed" 
                    DataValueField="removeID" SelectedValue='<%# Bind("removeID") %>'>
                    <asp:ListItem Value="">請選擇</asp:ListItem>
                </asp:DropDownList>
                (移出請填寫備註欄，日期及原因)<br />
                <br />
                <table style="border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid">
                    <tr>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                        </td>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid; background-color: #e0ffff;">
                            採集資料 A (♂)</td>
                        <td style="width: 10px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                            ×</td>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                            採集資料 B (♀)
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                            採集者</td>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid; background-color: #e0ffff;">
                            <asp:DropDownList ID="DDListCollectorA0" runat="server" 
                                AppendDataBoundItems="True" DataSourceID="SDSCollector" 
                                DataTextField="nameLFC1" DataValueField="pid" 
                                SelectedValue='<%# Bind("collectorID_A") %>'>
                                <asp:ListItem Value="">請選擇</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td style="width: 10px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                        </td>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                            <asp:DropDownList ID="DDLCollectorB0" runat="server" 
                                AppendDataBoundItems="True" DataSourceID="SDSCollector" 
                                DataTextField="nameLFC1" DataValueField="pid" 
                                SelectedValue='<%# Bind("collectorID_B") %>'>
                                <asp:ListItem Value="">請選擇</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                            採集號一(數字)</td>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid; background-color: #e0ffff;">
                            <asp:TextBox ID="collectNumA1TextBox0" runat="server" 
                                Text='<%# Bind("collectNumA1") %>'>
                            </asp:TextBox>
                        </td>
                        <td style="width: 10px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                        </td>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                            <asp:TextBox ID="collectNumB1TextBox0" runat="server" 
                                Text='<%# Bind("collectNumB1") %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                            採集號二(文字)</td>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid; background-color: #e0ffff;">
                            <asp:TextBox ID="collectNumA2TextBox0" runat="server" 
                                Text='<%# Bind("collectNumA2") %>'>
                            </asp:TextBox>
                        </td>
                        <td style="width: 10px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                        </td>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                            <asp:TextBox ID="collectNumB2TextBox0" runat="server" 
                                Text='<%# Bind("collectNumB2") %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                            HAST ID</td>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid; background-color: #e0ffff;">
                            <asp:TextBox ID="hastSNATextBox0" runat="server" Text='<%# Bind("hastSNA") %>'>
                            </asp:TextBox>
                        </td>
                        <td style="width: 10px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                        </td>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                            <asp:TextBox ID="hastSNBTextBox0" runat="server" Text='<%# Bind("hastSNB") %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                        </td>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid; background-color: #e0ffff;">
                            <asp:HyperLink ID="HyperLink3" runat="server" 
                                NavigateUrl='<%# "../FieldDataTmp.aspx?hCID=" & Eval("collectorID_A") & "&hCNum1=" & Eval("collectNumA1") %>' 
                                Target="_blank" Text="查詢採集資料A" Width="112px"></asp:HyperLink>
                        </td>
                        <td style="width: 10px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                        </td>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                        </td>
                    </tr>
                </table>
                來源：<asp:TextBox ID="sourceTextBox0" runat="server" Text='<%# Bind("source") %>'>
                </asp:TextBox>
                <br />
                DNA 實驗編號： 
                <asp:TextBox ID="DNAExpTextBox0" runat="server" Text='<%# Bind("DNAExp") %>'>
                </asp:TextBox>
                <br />
                染色體數： 
                <asp:TextBox ID="chromosomeTextBox0" runat="server" 
                    Text='<%# Bind("chromosome") %>'>
                </asp:TextBox>
                <br />
                備註： &nbsp;<asp:TextBox ID="TextBox2" runat="server" Columns="3" 
                    Text='<%# Bind("note") %>' TextMode="MultiLine" Width="320px"></asp:TextBox>
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="儲存"></asp:LinkButton>
                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                    CommandName="Cancel" Text="取消">
                </asp:LinkButton>
            </InsertItemTemplate>
            <ItemTemplate>
                植栽編號：<asp:Label ID="potIDLabel2" runat="server" Text='<%# Eval("potID") %>'></asp:Label>
                <br />
                溫室位置：<asp:DropDownList ID="DDListGhArea1" runat="server" 
                    AppendDataBoundItems="True" DataSourceID="SDSGhArea" 
                    DataTextField="greenhouseArea" DataValueField="areaID" 
                    SelectedValue='<%# Eval("areaID") %>'>
                    <asp:ListItem Value="">請選擇</asp:ListItem>
                </asp:DropDownList>
                &nbsp; &nbsp;<br />
                移出：<asp:DropDownList ID="DDListRemoved1" runat="server" 
                    AppendDataBoundItems="True" DataSourceID="SDSRemoved" DataTextField="removed" 
                    DataValueField="removeID" SelectedValue='<%# Eval("removeID") %>'>
                    <asp:ListItem Value="">請選擇</asp:ListItem>
                </asp:DropDownList>
                (移出請填寫備註欄，日期及原因)<br />
                <br />
                <table style="border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid">
                    <tr>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                        </td>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid; background-color: #e0ffff;">
                            採集資料 A (♂)</td>
                        <td style="width: 10px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                            ×</td>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                            採集資料 B (♀)
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                            採集者</td>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid; background-color: #e0ffff;">
                            <asp:DropDownList ID="DDListCollectorA1" runat="server" 
                                AppendDataBoundItems="True" DataSourceID="SDSCollector" 
                                DataTextField="nameLFC1" DataValueField="pid" 
                                SelectedValue='<%# Eval("collectorID_A") %>'>
                                <asp:ListItem Value="">請選擇</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td style="width: 10px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                        </td>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                            <asp:DropDownList ID="DDLCollectorB1" runat="server" 
                                AppendDataBoundItems="True" DataSourceID="SDSCollector" 
                                DataTextField="nameLFC1" DataValueField="pid" 
                                SelectedValue='<%# Eval("collectorID_B") %>'>
                                <asp:ListItem Value="">請選擇</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                            採集號一(數字)</td>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid; background-color: #e0ffff;">
                            <asp:Label ID="lblCollectNumA1" runat="server" 
                                Text='<%# Eval("collectNumA1") %>'></asp:Label>
                        </td>
                        <td style="width: 10px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                        </td>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                            <asp:Label ID="lblCollectNumB1" runat="server" 
                                Text='<%# Eval("collectNumB1") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                            採集號二(文字)</td>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid; background-color: #e0ffff;">
                            <asp:Label ID="lblCollectNumA2" runat="server" 
                                Text='<%# Eval("collectNumA2") %>'></asp:Label>
                        </td>
                        <td style="width: 10px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                        </td>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                            <asp:Label ID="lblCollectNumB2" runat="server" 
                                Text='<%# Eval("collectNumB2") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                            HAST ID</td>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid; background-color: #e0ffff;">
                            <asp:Label ID="lblHastSNA" runat="server" Text='<%# Eval("hastSNA") %>'></asp:Label>
                        </td>
                        <td style="width: 10px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                        </td>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                            <asp:Label ID="lblHastSNB" runat="server" Text='<%# Eval("hastSNB") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                        </td>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid; background-color: #e0ffff;">
                        </td>
                        <td style="width: 10px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                        </td>
                        <td style="width: 100px; border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid;">
                        </td>
                    </tr>
                </table>
                來源： 
                <asp:Label ID="lblSource" runat="server" Text='<%# Eval("source") %>'></asp:Label>
                <br />
                DNA 實驗編號：&nbsp;
                <asp:Label ID="lblNAExp" runat="server" Text='<%# Eval("DNAExp") %>'></asp:Label>
                <br />
                染色體數：&nbsp;
                <asp:Label ID="lblChormosome" runat="server" Text='<%# Eval("chromosome") %>'></asp:Label>
                <br />
                備註： &nbsp;<asp:Label ID="lblNote" runat="server" Text='<%# Eval("note") %>'></asp:Label>
                <br />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                    CommandName="Edit" Text="編輯">
                </asp:LinkButton>
                &nbsp;
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                    CommandName="New" Text="新增">
                </asp:LinkButton>
            </ItemTemplate>
        </asp:FormView>
        &nbsp;
        <br />
        <hr />
        詳細採集資料<br />
        <asp:FormView ID="FormView2" runat="server" DataSourceID="SDSGhDetail">
            <ItemTemplate>
                potID:
                <asp:Label ID="potIDLabel" runat="server" Text='<%# Bind("potID") %>'></asp:Label>
                <br />
                原填入資料：<asp:Label ID="Label3" runat="server" Text='<%# Eval("originalData") %>'></asp:Label>
                <br />
                <table border="1" cellpadding="4" cellspacing="1" 
                    style="font-size: 12pt; width: 1000px">
                    <tr>
                        <td align="center" style="width: 40px">
                        </td>
                        <td align="center" style="width: 50px">
                            HAST SN</td>
                        <td align="center" style="width: 100px; height: 29px;">
                            採集號</td>
                        <td align="center" style="width: 100px; height: 29px;">
                            採集日期</td>
                        <td align="center" style="width: 100px; height: 29px;">
                            科</td>
                        <td align="center" style="width: 100px; height: 29px;">
                            屬</td>
                        <td align="center" style="width: 100px; height: 29px;">
                            學名</td>
                        <td align="center" style="width: 122px; height: 29px;">
                            採集地</td>
                    </tr>
                    <tr>
                        <td style="width: 40px">
                            採集資料A</td>
                        <td style="width: 50px">
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("hastSNA") %>'></asp:Label>
                        </td>
                        <td style="width: 100px">
                            <asp:Label ID="collectionNumALabel" runat="server" 
                                Text='<%# Bind("collectionNumA") %>'></asp:Label>
                        </td>
                        <td style="width: 100px">
                            <asp:Label ID="CDateALabel" runat="server" 
                                Text='<%# Bind("CDateA", "{0:d}") %>'></asp:Label>
                        </td>
                        <td style="width: 100px">
                            <asp:Label ID="verFamilyEALabel" runat="server" 
                                Text='<%# Bind("verFamilyEA") %>'></asp:Label>
                        </td>
                        <td style="width: 100px">
                            <asp:Label ID="verGenusEALabel" runat="server" Text='<%# Bind("verGenusEA") %>'></asp:Label>
                        </td>
                        <td style="width: 100px">
                            <asp:Label ID="verSpeciesEALabel" runat="server" 
                                Text='<%# Bind("verSpeciesEA") %>'></asp:Label>
                            <asp:Label ID="verSpeciesCALabel" runat="server" 
                                Text='<%# Bind("verSpeciesCA") %>'></asp:Label>
                        </td>
                        <td style="width: 122px">
                            <asp:Label ID="countryALabel" runat="server" Text='<%# Bind("countryA") %>'></asp:Label>
                            &nbsp;<asp:Label ID="provinceEALabel" runat="server" 
                                Text='<%# Bind("provinceEA") %>'></asp:Label>
                            <asp:Label ID="provinceCALabel" runat="server" Text='<%# Bind("provinceCA") %>'></asp:Label>
                            <asp:Label ID="hsienCityEALabel" runat="server" 
                                Text='<%# Bind("hsienCityEA") %>'></asp:Label>
                            <asp:Label ID="hsienCityCALabel" runat="server" 
                                Text='<%# Bind("hsienCityCA") %>'></asp:Label>
                            <asp:Label ID="hsiangTownEALabel" runat="server" 
                                Text='<%# Bind("hsiangTownEA") %>'></asp:Label>
                            <asp:Label ID="hsiangTownCALabel" runat="server" 
                                Text='<%# Bind("hsiangTownCA") %>'></asp:Label>
                            <asp:Label ID="parkEALabel" runat="server" Text='<%# Bind("parkEA") %>'></asp:Label>
                            <asp:Label ID="parkCALabel" runat="server" Text='<%# Bind("parkCA") %>'></asp:Label>
                            <asp:Label ID="additionalDescALabel" runat="server" 
                                Text='<%# Bind("additionalDescA") %>'></asp:Label>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 40px">
                            採集資料B</td>
                        <td style="width: 50px">
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("hastSNB") %>'></asp:Label>
                        </td>
                        <td style="width: 100px">
                            <asp:Label ID="collectionNumBLabel" runat="server" 
                                Text='<%# Bind("collectionNumB") %>'></asp:Label>
                        </td>
                        <td style="width: 100px">
                            <asp:Label ID="CDateBLabel" runat="server" 
                                Text='<%# Bind("CDateB", "{0:d}") %>'></asp:Label>
                        </td>
                        <td style="width: 100px">
                            <asp:Label ID="verFamilyEBLabel" runat="server" 
                                Text='<%# Bind("verFamilyEB") %>'></asp:Label>
                        </td>
                        <td style="width: 100px">
                            <asp:Label ID="verGenusEBLabel" runat="server" Text='<%# Bind("verGenusEB") %>'></asp:Label>
                        </td>
                        <td style="width: 100px">
                            <asp:Label ID="verSpeciesEBLabel" runat="server" 
                                Text='<%# Bind("verSpeciesEB") %>'></asp:Label>
                            <asp:Label ID="verSpeciesCBLabel" runat="server" 
                                Text='<%# Bind("verSpeciesCB") %>'></asp:Label>
                        </td>
                        <td style="width: 122px">
                            <asp:Label ID="countryBLabel" runat="server" Text='<%# Bind("countryB") %>'></asp:Label>
                            <asp:Label ID="provinceEBLabel" runat="server" Text='<%# Bind("provinceEB") %>'></asp:Label>
                            <asp:Label ID="provinceCBLabel" runat="server" Text='<%# Bind("provinceCB") %>'></asp:Label>
                            <asp:Label ID="hsienCityEBLabel" runat="server" 
                                Text='<%# Bind("hsienCityEB") %>'></asp:Label>
                            <asp:Label ID="hsienCityCBLabel" runat="server" 
                                Text='<%# Bind("hsienCityCB") %>'></asp:Label>
                            <asp:Label ID="hsiangTownEBLabel" runat="server" 
                                Text='<%# Bind("hsiangTownEB") %>'></asp:Label>
                            <asp:Label ID="hsiangTownCBLabel" runat="server" 
                                Text='<%# Bind("hsiangTownCB") %>'></asp:Label>
                            <asp:Label ID="parkEBLabel" runat="server" Text='<%# Bind("parkEB") %>'></asp:Label>
                            <asp:Label ID="parkCBLabel" runat="server" Text='<%# Bind("parkCB") %>'></asp:Label>
                            <asp:Label ID="additionalDescBLabel" runat="server" 
                                Text='<%# Bind("additionalDescB") %>'></asp:Label>
                            <br />
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:FormView>
        &nbsp; &nbsp;<br />
        <br />
        <asp:SqlDataSource ID="SDSGreenhouse" runat="server" 
            ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>" 
            DeleteCommand="DELETE FROM [greenhouse] WHERE [potID] = @potID" 
            InsertCommand="INSERT INTO [greenhouse] ([potID], [areaID], [hastSNA], [collectorID_A], [collectNumA1], [collectNumA2], [hastSNB], [collectorID_B], [collectNumB1], [collectNumB2], [removeID], [DNAExp], [chromosome], [source], [note]) VALUES (@potID, @areaID, @hastSNA, @collectorID_A, @collectNumA1, @collectNumA2, @hastSNB, @collectorID_B, @collectNumB1, @collectNumB2, @removeID, @DNAExp, @chromosome, @source, @note)" 
            SelectCommand="SELECT [potID], [areaID], [hastSNA], [collectorID_A], [collectNumA1], [collectNumA2], [hastSNB], [collectorID_B], [collectNumB1], [collectNumB2], [removeID], [DNAExp], [chromosome], [source], [note] FROM [greenhouse] WHERE ([potID] = @potID)" 
            UpdateCommand="UPDATE [greenhouse] SET [areaID] = @areaID, [hastSNA] = @hastSNA, [collectorID_A] = @collectorID_A, [collectNumA1] = @collectNumA1, [collectNumA2] = @collectNumA2, [hastSNB] = @hastSNB, [collectorID_B] = @collectorID_B, [collectNumB1] = @collectNumB1, [collectNumB2] = @collectNumB2, [removeID] = @removeID, [DNAExp] = @DNAExp, [chromosome] = @chromosome, [source] = @source, [note] = @note WHERE [potID] = @potID">
            <SelectParameters>
                <asp:QueryStringParameter Name="potID" QueryStringField="potID" Type="String" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="potID" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="areaID" Type="Int32" />
                <asp:Parameter Name="hastSNA" Type="Int32" />
                <asp:Parameter Name="collectorID_A" Type="Int32" />
                <asp:Parameter Name="collectNumA1" Type="Int32" />
                <asp:Parameter Name="collectNumA2" Type="String" />
                <asp:Parameter Name="hastSNB" Type="Int32" />
                <asp:Parameter Name="collectorID_B" Type="Int32" />
                <asp:Parameter Name="collectNumB1" Type="Int32" />
                <asp:Parameter Name="collectNumB2" Type="String" />
                <asp:Parameter Name="removeID" Type="Int32" />
                <asp:Parameter Name="DNAExp" Type="String" />
                <asp:Parameter Name="chromosome" Type="String" />
                <asp:Parameter Name="source" Type="String" />
                <asp:Parameter Name="note" Type="String" />
                <asp:Parameter Name="potID" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="potID" Type="String" />
                <asp:Parameter Name="areaID" Type="Int32" />
                <asp:Parameter Name="hastSNA" Type="Int32" />
                <asp:Parameter Name="collectorID_A" Type="Int32" />
                <asp:Parameter Name="collectNumA1" Type="Int32" />
                <asp:Parameter Name="collectNumA2" Type="String" />
                <asp:Parameter Name="hastSNB" Type="Int32" />
                <asp:Parameter Name="collectorID_B" Type="Int32" />
                <asp:Parameter Name="collectNumB1" Type="Int32" />
                <asp:Parameter Name="collectNumB2" Type="String" />
                <asp:Parameter Name="removeID" Type="Int32" />
                <asp:Parameter Name="DNAExp" Type="String" />
                <asp:Parameter Name="chromosome" Type="String" />
                <asp:Parameter Name="source" Type="String" />
                <asp:Parameter Name="note" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
    </div>
    <asp:SqlDataSource ID="SDSCollector" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>" 
        SelectCommand="SELECT [pid], [nameLFC1], [Collector] FROM [vwPersonName] ORDER BY [nameLFC1]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDSGhArea" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>" 
        SelectCommand="SELECT [areaID], [greenhouseArea] FROM [greenhouseArea] ORDER BY [greenhouseArea]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDSGhDetail" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>" 
        SelectCommand="SELECT [potID], [hastSNA], [collectionNumA], [CDateA], [hastSNB], [collectionNumB], [CDateB], [verFamilyEA], [verGenusEA], [verSpeciesEA], [verSpeciesCA], [countryA], [provinceEA], [provinceCA], [hsienCityEA], [hsienCityCA], [hsiangTownEA], [hsiangTownCA], [parkEA], [parkCA], [additionalDescA], [verFamilyEB], [verGenusEB], [verSpeciesEB], [verSpeciesCB], [countryB], [provinceEB], [provinceCB], [hsienCityEB], [hsienCityCB], [hsiangTownEB], [hsiangTownCB], [parkEB], [parkCB], [additionalDescB], [originalData] FROM [vwGreenhouseDetail] WHERE ([potID] = @potID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="potID" QueryStringField="potID" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDSRemoved" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>" 
        SelectCommand="SELECT [removeID], [removed] FROM [removed] ORDER BY [removeID]">
    </asp:SqlDataSource>
</asp:Content>

