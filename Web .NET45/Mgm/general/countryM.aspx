<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="countryM.aspx.vb" Inherits="Mgm_general_countryM" title="國名管理" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    
    <br />
    國名列表
    
     
     
    <br />
    （新增請任選一個國名，再點選下方表單中的 [新增] 選項）
    
     
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" DataKeyNames="countryNo" DataSourceID="SqlDataSource1" 
        GridLines="Horizontal">
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="country" HeaderText="國名" SortExpression="country" />
            <asp:BoundField DataField="countryC" HeaderText="中文國名" 
                SortExpression="countryC" />
        </Columns>
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <AlternatingRowStyle BackColor="#F7F7F7" />
    </asp:GridView>
    <br />
    <br />
    <asp:FormView ID="FormView1" runat="server" DataSourceID="SDSCountry" 
        DataKeyNames="countryNo" CellPadding="4" ForeColor="#333333">
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <EditItemTemplate>
            <br />
            
            country:
            <asp:TextBox ID="countryTextBox" runat="server" Text='<%# Bind("country") %>' />
            <br />
            countryC:
            <asp:TextBox ID="countryCTextBox" runat="server" 
                Text='<%# Bind("countryC") %>' />
            <br />
           
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="更新" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="取消" />
        </EditItemTemplate>
        <InsertItemTemplate>
            &nbsp;<br />
            英文國名 
            <asp:TextBox ID="countryTextBox" runat="server" Text='<%# Bind("country") %>' />
            <br />
            <br />
            中文國名 
            <asp:TextBox ID="countryCTextBox" runat="server" 
                Text='<%# Bind("countryC") %>' />
            <br />
            &nbsp;<br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="插入" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                CommandName="Cancel" Text="取消" />
        </InsertItemTemplate>
        <ItemTemplate>
            <br />
            英文國名： 
            <asp:Label ID="countryLabel" runat="server" Text='<%# Bind("country") %>' />
            <br />
            <br />
            中文國名： 
            <asp:Label ID="countryCLabel" runat="server" Text='<%# Bind("countryC") %>' />
            <br />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="編輯" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="新增" />
        </ItemTemplate>
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
    </asp:FormView>
    <br />
    <asp:SqlDataSource ID="SDSCountry" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>" 
        InsertCommand="INSERT INTO [country] ([country], [countryC]) VALUES (@country, @countryC)" 
        SelectCommand="SELECT [countryNo], [country], [countryC] FROM [country] WHERE ([countryNo] = @countryNo) ORDER BY [country]" 
        
        
        UpdateCommand="UPDATE [country] SET [country] = @country, [countryC] = @countryC WHERE [countryNo] = @countryNo" 
        DeleteCommand="DELETE FROM [country] WHERE [countryNo] = @countryNo">
        
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="countryNo" 
                PropertyName="SelectedValue" Type="Int16" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="countryNo" Type="Int16" />
        </DeleteParameters>
        
        <UpdateParameters>
           
            <asp:Parameter Name="country" Type="String" />
            <asp:Parameter Name="countryC" Type="String" />
            
            <asp:Parameter Name="countryNo" Type="Int16" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="country" Type="String" />
            <asp:Parameter Name="countryC" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>" 
        SelectCommand="SELECT [countryNo], [country], [countryC] FROM [country] ORDER BY [country]">
    </asp:SqlDataSource>
</asp:Content>

