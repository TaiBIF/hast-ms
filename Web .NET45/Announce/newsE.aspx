<%@ Page Language="VB" MasterPageFile="~/MasterPageTWFloraE.master" AutoEventWireup="false" CodeFile="newsE.aspx.vb" Inherits="Announce_newsE" title="HAST - News" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        
    <!--link href="http://www.hast.biodiv.tw/Styles/Style.css" rel="stylesheet" type="text/css" /-->
    <link href="../Styles/Style.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/newsStyle.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/TWFlora.css" rel="stylesheet" type="text/css" />
     
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="news_subject">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                
                <asp:GridView ID="GridViewNewsSubject"  runat="server" DataSourceID="SDSNewsSubject" 
                    AutoGenerateColumns="False" DataKeyNames="newsID" ShowHeader="False" 
                    BorderStyle="None" GridLines="None" AllowPaging="True" Width="800px">
                    <Columns>
                        <asp:BoundField HeaderText="Category"     DataField="newsTypeE" ShowHeader="False" >
                            <ItemStyle CssClass="news_list_type" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Date" DataField="newsDate" DataFormatString="{0:d}" 
                            HtmlEncode="False" ShowHeader="False" >
                            <ItemStyle CssClass="news_list_date" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Title" ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                    CommandName="Select" Text='<%# Eval("newsSubject") %>'></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle CssClass="news_list_subject" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
              
                
                <asp:SqlDataSource ID="SDSNewsSubject" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:HASTAnnounceConnectionString %>"
                    SelectCommand="SELECT [newsID], [newsTypeE], [newsDate], [newsSubject] 
                    FROM [newsCenter] LEFT JOIN newsType ON newsCenter.newsTypeID = newsType.newsTypeID 
                    WHERE (newsLanguage = 'en') ORDER BY [newsDate] DESC">
                </asp:SqlDataSource>
            </ContentTemplate>
        </asp:UpdatePanel>
        </div> 
        
        <div id="news_detail">
        
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
               
                <asp:DetailsView ID="DetailsViewNewsContent" runat="server" AutoGenerateRows="False" 
                    DataSourceID="SDSNewsContent" GridLines="None">
                    <Fields>
                        <asp:BoundField HeaderText="Category" DataField="newsTypeE" >
                            <HeaderStyle CssClass="news_content_header" />
                            <ItemStyle CssClass="news_content_item" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Date" DataField="newsDate" DataFormatString="{0:d}" 
                            HtmlEncode="False" >
                            <HeaderStyle CssClass="news_content_header" />
                            <ItemStyle CssClass="news_content_item" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Title" DataField="newsSubject" >
                            <HeaderStyle CssClass="news_content_header" />
                            <ItemStyle CssClass="news_content_item" />
                        </asp:BoundField>
                        <asp:HyperLinkField DataNavigateUrlFields="newsLink" DataTextField="newsLink" 
                            HeaderText="News Link" Target="_blank">
                            <HeaderStyle CssClass="news_content_header" />
                            <ItemStyle CssClass="news_content_item" />
                        </asp:HyperLinkField>
                        <asp:TemplateField HeaderText="Content">
                            <ItemTemplate>
                                <div id="news_content">
                               
                                <asp:Label ID="Label1" runat="server" 
                                    Text='<%# Convert.Tostring(Eval("newsContent")).Replace("\r","<br />") %>' 
                                        Width="710px"></asp:Label>
                                </div>
                            </ItemTemplate>
                            <HeaderStyle CssClass="news_content_header" />
                            <ItemStyle CssClass="news_content_item" />
                        </asp:TemplateField>
                    </Fields>
                </asp:DetailsView>
                
                <asp:SqlDataSource ID="SDSNewsContent" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:HASTAnnounceConnectionString %>" 
                    SelectCommand="SELECT [newsID], [newsTypeE], [newsDate], [newsSubject], newsLink, [newsContent] 
                                FROM [newsCenter] LEFT JOIN newsType ON newsCenter.newsTypeID = newsType.newsTypeID 
                                WHERE ([newsID] = @newsID) " >
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewNewsSubject" Name="newsID" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </ContentTemplate>
        
        
        
        
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="GridViewNewsSubject" 
                    EventName="SelectedIndexChanged" />
            </Triggers>    
        
        
        
        </asp:UpdatePanel>
        </div>
    
</asp:Content>

