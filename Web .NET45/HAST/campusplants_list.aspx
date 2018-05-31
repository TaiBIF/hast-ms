<%@ Page Title="" Language="VB" MasterPageFile="~/HAST/MasterPages/ContentC.master" AutoEventWireup="false" CodeFile="campusplants_list.aspx.vb" Inherits="HAST_campusplants_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
<div class="wrapper style6">
	<section class="container">
		<header>
			<h5>中研院植物標本館 > 院區植物介紹 > 植物名錄</h5>
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
							<li><a href="campusplants_pics.aspx" class="button small special sidebar-width">院區植物圖鑑</a></li>
                            
						</ul>
					</section>
					<hr />
									
				</section>

			</div>

			<div class="9u 12u(2) important(2)">
						
				    <!-- Content -->
                <section id="content">
                    
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <h3><asp:Label ID="LabelClass" runat="server" Text='<%# Eval("classC")%>'></asp:Label></h3>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" ShowHeader="false" ShowFooter="false">
                                <Columns>
                                    <asp:BoundField DataField="familyC" ControlStyle-Width="15%"/>
                                    <asp:BoundField DataField="familyE"/>
                                    <asp:HyperLinkField DataTextField="speciesE" datanavigateurlfields="listID"
                                        datanavigateurlformatstring="~\HAST\plantinfo.aspx?listID={0}"  />
                                    <asp:HyperLinkField DataTextField="speciesC" datanavigateurlfields="listID"
                                        datanavigateurlformatstring="~\HAST\plantinfo.aspx?listID={0}"  />                                    
                                    
                                </Columns>
                            </asp:GridView>                            
                        </ItemTemplate>
                    </asp:Repeater>

					

				</section>
			</div>
		
        </div>
    </section>
                    
</div>

</asp:Content>

