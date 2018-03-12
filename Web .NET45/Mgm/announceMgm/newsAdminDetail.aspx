<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="newsAdminDetail.aspx.vb"
 Inherits="Mgm_announceMgm_newsAdminDetail" title="HAST - 新聞內容編輯" ValidateRequest="false"  %>



<%@ Register assembly="FreeTextBox" namespace="FreeTextBoxControls" tagprefix="FTB" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 800px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
            <br />    
                <table align="center" class="style1">
                    <tr>
                        <td width="60px" >
                            注意：
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            請勿於內容欄位直接貼入 Word 或 Excel的格式（如Word表格）</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            編輯或新增成功會直接跳回標題頁面，如果失敗而停在原頁面，請修改內容欄位（簡化）</td>
                    </tr>
                </table>
            <br />
    
  
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                DataKeyNames="newsID" DataSourceID="SDSNews" Width="800px" 
                DefaultMode="Edit" HorizontalAlign="Center">
                <Fields>
                    <asp:BoundField DataField="newsSubject" HeaderText="標題" >
                        <ControlStyle Width="660px" Height="24px" />
                        <HeaderStyle Width="80px" />
                        <ItemStyle Width="720px" Height="30px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="類別">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" 
                                DataSourceID="SqlDataSource1" DataTextField="newsTypeC" 
                                DataValueField="newsTypeID" SelectedValue='<%# Bind("newsTypeID") %>' 
                                 Width="100px">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" 
                                DataSourceID="SqlDataSource1" DataTextField="newsTypeC" 
                                DataValueField="newsTypeID" SelectedValue='<%# Bind("newsTypeID") %>' 
                                Width="100px">
                            </asp:DropDownList>
                        </InsertItemTemplate>
                        <ItemStyle Height="30px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="語言">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList3" runat="server" 
                                SelectedValue='<%# Bind("newsLanguage") %>'  Width="100px">
                                <asp:ListItem Value="ch">中文</asp:ListItem>
                                <asp:ListItem Value="en">英文</asp:ListItem>
                            </asp:DropDownList>                        
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList3" runat="server" 
                                SelectedValue='<%# Bind("newsLanguage") %>'  Width="100px">
                                <asp:ListItem Value="ch">中文</asp:ListItem>
                                <asp:ListItem Value="en">英文</asp:ListItem>
                            </asp:DropDownList>                       
                        </InsertItemTemplate>
                        <ItemStyle Height="30px" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="newsLink" HeaderText="原文網址" HtmlEncode="False" >
                        <ControlStyle Height="24px" Width="660px" />
                        <ItemStyle Width="30px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="內容">
                        
                        <EditItemTemplate>
                            <FTB:FreeTextBox ID="FreeTextBox2" runat="server"
                                 AllowHtmlMode="False" AssemblyResourceHandlerPath="" AutoConfigure="" AutoGenerateToolbarsFromString="True" 
                                AutoHideToolbar="True" AutoParseStyles="True" BackColor="158, 190, 245" BaseUrl="" BreakMode="Paragraph" 
                                ButtonDownImage="False" ButtonFileExtention="gif" ButtonFolder="Images" ButtonHeight="20" 
                                ButtonImagesLocation="InternalResource" ButtonOverImage="False" ButtonPath="" ButtonSet="Office2003" 
                                ButtonWidth="21" ClientSideTextChanged="" ConvertHtmlSymbolsToHtmlCodes="False" DesignModeBodyTagCssClass="" 
                                DesignModeCss="" DisableIEBackButton="False" DownLevelCols="50" DownLevelMessage="" DownLevelMode="TextArea" 
                                DownLevelRows="10" EditorBorderColorDark="128, 128, 128" EditorBorderColorLight="128, 128, 128" 
                                EnableHtmlMode="True" EnableSsl="False" EnableToolbars="True" Focus="False" FormatHtmlTagsToXhtml="True" 
                                GutterBackColor="129, 169, 226" GutterBorderColorDark="128, 128, 128" GutterBorderColorLight="255, 255, 255" 
                                Height="350px" HelperFilesParameters="" HelperFilesPath="" HtmlModeCss="" HtmlModeDefaultsToMonoSpaceFont="True" 
                                ImageGalleryPath="~/images/" ImageGalleryUrl="ftb.imagegallery.aspx?rif={0}&amp;cif={0}" 
                                InstallationErrorMessage="InlineMessage" JavaScriptLocation="InternalResource" 
                                Language="en-US" PasteMode="Default" ReadOnly="False" RemoveScriptNameFromBookmarks="True" 
                                RemoveServerNameFromUrls="True" RenderMode="NotSet" ScriptMode="External" ShowTagPath="False" SslUrl="/." 
                                StartMode="DesignMode" StripAllScripting="False" SupportFolder="/aspnet_client/FreeTextBox/" TabIndex="-1" 
                                TabMode="InsertSpaces" Text='<%# Bind("newsContent") %>' TextDirection="LeftToRight" 
                                ToolbarBackColor="Transparent" ToolbarBackgroundImage="True" ToolbarImagesLocation="InternalResource" 
                                ToolbarLayout="ParagraphMenu,FontFacesMenu,FontSizesMenu,FontForeColorsMenu|Bold,Italic,Underline,Strikethrough;Superscript,Subscript,RemoveFormat|JustifyLeft,JustifyRight,JustifyCenter,JustifyFull;BulletedList,NumberedList,Indent,Outdent;CreateLink,Unlink,InsertImage,InsertRule|Cut,Copy,Paste;Undo,Redo,Print" 
                                ToolbarStyleConfiguration="NotSet" UpdateToolbar="True" UseToolbarBackGroundImage="True" Width="600px">
                            </FTB:FreeTextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <FTB:FreeTextBox ID="FreeTextBox1" runat="server" 
                                  AllowHtmlMode="False" AssemblyResourceHandlerPath="" AutoConfigure="" AutoGenerateToolbarsFromString="True" 
                                AutoHideToolbar="True" AutoParseStyles="True" BackColor="158, 190, 245" BaseUrl="" BreakMode="Paragraph" 
                                ButtonDownImage="False" ButtonFileExtention="gif" ButtonFolder="Images" ButtonHeight="20" 
                                ButtonImagesLocation="InternalResource" ButtonOverImage="False" ButtonPath="" ButtonSet="Office2003" 
                                ButtonWidth="21" ClientSideTextChanged="" ConvertHtmlSymbolsToHtmlCodes="False" DesignModeBodyTagCssClass="" 
                                DesignModeCss="" DisableIEBackButton="False" DownLevelCols="50" DownLevelMessage="" DownLevelMode="TextArea" 
                                DownLevelRows="10" EditorBorderColorDark="128, 128, 128" EditorBorderColorLight="128, 128, 128" 
                                EnableHtmlMode="True" EnableSsl="False" EnableToolbars="True" Focus="False" FormatHtmlTagsToXhtml="True" 
                                GutterBackColor="129, 169, 226" GutterBorderColorDark="128, 128, 128" GutterBorderColorLight="255, 255, 255" 
                                Height="350px" HelperFilesParameters="" HelperFilesPath="" HtmlModeCss="" HtmlModeDefaultsToMonoSpaceFont="True" 
                                ImageGalleryPath="~/images/" ImageGalleryUrl="ftb.imagegallery.aspx?rif={0}&amp;cif={0}" 
                                InstallationErrorMessage="InlineMessage" JavaScriptLocation="InternalResource" 
                                Language="en-US" PasteMode="Default" ReadOnly="False" RemoveScriptNameFromBookmarks="True" 
                                RemoveServerNameFromUrls="True" RenderMode="NotSet" ScriptMode="External" ShowTagPath="False" SslUrl="/." 
                                StartMode="DesignMode" StripAllScripting="False" SupportFolder="/aspnet_client/FreeTextBox/" TabIndex="-1" 
                                TabMode="InsertSpaces" Text='<%# Bind("newsContent") %>' TextDirection="LeftToRight" 
                                ToolbarBackColor="Transparent" ToolbarBackgroundImage="True" ToolbarImagesLocation="InternalResource" 
                                ToolbarLayout="ParagraphMenu,FontFacesMenu,FontSizesMenu,FontForeColorsMenu|Bold,Italic,Underline,Strikethrough;Superscript,Subscript,RemoveFormat|JustifyLeft,JustifyRight,JustifyCenter,JustifyFull;BulletedList,NumberedList,Indent,Outdent;CreateLink,Unlink,InsertImage,InsertRule|Cut,Copy,Paste;Undo,Redo,Print" 
                                ToolbarStyleConfiguration="NotSet" UpdateToolbar="True" UseToolbarBackGroundImage="True" Width="600px">
                                
                            </FTB:FreeTextBox>
                        </InsertItemTemplate>
                        
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="編緝者">
                        <EditItemTemplate>
                            <asp:Label ID="LabelNewsEditor" runat="server" Text='<%# Bind("newsEditor") %>'></asp:Label>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:Label ID="LabelNewsEditor" runat="server" Text='<%# Bind("newsEditor") %>'></asp:Label>
                        </InsertItemTemplate>                    
                        <ItemStyle Height="30px" />
                    </asp:TemplateField>
                </Fields>
            </asp:DetailsView>
    
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnConfirm" runat="server" style="width: 40px" Text="更新" />
    &nbsp;
        <asp:Button ID="brnCanncel" runat="server" Text="取消" 
            PostBackUrl="~/Mgm/announceMgm/newsAdmin.aspx" />
    </p>
    <p>
        <asp:SqlDataSource ID="SDSNews" runat="server" 
            ConnectionString="<%$ ConnectionStrings:HASTAnnounceConnectionString %>" 
            InsertCommand="INSERT INTO [newsCenter] (newsTypeID, [newsSubject], [newsContent], [newsEditor], [newsLanguage], [newsLink]) VALUES (@newsTypeID, @newsSubject, @newsContent, @newsEditor, @newsLanguage, @newsLink)" 
            SelectCommand="SELECT * FROM [newsCenter] WHERE ([newsID] = @newsID)"            
            
            UpdateCommand="UPDATE [newsCenter] SET newsTypeID = @newsTypeID, [newsDate] = getdate(), [newsSubject] = @newsSubject, [newsContent] = @newsContent, [newsEditor] = @newsEditor, [newsLanguage] = @newsLanguage, [newsLink] = @newsLink WHERE [newsID] = @newsID" 
            DeleteCommand="DELETE FROM [newsCenter] WHERE [newsID] = @newsID">
            <SelectParameters>
                <asp:QueryStringParameter Name="newsID" QueryStringField="newsID" 
                    Type="Int32" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="newsID" Type="Int32" />
            </DeleteParameters>
           <UpdateParameters>
                <asp:Parameter Name="newsTypeID" Type="Int32" />
                <asp:Parameter Name="newsDate" type="DateTime"/>
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
            SelectCommand="SELECT * FROM [newsType]"></asp:SqlDataSource>
        <br />
    </p>
        
    <script>
        function onContentsChange() {
            alert('contents changed');
        }
    </script>
    
    </asp:Content>

