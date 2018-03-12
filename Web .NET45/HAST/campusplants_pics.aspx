<%@ Page Title="" Language="VB" MasterPageFile="~/HAST/MasterPages/ContentC.master" AutoEventWireup="false" CodeFile="campusplants_pics.aspx.vb" Inherits="HAST_campusplants_pics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="js/imageThumb.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
	<div class="wrapper style6">
		<section class="container">
			<header>
				<h5>中研院植物標本館 > 院區植物介紹 > 圖片檢索</h5>
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
                                     <li><a href="campusplants_list.aspx" class="button small special sidebar-width">院區植物名錄</a></li>
                                    <li><a href="campusplants_pics.aspx?theme=1" class="button small special sidebar-width">花</a></li>
                                    <li><a href="campusplants_pics.aspx?theme=3" class="button small special sidebar-width">果實/種子</a></li>
                                    <li><a href="campusplants_pics.aspx?theme=2" class="button small special sidebar-width">葉</a></li>
                                    <li><a href="campusplants_pics.aspx?theme=4&classID=1" class="button small special sidebar-width">蕨類植物</a></li>
                                    <li><a href="campusplants_pics.aspx?theme=4&classID=2" class="button small special sidebar-width">裸子植物</a></li>
                                    <li><a href="campusplants_pics.aspx?theme=4&classID=3" class="button small special sidebar-width">雙子葉植物</a></li>
                                    <li><a href="campusplants_pics.aspx?theme=4&classID=4" class="button small special sidebar-width">單子葉植物</a></li>                                    
								</ul>
						</section>
						<hr />
									
					</section>

				</div>
						
                <div class="9u 12u(2) important(2)">
						
							<!-- Content -->
                    <div id="campus-plants">
	        			<section id="content">
                            <div class="row">

                                <asp:Repeater ID="Repeater1" runat="server">
                                    <ItemTemplate>
                                        <div class="3u 12u(2)">
                                            <div class="imageThumb">
                                            <section class="image-feature">
                                                <header>
										            <asp:Label ID="Label2" runat="server" Text='<%# Eval("speciesC") %>'></asp:Label>
									            </header>
                                                <asp:HyperLink ID="HyperLink3"  runat="server"  NavigateUrl='<%# "~/HAST/plantinfo.aspx?listID=" & Eval("listID")%>' >
                                                    <span class="image fit">                                                       
                                                        
                                                        
                                                        <asp:Image CssClass="crop" ID="Image1" runat="server" />
                                                        
                                                    </span>
                                                    <footer>                                                             
                                                        <div class="imageFooter">
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("speciesE") %>'></asp:Label><br />
                                                            
                                                        </div> 
                                                    </footer>
                                                 </asp:HyperLink>
                                            
                                            </section>                           
                                        </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
						        
						
					</div>
                </section>                    
                    </div>
                
                </div>
            
            </div>

        </section>


       
        <script>

           
        </script>

    </div>

</asp:Content>

