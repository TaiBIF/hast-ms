<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="newsTypeManage.aspx.vb" Inherits="Mgm_secure_newsTypeManage" title="新聞類別管理" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    新聞類別管理
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SDSNewsType" DataKeyNames="newsTypeID">
        <Columns>
            <asp:BoundField DataField="newsTypeC" HeaderText="類別 - 中文" />
            <asp:BoundField DataField="newsTypeE" HeaderText="類別 - 英文" />
            <asp:CommandField ShowEditButton="True" />
        </Columns>
    </asp:GridView>
    <br />
    <asp:Button ID="btnInsert" runat="server" Text="新增" />
&nbsp;<asp:Button ID="btnCancel" runat="server" Text="取消" />
    <br />
    <br />
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="newsTypeID" 
    DataSourceID="SqlDataSource1" DefaultMode="Insert">
        <InsertItemTemplate>
            <table class="style1" width="280px" border="1px">
                <tr>
                    <td width="80px">
                        類別-中文</td>
                    <td width="200px">
                        <asp:TextBox ID="TextBoxNewsTypeC" runat="server" 
                Width="200px" Text='<%# Bind("newsTypeC") %>'></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td width="80px">
                        類別-英文</td>
                    <td width="200px">
                        <asp:TextBox ID="TextBoxNewsTypeE" runat="server" 
                Width="200px" Text='<%# Bind("newsTypeE") %>'></asp:TextBox>
                    </td>
                </tr>
            </table>
        </InsertItemTemplate>
    </asp:FormView>
    <br />
   
    <br />
    <br />
    <asp:SqlDataSource ID="SDSNewsType" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>" 
        DeleteCommand="DELETE FROM [newsType] WHERE [newsTypeID] = @newsTypeID" 
        InsertCommand="INSERT INTO [newsType] ([newsTypeC], [newsTypeE]) VALUES (@newsTypeC, @newsTypeE)" 
        SelectCommand="SELECT * FROM [newsType]" 
        UpdateCommand="UPDATE [newsType] SET [newsTypeC] = @newsTypeC, [newsTypeE] = @newsTypeE WHERE [newsTypeID] = @newsTypeID">
        <DeleteParameters>
            <asp:Parameter Name="newsTypeID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="newsTypeC" Type="String" />
            <asp:Parameter Name="newsTypeE" Type="String" />
            <asp:Parameter Name="newsTypeID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="newsTypeC" Type="String" />
            <asp:Parameter Name="newsTypeE" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>" 
    DeleteCommand="DELETE FROM [newsType] WHERE [newsTypeID] = @newsTypeID" 
    InsertCommand="INSERT INTO [newsType] ([newsTypeC], [newsTypeE]) VALUES (@newsTypeC, @newsTypeE)" 
    SelectCommand="SELECT * FROM [newsType]" 
    UpdateCommand="UPDATE [newsType] SET [newsTypeC] = @newsTypeC, [newsTypeE] = @newsTypeE WHERE [newsTypeID] = @newsTypeID">
    <DeleteParameters>
        <asp:Parameter Name="newsTypeID" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="newsTypeC" Type="String" />
        <asp:Parameter Name="newsTypeE" Type="String" />
        <asp:Parameter Name="newsTypeID" Type="Int32" />
    </UpdateParameters>
    <InsertParameters>
        <asp:Parameter Name="newsTypeC" Type="String" />
        <asp:Parameter Name="newsTypeE" Type="String" />
    </InsertParameters>
</asp:SqlDataSource>
</asp:Content>

