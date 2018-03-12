<%@ Page Title="單位/機構 管理" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="institutionDetailM.aspx.vb" Inherits="Mgm_secure_institutionDetailM" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        body {
            font-size:medium;
            
        }
        .mgmDetail {

            width: 800px;
            border:1px;
            border-color:aqua;
            border-style:solid;
            padding:10px;
            margin:10px;
        }

        .mgmDetail tr {
            border:1px;
            border-color:aqua;
            border-style:solid;
            padding:5px;
            margin:5px;
            font-size:small;
        }

        .mgmTitle  {
            border-color:aliceblue;
            border:2px;
            border-style:solid;
            width:100px;
            background-color:aqua;
            }
        .mgmContent {

        }
        .textBoxDetail, .multiLineText, .ddlDetail {
            width:600px;           
            font-size:medium;
        }

         .multiLineText {
             height:60px;
         }
         
        


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:FormView ID="FormView1" runat="server" DataKeyNames="institutionID" DataSourceID="SqlDsInstitution" DefaultMode="Insert">
        <EditItemTemplate>
            <br />
            <table class="mgmDetail">
                <tr>
                    <td class="mgmTitle">單位縮寫</td>
                    <td><asp:TextBox ID="institutionAbbrTextBox" CssClass="textBoxDetail" runat="server" Text='<%# Bind("institutionAbbr") %>' /></td>
                </tr>
                <tr>
                    <td  class="mgmTitle">單位名（英）</td>
                    <td><asp:TextBox ID="institutionETextBox" cssClass="textBoxDetail"  runat="server" Text='<%# Bind("institutionE") %>' /></td>
                </tr>
                <tr>
                    <td class="mgmTitle">單位名（中）</td>
                    <td><asp:TextBox ID="institutionCTextBox" cssClass="textBoxDetail"  runat="server" Text='<%# Bind("institutionC") %>' /></td>
                </tr>                
                <tr>
                    <td class="mgmTitle">國家</td>
                    <td>                        
                         <asp:DropDownList ID="DropDownList1" runat="server"  DataSourceID="SqlDsCountry"
                            DataTextField="countryExpr"   DataValueField="country2Code" SelectedValue='<%# Bind("country2Code") %>'
                              AppendDataBoundItems="True" CssClass="ddlDetail" >
                            <asp:ListItem Selected="True" Value="">(none)</asp:ListItem>
                        </asp:DropDownList>

                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">網址</td>
                    <td><asp:TextBox ID="websiteTextBox" cssClass="textBoxDetail" runat="server" Text='<%# Bind("website") %>' /></td>
                </tr>
                <tr>
                    <td class="mgmTitle">備註</td>
                    <td><asp:TextBox ID="noteTextBox" runat="server" Text='<%# Bind("note") %>' TextMode="MultiLine"
                         CssClass="multiLineText" />

                    </td>
                </tr>
            </table>            
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
        </EditItemTemplate>

        <EmptyDataTemplate>
            <table class="mgmDetail">
                <tr>
                    <td class="mgmTitle">單位縮寫</td>
                    <td><asp:Label ID="institutionAbbrLabel" runat="server" Text='<%# Eval("institutionAbbr") %>' /></td>
                </tr>
                <tr>
                    <td class="mgmTitle">單位名（英）</td>
                    <td><asp:Label ID="institutionELabel" runat="server" Text='<%# Bind("institutionE")%>' /></td>
                </tr>
                <tr>
                    <td class="mgmTitle">單位名（中）</td>
                    <td><asp:Label ID="institutionCLabel" runat="server" Text='<%# Bind("institutionC") %>' /></td>
                </tr>                
                <tr>
                    <td class="mgmTitle">國家</td>
                    <td>
                        <asp:Label ID="country2CodeLabel" runat="server" Text='<%# Bind("country2Code") %>' />                        
                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">網址</td>
                    <td><asp:Label ID="websiteLabel" runat="server" Text='<%# Bind("website") %>' /></td>
                </tr>
                <tr>
                    <td class="mgmTitle">備註</td>
                    <td><asp:Label ID="noteLabel" runat="server" Text='<%# Bind("note") %>' /></td>
                </tr>
            </table>
            <br />
            &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" CommandName="Update">更新</asp:LinkButton>
            &nbsp;
            <asp:LinkButton ID="LinkButton2" runat="server" CommandName="New">新增</asp:LinkButton>
            <br />
            
        </EmptyDataTemplate>

        <InsertItemTemplate>
            <table class="mgmDetail">
                <br />
                <tr>
                    <td class="mgmTitle">單位縮寫</td>
                    <td><asp:TextBox ID="institutionAbbrTextBox" cssClass="textBoxDetail" runat="server" Text='<%# Bind("institutionAbbr") %>' /></td>
                </tr>
                <tr>
                    <td class="mgmTitle">單位名（英）</td>
                    <td><asp:TextBox ID="institutionETextBox" cssClass="textBoxDetail" runat="server" Text='<%# Bind("institutionE") %>' /></td>
                </tr>
                <tr>
                    <td class="mgmTitle">單位名（中）</td>
                    <td><asp:TextBox ID="institutionCTextBox" cssClass="textBoxDetail" runat="server" Text='<%# Bind("institutionC") %>' /></td>
                </tr>                
                <tr>
                    <td class="mgmTitle">國家</td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server"  DataSourceID="SqlDsCountry"
                            DataTextField="countryExpr" DataValueField="country2Code" SelectedValue='<%# Bind("country2Code") %>'
                             AppendDataBoundItems="True"  CssClass="ddlDetail" >
                            <asp:ListItem Selected="True" Value="">(none)</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">網址</td>
                    <td><asp:TextBox ID="websiteTextBox" cssClass="textBoxDetail" runat="server" Text='<%# Bind("website") %>' /></td>
                </tr>
                <tr>
                    <td class="mgmTitle">備註</td>
                    <td><asp:TextBox ID="noteTextBox" runat="server" Text='<%# Bind("note") %>' TextMode="MultiLine"
                         CssClass="multiLineText" />

                    </td>
                </tr>
            </table>
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="新增" />
            &nbsp;
            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
        </InsertItemTemplate>

        <ItemTemplate>
            
            
            <table class="mgmDetail">
                <tr>
                    <td class="mgmTitle">單位縮寫</td>
                    <td><asp:Label ID="institutionAbbrLabel" runat="server" Text='<%# Eval("institutionAbbr") %>' /></td>
                </tr>
                <tr>
                    <td class="mgmTitle">單位名（英）</td>
                    <td><asp:Label ID="institutionELabel" runat="server" Text='<%# Bind("institutionE")%>' /></td>
                </tr>
                <tr>
                    <td class="mgmTitle">單位名（中）</td>
                    <td><asp:Label ID="institutionCLabel" runat="server" Text='<%# Bind("institutionC") %>' /></td>
                </tr>                
                <tr>
                    <td class="mgmTitle">國家</td>
                    <td>
                        <asp:Label ID="country2CodeLabel" runat="server" Text='<%# Bind("country2Code") %>' />                        
                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">網址</td>
                    <td><asp:Label ID="websiteLabel" runat="server" Text='<%# Bind("website") %>' /></td>
                </tr>
                <tr>
                    <td class="mgmTitle">備註</td>
                    <td><asp:Label ID="noteLabel" runat="server" Text='<%# Bind("note") %>' /></td>
                </tr>
            </table>
            <br />
            &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" CommandName="Edit">編輯</asp:LinkButton>
            &nbsp;
            <asp:LinkButton ID="LinkButton2" runat="server" CommandName="New">新增</asp:LinkButton>
            <br />
            
           
        </ItemTemplate>
    </asp:FormView>
    <br />
    <asp:LinkButton ID="LinkButton3" runat="server" Enabled="False" Visible="False">新增單位地址</asp:LinkButton>
    
    <br />
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="AddressID" DataSourceID="SqlDSAddress">
        <Columns>
            <asp:BoundField DataField="AddressLine1" HeaderText="地址行一" SortExpression="AddressLine1" />
            <asp:BoundField DataField="AddressLine2" HeaderText="地址行二" SortExpression="AddressLine2" />
            <asp:BoundField DataField="City" HeaderText="市/區/鄉/鎮" SortExpression="City" />
            <asp:BoundField DataField="StateProvince" HeaderText="省/州/市" SortExpression="StateProvince" />
            <asp:BoundField DataField="PostalCode" HeaderText="Postal Code" SortExpression="PostalCode" />
            <asp:BoundField DataField="country2Code" HeaderText="國家" SortExpression="country2Code" />
        </Columns>
    </asp:GridView>
    
    <br /><br />
    <asp:HyperLink ID="HyperLink2" runat="server">HyperLink</asp:HyperLink>
&nbsp;<asp:SqlDataSource ID="SqlDsInstitution" runat="server" ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>"
         SelectCommand="SELECT * FROM [institution] WHERE ([institutionID] = @institutionID)"
         InsertCommand="INSERT INTO [institution] ([institutionAbbr], [institutionE], [institutionC], [note], [website], [country2Code]) VALUES (@institutionAbbr, @institutionE, @institutionC, @note, @website, @country2Code)"
         UpdateCommand="UPDATE [institution] SET [institutionAbbr] = @institutionAbbr, [institutionE] = @institutionE, [institutionC] = @institutionC, [note] = @note, [website] = @website, [country2Code] = @country2Code WHERE [institutionID] = @institutionID">
        
        <InsertParameters>
            <asp:Parameter Name="institutionAbbr" Type="String" />
            <asp:Parameter Name="institutionE" Type="String" />
            <asp:Parameter Name="institutionC" Type="String" />
            <asp:Parameter Name="note" Type="String" />
            <asp:Parameter Name="website" Type="String" />
            <asp:Parameter Name="country2Code" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="institutionID" QueryStringField="institutionID" Type="Int16" />
            
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="institutionID" Type="Int16" />
            <asp:Parameter Name="institutionE" Type="String" />
            <asp:Parameter Name="institutionC" Type="String" />
            <asp:Parameter Name="note" Type="String" />
            <asp:Parameter Name="website" Type="String" />
            <asp:Parameter Name="country2Code" Type="String" />
            <asp:Parameter Name="institutionAbbr" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>



    <asp:SqlDataSource ID="SqlDsCountry" runat="server" ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>"
         SelectCommand="SELECT country2Code, countryE, countryExpr FROM vwCountry ORDER BY countryE" >
    </asp:SqlDataSource>



   



    <asp:SqlDataSource ID="SqlDSAddress" runat="server" ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>" SelectCommand="SELECT [AddressID], [AddressLine1], [AddressLine2], [City], [StateProvince], [PostalCode], [ModifiedDate], [country2Code], [linkTable], [ownerID] FROM [Address] WHERE (([linkTable] = @linkTable) AND ([ownerID] = @ownerID))">
        <SelectParameters>
            <asp:Parameter DefaultValue="institution" Name="linkTable" Type="String" />
            <asp:QueryStringParameter Name="ownerID" QueryStringField="institutionID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>



   



</asp:Content>

