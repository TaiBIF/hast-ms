<%@ Page Title="" Language="VB" MasterPageFile="~/HAST/MasterPages/ContentC.master" AutoEventWireup="false" CodeFile="QuickSearchResultC.aspx.vb" Inherits="HAST_QuickSearchResultC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <div class="wrapper style6">
		<section class="container">
			<header>
				<h5>中研院植物標館 > 植物名搜尋結果 </h5>
			</header>
        </section>
    </div>
        		<!-- Main-->

    <div class="wrapper style2">
    

<section class="container">
            <div class="row 150%">

				
                <p>&nbsp;</p>

				

				<div class="10u 12u(2) important(2)">
<p>&nbsp;&nbsp;&nbsp;</p>

        <section id="content">

   
 <div class="table-wrapper">

   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" cssClass="listShow" GridLines="None" 
        BorderStyle="None">
        <Columns>            
            
            <asp:HyperLinkField DataTextField="familyExpr" datanavigateurlfields="familyID" HeaderText="科名"
                datanavigateurlformatstring="~\Taxon\Genus_SpeciesListTwC.aspx?familyID= {0}"  />
            <asp:HyperLinkField DataTextField="genusExpr" datanavigateurlfields="familyID,genusE" HeaderText="屬名"
                datanavigateurlformatstring="~\Taxon\Genus_SpeciesListTwC.aspx?familyID={0}#{1}"  />
                               
            <asp:HyperLinkField DataTextField="speciesE" datanavigateurlfields="speciesID" HeaderText="學名"
                datanavigateurlformatstring="~\Taxon\SpeciesDetailC.aspx?speciesID={0}"  />
            <asp:HyperLinkField DataTextField="speciesC" datanavigateurlfields="speciesID" HeaderText="中名"
                datanavigateurlformatstring="~\Taxon\SpeciesDetailC.aspx?speciesID={0}"  />
        </Columns>
    </asp:GridView>      
        
        
        <br />
   
        
        </div>
        </section>
                    </div>
            </div>

            </section>
        </div>



   
    <asp:SqlDataSource ID="SDSSpecimensList" runat="server"></asp:SqlDataSource>
</asp:Content>

