<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ImageList.aspx.vb" Inherits="Mgm_general_ImageList" title="未命名頁面" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id='header'>
       <h1></h1>
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" DataSourceID="SDSClassX"
            DataTextField="classC" DataValueField="classID" RepeatDirection="Horizontal">
        </asp:RadioButtonList>
    </div>
    <div id='container'>
        <div id='first-column'>
            <asp:Panel ID="Panel1" runat="server" Height="100%" ScrollBars="Both" Width="100%">
                <asp:TreeView ID="TreeView1" runat="server" ExpandDepth="1" MaxDataBindDepth="2"
                    ShowLines="True">
                    <Nodes>
                        <asp:TreeNode PopulateOnDemand="True" SelectAction="None" Text="新節點" Value="新節點"></asp:TreeNode>
                    </Nodes>
                </asp:TreeView>
            </asp:Panel>
        </div>
        <div id='content'>
            <asp:MultiView ID="MultiView1" runat="server">
                
            </asp:MultiView>
        </div>
        <div id='third-column'>
            Text in the third column.
        </div>
    </div>
    <div id='footer'>
        <h6>Footer</h6>
    </div>

    <asp:SqlDataSource ID="SDSClassX" runat="server" ConnectionString="<%$ ConnectionStrings:PhotoDBConnectionString %>"
        SelectCommand="SELECT [classID], [classE], [classC] FROM [classX] ORDER BY [classID]">
    </asp:SqlDataSource>
</asp:Content>

