<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="PersonM.aspx.vb" Inherits="Mgm_general_PersonM" title="未命名頁面" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    Last Name: &nbsp;<asp:DropDownList ID="DropDownList1" runat="server" 
        AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="lastName" 
        DataValueField="lastName">
    </asp:DropDownList>
    <br />
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
        GridLines="None" PageSize="20">
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#EFF3FB" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
    </asp:GridView>
    <br />
    <asp:Button ID="btnInsert" runat="server" Text="新增" />
    &nbsp;<br />
    <br />
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="pid" 
        DataSourceID="SqlDSInsert" DefaultMode="Insert">
        <InsertItemTemplate>
            <table border="1" cellpadding="4" cellspacing="0" width="600">
                <tr>
                    <td style="width: 100px; background-color: powderblue">
                        Last Name</td>
                    <td style="width: 450px">
                        <asp:TextBox ID="lastNameTextBox" runat="server" Text='<%# Bind("lastName") %>' 
                            Width="200px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="lastNameTextBox" ErrorMessage="必填"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px; background-color: powderblue">
                        First Name</td>
                    <td style="width: 450px">
                        <asp:TextBox ID="firstNameTextBox" runat="server" 
                            Text='<%# Bind("firstName") %>' Width="200px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px; background-color: powderblue">
                        中文名</td>
                    <td style="width: 450px">
                        <asp:TextBox ID="nameCTextBox" runat="server" Text='<%# Bind("nameC") %>'></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px; background-color: powderblue">
                        單位名稱</td>
                    <td style="width: 450px">
                        <asp:TextBox ID="organAbbrTextBox" runat="server" 
                            Text='<%# Bind("organAbbr") %>' Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px; background-color: powderblue">
                        採集者</td>
                    <td style="width: 450px">
                        <asp:CheckBox ID="collectorCheckBox" runat="server" 
                            Checked='<%# Bind("collector") %>' />
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px; background-color: powderblue">
                        鑑定者</td>
                    <td style="width: 450px; height: 28px">
                        <asp:CheckBox ID="identifierCheckBox" runat="server" 
                            Checked='<%# Bind("identifier") %>' />
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px; background-color: powderblue">
                        影像作者</td>
                    <td style="width: 450px">
                        <asp:CheckBox ID="imageAuthorCheckBox" runat="server" 
                            Checked='<%# Bind("imageAuthor") %>' />
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px; background-color: powderblue">
                    </td>
                    <td style="width: 450px; height: 29px">
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Insert" Text="新增"></asp:LinkButton>
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                            CommandName="Cancel" OnClick="InsertCancelButton_Click" Text="取消"></asp:LinkButton>
                    </td>
                </tr>
            </table>
            &nbsp;
        </InsertItemTemplate>
    </asp:FormView>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>" 
        SelectCommand="SELECT DISTINCT [lastName] FROM [person] ORDER BY [lastName]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDSInsert" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>" 
        InsertCommand="INSERT INTO [person] ([lastName], [firstName], [nameC], [organAbbr], [collector], [identifier], [imageAuthor]) VALUES (@lastName, @firstName, @nameC, @organAbbr, @collector, @identifier, @imageAuthor)" 
        SelectCommand="SELECT * FROM [person]">
        <InsertParameters>
            <asp:Parameter Name="lastName" Type="String" />
            <asp:Parameter Name="firstName" Type="String" />
            <asp:Parameter Name="nameC" Type="String" />
            <asp:Parameter Name="organAbbr" Type="String" />
            <asp:Parameter Name="collector" Type="Boolean" />
            <asp:Parameter Name="identifier" Type="Boolean" />
            <asp:Parameter Name="imageAuthor" Type="Boolean" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqldsDescription" runat="server"></asp:SqlDataSource>
</asp:Content>

