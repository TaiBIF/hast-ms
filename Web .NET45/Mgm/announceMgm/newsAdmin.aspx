<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="newsAdmin.aspx.vb" Inherits="Mgm_announceMgm_newsAdmin" title="HAST-新聞管理" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 800px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
        
        <asp:LoginView ID="LoginView2" runat="server">
            <LoggedInTemplate>
               <table align="center" class="style1">
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                             <a href="newsAdminDetail.aspx?action=Insert" >新增</a></td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
                <br />
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataKeyNames="newsID" DataSourceID="SDSNews" 
                    BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="4" Font-Size="12pt" HorizontalAlign="Center" PageSize="20" 
                    Width="800px">
                    <RowStyle BackColor="White" ForeColor="#003399" />
                    <Columns>
                        <asp:BoundField DataField="newsDate" DataFormatString="{0:d}" HeaderText="日期" 
                            HtmlEncode="False" SortExpression="newsDate" >
                            <HeaderStyle Width="100px" />
                        </asp:BoundField>
                        <asp:HyperLinkField DataNavigateUrlFields="newsID" 
                            DataNavigateUrlFormatString="newsAdminDetail.aspx?newsID={0}" 
                            DataTextField="newsSubject" HeaderText="標題">
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:HyperLinkField>
                        <asp:BoundField DataField="newsEditor" HeaderText="建檔者" 
                            SortExpression="newsEditor" >
                            <HeaderStyle Width="80px" />
                        </asp:BoundField>
                    </Columns>
                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                </asp:GridView>
                
            </LoggedInTemplate>
        </asp:LoginView>
        
   
   
        <asp:SqlDataSource ID="SDSNews" runat="server" 
            ConnectionString="<%$ ConnectionStrings:HASTAnnounceConnectionString %>" 
            DeleteCommand="DELETE FROM [newsCenter] WHERE [newsID] = @newsID" 
            InsertCommand="INSERT INTO [newsCenter] ([newsSubject], [newsContent], [newsEditor], [newsLanguage], [newsLink]) VALUES (@newsSubject, @newsContent, @newsEditor, @newsLanguage, @newsLink)" 
            SelectCommand="SELECT * FROM [newsCenter] ORDER BY [newsDate] DESC" 
            UpdateCommand="UPDATE [newsCenter] SET [newsTypeID] = @newsTypeID, [newsSubject] = @newsSubject, [newsContent] = @newsContent, [newsEditor] = @newsEditor, [newsLanguage] = @newsLanguage, [newsLink] = @newsLink WHERE [newsID] = @newsID">
            <DeleteParameters>
                <asp:Parameter Name="newsID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="newsTypeID" Type="Int32" />
                <asp:Parameter Name="newsSubject" Type="String" />
                <asp:Parameter Name="newsContent" Type="String" />
                <asp:Parameter Name="newsEditor" Type="String" />
                <asp:Parameter Name="newsLanguage" Type="String" />
                <asp:Parameter Name="newsLink" Type="String" />
                <asp:Parameter Name="newsID" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="newsTypeID" Type="Int32" />
                <asp:Parameter Name="newsSubject" Type="String" />
                <asp:Parameter Name="newsContent" Type="String" />
                <asp:Parameter Name="newsEditor" Type="String" />
                <asp:Parameter Name="newsLanguage" Type="String" />
                <asp:Parameter Name="newsLink" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:HASTAnnounceConnectionString %>" 
            SelectCommand="SELECT * FROM [newsCenter]"></asp:SqlDataSource>
    
</asp:Content>

