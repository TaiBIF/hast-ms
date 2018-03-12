<%@ Page Title="" Language="VB" MasterPageFile="~/HAST/MasterPages/MainC.master" AutoEventWireup="false" CodeFile="index.aspx.vb" Inherits="HAST_index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript" src="js/jquery.cycle.all.js"></script>
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="css/append.css" />            
    <style type="text/css">
               
        .wrapper.style1 {
        width:100%;
        }            

    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    		<!-- Two -->
    <div class="wrapper style2">        
        <section class="container">
            <div class="row">
                <div class="9u 12u(2)">
                    <a href="news.html"><h3>最新消息</h3></a>
					<div class="table-wrapper">
                        <asp:GridView ID="GridViewNewsSubject"  runat="server" DataSourceID="SDSNewsSubject" 
                                AutoGenerateColumns="False" DataKeyNames="newsID" ShowHeader="False" 
                                BorderStyle="NotSet" GridLines="None" PageSize="5" 
                        AllowPaging="True"  >
                                <Columns>
                                    <asp:BoundField HeaderText="類別"     DataField="newsTypeC" ShowHeader="False" >
                                        <ItemStyle CssClass="news_list_type" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="ID" ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" 
                                                CommandName="Select" Text='<%# Eval("newsID")%>' PostBackUrl='<%# "http://www.hast.biodiv.tw/HAST/news.aspx?newsID=" & Eval("newsID")%>'  ></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle CssClass="news_list_subject" />
                                    </asp:TemplateField>                                 
                                    <asp:TemplateField HeaderText="標題" ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                                CommandName="Select" Text='<%# Eval("newsSubject") %>'></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle CssClass="news_list_subject" />
                                    </asp:TemplateField>
                                    <asp:BoundField HeaderText="日期" DataField="newsDate" DataFormatString="{0:d}" 
                                        HtmlEncode="False" ShowHeader="False" >
                                        <ItemStyle CssClass="news_list_date" />
                                    </asp:BoundField>
                                </Columns>
                                <PagerStyle BorderStyle="None"  CssClass="news_list_pager"  
                                    HorizontalAlign="Left" BackColor="#F2F2F2" />
                            </asp:GridView>
                    </div>
                </div>
           

                <div class="3u 12u(2)" id="QuickSearch" >
                    <div class="wrapper style7">
                        <a href="news.html"><h3>資料庫快速搜尋</h3></a>          
                        <p style="font-size:0.9em; margin: 2em 0 0 0">植物中名或學名關鍵字</p>
                        <!--input type="text" name="fname" placeholder="Keyword" style="margin: 0.6em 0 1em 0"/-->
                        <asp:TextBox ID="textboxPlantName" runat="server" style="margin: 0.6em 0 1em 0"></asp:TextBox>
                        <div>
                            <asp:Button ID="btnQuickSearch" runat="server" Text="Button" />
                        </div>
                    </div>
                </div>
            </div>                               
        </section>
    </div>      
	

           <!-- One -->

	<section id="one" class="wrapper style1 pics">		
                  
                    <asp:Repeater ID="Repeater1" runat="server">
                        
                        <ItemTemplate> 
                                <div class="container">
                                    <div class="inner">
                                        <header class="major" style="text-align:center">
                                            <h3><span>本週植物焦點 </span></h3>
							                <h3>                                            
                                                <asp:Label ID="LabelFocus" runat="server" Text=""></asp:Label><br />
                                                <asp:Label ID="LabelFocusE" runat="server" Text="Label"></asp:Label><br />
							                </h3>
						                </header> 
                                    
                                       <p><asp:Literal ID="Literal1" runat="server" ></asp:Literal></p><br />
                                
                                        <div style="text-align:center">
                                            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="button alt small">Read more</asp:LinkButton>
                                        </div>
                                        
                                     </div>   
                                     <asp:HyperLink ID="HyperLinkFocus" runat="server"><span class="device image fit">
                                         <img src='<%# GetImage(Eval("imageCode")) %>'/></span></asp:HyperLink>
                                
                            </div>     		                         
                        </ItemTemplate>

                       
                    </asp:Repeater>
             
   
   	
	</section>

		
		<!-- Three -->
			<section id="three" class="wrapper style3">
				<div class="container">
					<div class="row">
						<div class="3u 12u(2)">
							<section class="image-feature">
								<a href="#">
									<header>
										<h3>秋海棠資料庫</h3>
									</header>
									<span class="image fit"><img src="images/pic02.jpg" alt="" /></span>
									<footer>
										<p>這是秋海棠資料庫的簡介這是秋海棠資料庫的簡介</p>
									</footer>
								</a>
							</section>
						</div>
						<div class="3u 12u(2)">
							<section class="image-feature">
								<a href="#">
									<header>
										<h3>院區植物介紹</h3>
									</header>
									<span class="image fit"><img src="images/pic03.jpg" alt="" /></span>
									<footer>
										<p>這是院區植物介紹的簡介這是院區植物介紹的簡介</p>
									</footer>
								</a>
							</section>
						</div>
						<div class="3u 12u(2)">
							<section class="image-feature">
								<a href="#">
									<header>
										<h3>台北近郊植物</h3>
									</header>
									<span class="image fit"><img src="images/pic04.jpg" alt="" /></span>
									<footer>
										<p>這是台北近郊植物的簡介這是台北近郊植物的簡介</p>
									</footer>
								</a>
							</section>
						</div>
                        <div class="3u 12u(2)">
							<section class="image-feature">
								<a href="#">
									<header>
										<h3>Feature</h3>
									</header>
									<span class="image fit"><img src="images/pic02.jpg" alt="" /></span>
									<footer>
										<p>Introduction</p>
									</footer>
								</a>
							</section>
						</div>

                        <!-- div class="3u 12u(2)"  類別影響元素縮放-->
				    <div>    
				        <asp:DataList ID="DataListImages" runat="server"  repeatColumns="4"  
                            repeatdirection="Horizontal"  >                          
                                      
                                <ItemTemplate>
                                    <section class="image-feature">          
                                            <header>
									                    <h3>台北近郊植物</h3>
									                </header>
                                                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# "~/Photo/ImageDetailC.aspx?imageCode=" & Eval("imageCode") %>' > <span class="image fit"><asp:Image ID="Image1" runat="server" /></span>
                                                </asp:HyperLink>
                                    
                                                <footer>
                                                    
                                                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "~/Photo/ImageDetailC.aspx?imageCode=" & Eval("imageCode") %>'
                                                        Text='<%# Eval("imageCode") %>'></asp:HyperLink><br />
                                                    <!--<asp:Label ID="Label1" runat="server" Text='<%# Eval("speciesE") %>'></asp:Label><br />
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("speciesC") %>'></asp:Label>-->
                                                   
                                                </footer>
                                          
                                    </section>     
                            </ItemTemplate>
                        </asp:DataList>
                         
				    </div>



					</div>
				</div>
			</section>	
			
    
	<asp:SqlDataSource ID="SDSNewsSubject" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:HASTAnnounceConnectionString %>"
                                SelectCommand="SELECT [newsID], [newsTypeC], [newsDate], [newsSubject] FROM [newsCenter] LEFT JOIN newsType ON newsCenter.newsTypeID = newsType.newsTypeID ORDER BY [newsDate] DESC">
                            </asp:SqlDataSource>     
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
	
    <script>
        $(document).ready(function () {
           $('.pics').cycle('fade');
        });

        $(window).resize(function(){
            $(".wrapper.style1").css('width','inherit');

        })
        
    </script>
    

		

</asp:Content>

