<%@ Page Title="" Language="VB" MasterPageFile="~/HAST/MasterPages/ContentC.master" AutoEventWireup="false" CodeFile="news.aspx.vb" Inherits="HAST_news" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <link rel="stylesheet" href="css/append.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        
    <div class="wrapper style6">
		<section class="container">
			<header>
				<h5>中研院植物標本館 > 標本館簡介 > 最新消息</h5>
			</header>
        </section>
    </div>
        		<!-- Main-->
    
    <div class="wrapper style2">
        <section class="container">
			<div class="row 150%">

				<div class="3u 12u(2)">
                    						
					<!-- Sidebar -->

						<section id="sidebar">
							<section>
									<ul class="actions">
                                        <li><a href="about_herbarium.aspx" class="button small special" style="width: 200px">植物標本館</a></li>
										<li><a href="about_HAST.aspx" class="button small special" style="width: 200px">關於中研院植物標本館</a></li>
                                        <li><a href="#" class="button small special" style="width: 200px">研究人員</a></li>
                                        <li><a href="news.aspx" class="button small special" style="width: 200px">最新消息</a></li>
                                        <li><a href="#" class="button small special" style="width: 200px">植物標本製作</a></li>
									</ul>
							</section>
							<hr />
									
						</section>

				</div>

            <!-- Content -->
				<div class="9u 12u(2) important(2)">
						
					
					<section id="content">

					    <h3>最新消息</h3>                       
                            
                                    <div class="table-wrapper">

                                        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                                            <asp:View ID="View1" runat="server">
                                                <div id="news_subject">
                                                    <asp:GridView ID="GridViewNewsSubject" runat="server" AllowPaging="true" AutoGenerateColumns="false" BorderStyle="NotSet" DataKeyNames="newsID" DataSourceID="SDSNewsSubject" GridLines="None" PageSize="8" ShowHeader="False">
                                                            <PagerSettings Mode="NumericFirstLast" PageButtonCount="10" />
                                                            <Columns>
                                                                <asp:BoundField DataField="newsTypeC" HeaderText="類別" ItemStyle-Width="75px" ShowHeader="False">
                                                                <ItemStyle CssClass="news_list_type" />
                                                                </asp:BoundField>
                                                                <asp:TemplateField HeaderText="標題" ShowHeader="False">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Select" Text='<%# Eval("newsSubject") %>'></asp:LinkButton>
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="news_list_subject" />
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="newsDate" DataFormatString="{0:d}" HeaderText="日期" HtmlEncode="False" ShowHeader="False">
                                                                <ItemStyle CssClass="news_list_date" />
                                                                </asp:BoundField>
                                                            </Columns>
                                                            <PagerStyle BackColor="#F2F2F2" BorderStyle="None" CssClass="news_list_pager" HorizontalAlign="center" />
                                                        </asp:GridView>
                                                    </div>  
                                            </asp:View>

                                            <asp:View ID="View2" runat="server">
                                                <div id="news_detail">
                                                    <asp:DetailsView ID="DetailsViewNewsContent" runat="server" AutoGenerateRows="False" DataSourceID="SDSNewsContent" GridLines="None">
                                                        <Fields>
                                                            <asp:BoundField DataField="newsTypeC" HeaderStyle-Width="60px" HeaderText="類別">
                                                            <HeaderStyle CssClass="news_content_header" />
                                                            <ItemStyle CssClass="news_content_item" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="newsDate" DataFormatString="{0:d}" HeaderText="日期" HtmlEncode="False">
                                                            <HeaderStyle CssClass="news_content_header" />
                                                            <ItemStyle CssClass="news_content_item" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="newsSubject" HeaderText="標題">
                                                            <HeaderStyle CssClass="news_content_header" />
                                                            <ItemStyle CssClass="news_content_item" />
                                                            </asp:BoundField>
                                                            <asp:HyperLinkField DataNavigateUrlFields="newsLink" DataTextField="newsLink" HeaderText="來源" Target="_blank">
                                                            <HeaderStyle CssClass="news_content_header" />
                                                            <ItemStyle CssClass="news_content_item" />
                                                            </asp:HyperLinkField>
                                                            <asp:TemplateField HeaderText="內容" ItemStyle-VerticalAlign="Top">
                                                                <ItemTemplate>
                                                                    <div id="news_content">
                                                                        <asp:Label ID="Label1" runat="server" Text='<%# Convert.Tostring(Eval("newsContent")).Replace("\r","<br />") %>'></asp:Label>
                                                                    </div>
                                                                </ItemTemplate>
                                                                <HeaderStyle CssClass="news_content_header" />
                                                                <ItemStyle CssClass="news_content_item" />
                                                            </asp:TemplateField>
                                                        </Fields>
                                                        <HeaderStyle HorizontalAlign="Justify" />
                                                    </asp:DetailsView>
                                                    <asp:Button ID="Button1" runat="server" Text="回最新消息" />
                                                </div>                                            

                                            </asp:View>
                                        </asp:MultiView>
                                                
                                    </div>     
                       
        
                        	

	                </section>
								
				</div>

			</div>
		</section>
    </div>	
            <asp:SqlDataSource ID="SDSNewsSubject" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:HASTAnnounceConnectionString %>"
                                        SelectCommand="SELECT [newsID], [newsTypeC], [newsDate], [newsSubject] FROM [newsCenter] LEFT JOIN newsType ON newsCenter.newsTypeID = newsType.newsTypeID ORDER BY [newsDate] DESC">
                                    </asp:SqlDataSource>
             <asp:SqlDataSource ID="SDSNewsContent" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:HASTAnnounceConnectionString %>" 
                                        SelectCommand="SELECT [newsID], [newsTypeC], [newsDate], [newsSubject], newsLink, [newsContent] 
                                                    FROM [newsCenter] LEFT JOIN newsType ON newsCenter.newsTypeID = newsType.newsTypeID 
                                                    WHERE ([newsID] = @newsID) " >
                                        
                                    </asp:SqlDataSource>

</asp:Content>

