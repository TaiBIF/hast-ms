<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="addressM.aspx.vb" Inherits="Mgm_secure_addressM" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    &nbsp;&nbsp;
    
    <br />
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="AddressID" DataSourceID="SQLDSAddress" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
        <EditItemTemplate>
            <table class="mgmDetail">
                <tr>
                    <td class="mgmTitle"></td>
                    <td>
                        <asp:Label ID="AddressIDLabel1" runat="server" Text='<%# Eval("AddressID") %>'  CssClass="textBoxDetail" />
                    </td>
                </tr>
                <tr>
                    <td  class="mgmTitle">地址行一</td>
                    <td>
                        <asp:TextBox ID="AddressLine1TextBox" runat="server" Text='<%# Bind("AddressLine1") %>'   CssClass="textBoxDetail" />
                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">地址行二</td>
                    <td>
                        <asp:TextBox ID="AddressLine2TextBox" runat="server" Text='<%# Bind("AddressLine2") %>'   CssClass="textBoxDetail" />
                    </td>
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
                    <td class="mgmTitle">市/區/鄉/鎮</td>
                    <td>
                        <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>'   CssClass="textBoxDetail" />
                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">州/省/市</td>
                    <td>
                        <asp:TextBox ID="StateProvinceTextBox" runat="server" Text='<%# Bind("StateProvince") %>'   CssClass="textBoxDetail" />
                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">郵遞區號</td>
                    <td>
                        <asp:TextBox ID="PostalCodeTextBox" runat="server" Text='<%# Bind("PostalCode") %>'   CssClass="textBoxDetail" />
                    </td>
                </tr>
            </table> 
            
            
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
        </EditItemTemplate>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <InsertItemTemplate>
            <table class="mgmDetail">
                
                <tr>
                    <td  class="mgmTitle">地址行一</td>
                    <td>
                        <asp:TextBox ID="AddressLine1TextBox" runat="server" Text='<%# Bind("AddressLine1") %>'   CssClass="textBoxDetail" />
                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">地址行二</td>
                    <td>
                        <asp:TextBox ID="AddressLine2TextBox" runat="server" Text='<%# Bind("AddressLine2") %>'   CssClass="textBoxDetail" />
                    </td>
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
                    <td class="mgmTitle">市/區/鄉/鎮</td>
                    <td>
                        <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>'   CssClass="textBoxDetail" />
                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">州/省/市</td>
                    <td>
                        <asp:TextBox ID="StateProvinceTextBox" runat="server" Text='<%# Bind("StateProvince") %>'   CssClass="textBoxDetail" />
                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">郵遞區號</td>
                    <td>
                        <asp:TextBox ID="PostalCodeTextBox" runat="server" Text='<%# Bind("PostalCode") %>'   CssClass="textBoxDetail" />
                    </td>
                </tr>
            </table>
            <br />
           
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="新增" OnClick="InsertButton_Click" />
            &nbsp;
            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" /> 
        </InsertItemTemplate>
        <ItemTemplate>
            <table class="mgmDetail">
                <tr>
                    <td class="mgmTitle"></td>
                    <td>
                        <asp:Label ID="AddressIDLabel" runat="server" Text='<%# Eval("AddressID") %>' />
                    </td>
                </tr>
                <tr>
                    <td  class="mgmTitle">地址行一</td>
                    <td>
                        <asp:Label ID="AddressLine1Label" runat="server" Text='<%# Bind("AddressLine1")%>' />
                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">地址行二</td>
                    <td>
                        <asp:Label ID="AddressLine2Label" runat="server" Text='<%# Bind("AddressLine2") %>'   CssClass="textBoxDetail" />
                    </td>
                </tr>                
                <tr>
                    <td class="mgmTitle">國家</td>
                    <td>                        
                         <asp:Label ID="country2CodeLabel" runat="server" Text='<%# Bind("country2Code") %>' />

                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">市/區/鄉/鎮</td>
                    <td>
                        <asp:Label ID="CityLabel" runat="server" Text='<%# Bind("City") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">州/省/市</td>
                    <td>
                        <asp:Label ID="StateProvinceLabel" runat="server" Text='<%# Bind("StateProvince") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">郵遞區號</td>
                    <td>
                        <asp:Label ID="PostalCodeLabel" runat="server" Text='<%# Bind("PostalCode") %>' />
                    </td>
                </tr>
            </table> 
            
            
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯" />
            
        </ItemTemplate>
        <EditRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <EmptyDataTemplate>
             <table class="mgmDetail">
                <tr>
                    <td class="mgmTitle"></td>
                    <td>
                        <asp:Label ID="AddressIDLabel" runat="server" Text='<%# Eval("AddressID") %>' />
                    </td>
                </tr>
                <tr>
                    <td  class="mgmTitle">地址行一</td>
                    <td>
                        <asp:Label ID="AddressLine1Label" runat="server" Text='<%# Bind("AddressLine1")%>' />
                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">地址行二</td>
                    <td>
                        <asp:Label ID="AddressLine2Label" runat="server" Text='<%# Bind("AddressLine2") %>'   CssClass="textBoxDetail" />
                    </td>
                </tr>                
                <tr>
                    <td class="mgmTitle">國家</td>
                    <td>                        
                         <asp:Label ID="country2CodeLabel" runat="server" Text='<%# Bind("country2Code") %>' />

                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">市/區/鄉/鎮</td>
                    <td>
                        <asp:Label ID="CityLabel" runat="server" Text='<%# Bind("City") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">州/省/市</td>
                    <td>
                        <asp:Label ID="StateProvinceLabel" runat="server" Text='<%# Bind("StateProvince") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">郵遞區號</td>
                    <td>
                        <asp:Label ID="PostalCodeLabel" runat="server" Text='<%# Bind("PostalCode") %>' />
                    </td>
                </tr>
            </table> 
        </EmptyDataTemplate>

        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />

    </asp:FormView>
    <br />
    <asp:HyperLink ID="HyperLink2" runat="server">回上頁</asp:HyperLink>
    &nbsp;<asp:SqlDataSource ID="SQLDSAddress" runat="server" ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>"
        InsertCommand="INSERT INTO [Address] ([AddressLine1], [AddressLine2], [City], [StateProvince], [PostalCode], [country2Code]
                ,ownerID , linkTable)
         VALUES (@AddressLine1, @AddressLine2, @City, @StateProvince, @PostalCode, @country2Code, @ownerID, @linkTable)"
         SelectCommand="SELECT [AddressID], [AddressLine1], [AddressLine2], [City], [StateProvince], [PostalCode], [country2Code] FROM [Address] WHERE ([AddressID] = @AddressID)"
         UpdateCommand="UPDATE [Address] SET [AddressLine1] = @AddressLine1, [AddressLine2] = @AddressLine2, [City] = @City, [StateProvince] = @StateProvince, [PostalCode] = @PostalCode, [country2Code] = @country2Code WHERE [AddressID] = @AddressID" DeleteCommand="DELETE FROM [Address] WHERE [AddressID] = @AddressID">
       
       
        <InsertParameters>
            <asp:Parameter Name="AddressLine1" Type="String" />
            <asp:Parameter Name="AddressLine2" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="StateProvince" Type="String" />
            <asp:Parameter Name="PostalCode" Type="String" />
            <asp:Parameter Name="country2Code" Type="String" />
            <asp:QueryStringParameter Name="ownerID" QueryStringField="ownerID" Type="Int32" />
            <asp:QueryStringParameter Name="linkTable" QueryStringField="linkTable" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="AddressID" QueryStringField="AddressID" Type="Int32" />
            <asp:QueryStringParameter Name="ownerID" QueryStringField="ownerID" Type="Int32" />
            <asp:QueryStringParameter Name="linkTable" QueryStringField="linkTable" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="AddressLine1" Type="String" />
            <asp:Parameter Name="AddressLine2" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="StateProvince" Type="String" />
            <asp:Parameter Name="PostalCode" Type="String" />
            <asp:Parameter Name="country2Code" Type="String" />
            <asp:Parameter Name="AddressID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDsCountry" runat="server" ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>"
         SelectCommand="SELECT country2Code, countryE, countryExpr FROM vwCountry ORDER BY countryE" >
    </asp:SqlDataSource>

    </asp:Content>

