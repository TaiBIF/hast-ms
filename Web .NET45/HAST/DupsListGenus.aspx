<%@ Page Title="" Language="VB" MasterPageFile="~/HAST/MasterPages/ContentC.master" AutoEventWireup="false" CodeFile="DupsListGenus.aspx.vb" Inherits="HAST_DupsListGenus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

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
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="familyE" HeaderText="科名" />
                <asp:BoundField DataField="familyC" HeaderText="中文科名" />
                <asp:BoundField DataField="genusE" HeaderText="屬名" />
                <asp:BoundField DataField="genusC" HeaderText="中文屬名" />
                <asp:BoundField DataField="total" HeaderText="小計" />
                <asp:HyperLinkField DataNavigateUrlFields="familyID,genusID" 
                    DataNavigateUrlFormatString="~/HAST/DupsListSpecies.aspx?familyID={0}&amp;genusID={1}" 
                    HeaderText="屬庫存統計" Text="統計" />
                <asp:HyperLinkField DataNavigateUrlFields="familyID,genusID" 
                    DataNavigateUrlFormatString="~/HAST/DupsDetail.aspx?familyID={0}&amp;genusID={1}" 
                    HeaderText="屬庫存清單" Text="查詢" />
            </Columns>
        </asp:GridView>
       
        </div>
        </section>
                    </div>
            </div>

            </section>
        </div>
       <asp:SqlDataSource ID="SqlDS" runat="server"></asp:SqlDataSource>

    

</asp:Content>

