<%@ Page Title="" Language="VB" MasterPageFile="~/HAST/MasterPages/ContentC.master" AutoEventWireup="false" CodeFile="DupsListSpecies.aspx.vb" Inherits="HAST_DupsListSpecies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        
    <div>

    <div class="wrapper style6">
		<section class="container">
			<header>
				<h5>中研院植物標本館 > 複份標本 > 複份標本統計 </h5>
			</header>
        </section>
    </div>
        		<!-- Main-->

    <div class="wrapper style2">
    

        <section class="container">
    
            <div class="row 150%">

				

				<div class="10u 12u(2) important(2)">


        <section id="content">

   
 <div class="table-wrapper">
    <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
        
       
   
   
        </div>
        </section>
                    </div>
            </div>

            </section>
        </div>
        <asp:SqlDataSource ID="SqlDS" runat="server"></asp:SqlDataSource>
    </div>
</asp:Content>

