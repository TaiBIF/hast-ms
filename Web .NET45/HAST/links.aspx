<%@ Page Title="" Language="VB" MasterPageFile="~/HAST/MasterPages/ContentC.master" AutoEventWireup="false" CodeFile="links.aspx.vb" Inherits="HAST_links" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div class="wrapper style6">
		<section class="container">
			<header>
				<h5>中研院植物標本館 > 相關網站</h5>
			</header>
        </section>
    </div>

		<!-- Main-->	
				
			
				
			<!-- Content -->
	<div class="wrapper style2">
        <section class="container">
                
                    

               
                           
        <div class="row">

           <asp:Repeater ID="Repeater1" runat="server" >
               <ItemTemplate>                   
                   <div Class="4u 12u(2)">
                       <h3><asp:Label ID="webCategoryLabel" runat="server" Text='<%# Eval("webCategoryC") %>' /></h3>
                       
                       <asp:DataList ID="DataList3" runat="server" OnItemDataBound="DataList3_ItemDataBound" RepeatLayout="Flow">

                                        <ItemTemplate>
                                            <asp:HyperLink ID="HyperLink2" runat="server">HyperLink</asp:HyperLink>
                                        </ItemTemplate>
                       </asp:DataList>
                   </div>                   
               </ItemTemplate>
            </asp:Repeater>	            
        </div>
               
                           

           
	    </section>
    </div>

 
</asp:Content>

