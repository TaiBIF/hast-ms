<%@ Page Title="" Language="VB" MasterPageFile="~/HAST/MasterPages/ContentC.master" AutoEventWireup="false" CodeFile="plantinfo.aspx.vb" Inherits="HAST_plantinfo" %>

<%@ Register Assembly="GMaps" Namespace="Subgurim.Controles" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  

    
    <script src="js/jquery.colorbox.js"></script>
    <script src="js/useColorbox.js"></script>
        
    <link rel="stylesheet" href="css/colorbox.css"  />  

</asp:Content>
    

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
    <div class="wrapper style6">
		<section class="container">
			<header>
				<h5>中研院植物標本館 > 院區植物介紹 > 植物簡介</h5>
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
                                        <li><a href="campusplants_pics.aspx" class="button small special sidebar-width">院區植物圖鑑</a></li>
                                        
									</ul>
							</section>															
						</section>

				</div>
				
                <div class="9u 12u(2) important(2)">
                    <div id="campus-plants">
					
                        <!-- Content -->
		
                        <section id="content">
			                <div class="row">
				                
                                <div class="12u">
								    <h3>
                                        <asp:Repeater ID="Repeater2" runat="server">
                                            <ItemTemplate>
                                                <asp:Label ID="LabelSpecies" runat="server" Text='<%# Eval("speciesC")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        </h3>
                                </div>                               
                                    
                                <div class="8u 12u(2)">
                                    <asp:DetailsView ID="DetailsViewSpecies" runat="server" AutoGenerateRows="False" 
                                        DataKeyNames="speciesID" cssClass="table-wrapper">
                                        <FieldHeaderStyle VerticalAlign="Top" Width="90px" CssClass="fieldHeader"  />
                                        <RowStyle CssClass="item_field" />
                                        <Fields>
                                            <asp:BoundField DataField="speciesE" HeaderText="學名" 
                                                SortExpression="speciesE" />
                                            <asp:BoundField DataField="speciesC" HeaderText="中文名" 
                                                SortExpression="speciesC" />
                                            <asp:BoundField DataField="characteristicC" HeaderText="形態描述" />
                                            <asp:TemplateField HeaderText="分佈">
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelDistribution" runat="server" 
                                                        Text='<%# Eval("distributionC")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField HeaderText="本區分佈" DataField="nLocalityC" />
                                            <asp:BoundField DataField="noteC" />
                                        </Fields>
                                        <HeaderStyle CssClass="fieldHeader" />
                                    </asp:DetailsView>
			                    </div>

                                <div class="4u 12u(2)">
                                    
                                    <asp:FormView ID="FormView1" runat="server">
                                        <ItemTemplate>
                                                <asp:Image  cssclass="image fit" ID="Image2" imageurl='<%# GetImageFilePath(Eval("imageCode")) %>' runat="server" />
                                        </ItemTemplate>
                                        </asp:FormView>
                                                                     
                                </div>


                                <div class="12u">  
                                    <p></p>
                                   
                                </div>

                                <!-- thumbnail image wrapped in a link -->





                                <asp:Repeater ID="Repeater1" runat="server">                                         
                                    <ItemTemplate>
                                        <div class="3u 12u(2)">
                                            <section class="image-feature">
                                                <span class="image fit">                                                       
                                                   <asp:HyperLink ID="HyperLink3"  runat="server" cssclass="group1" navigateUrl='<%# getimagefilepath(Eval("imageCode")) %>'>
                                                        <asp:Image ID="Image1"  runat="server"/>
                                                    </asp:HyperLink>
                                                   
                                                </span>                                                        
                                                <footer>
                                                    <p> 
                                                              
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("speciesC") %>'></asp:Label><br />
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("imageCode")%>'></asp:Label>  
                                                    </p> 
                                                </footer>
                                            </section>                           
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                                      
                            </div>


                            <cc1:GMap ID="GMap1"  runat="server" DataGIconAnchorField="" DataGIconImageField=""
                            DataGIconShadowField="" DataGIconShadowSizeField="" DataGIconSizeField="" DataGInfoWindowAnchorField=""
                            DataGInfoWindowTextField="" DataLatField="WGS84Lat" 
                            DataLngField="WGS84Lng"
                            enableGetGMapElementById="True" enablePostBackPersistence="True"
                            Version="2"  GZoom="1"/>


                        </section>

                     
                    </div>
                    
                </div>
            </div>	
        </section>
    </div>

</asp:Content>

