<%@ Page Language="VB" MasterPageFile="~/MasterPageTWFloraE.master" AutoEventWireup="false" CodeFile="Genus_SpeciesListE.aspx.vb" Inherits="Taxon_SpeciesListE" title="HAST - Species List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Styles/Style.css" rel="stylesheet" type="text/css" />   
    <link href="../Styles/TWFlora.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #order_by
            {
            	float:left;
            }
        #content
            {
            	margin:20px 50px;
            }
        .genus_list
            {
            	margin:0px 25px;
            height: 14px;
            width: 177px;
        }
        .species_list
        {
        	margin:10px 50px;
        }
     </style> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id='content' class="listShow">
    <br />
 <h3><b><label id='top'   >List of Species</label></b></h3><br />
           
            <br />
    <div id='upper_taxon'>        
        <b><asp:Label ID="LabelUpperTaxon" runat="server" Text="Label"></asp:Label><br /></b>
    </div>
    <br />
        
            <asp:DataList ID="DataListGenus" runat="server" >
                <ItemTemplate>
                    <div class="genus_list">
                        <asp:HyperLink ID="HyperLinkGenus" runat="server" >hyperlink1</asp:HyperLink>
                    </div>
                </ItemTemplate>
            </asp:DataList>
            <br />
            
            <asp:DataList ID="DataListGenusSpecies" runat="server" >
                <ItemTemplate>
                    
                    <asp:Label ID="LabelGenus" runat="server" Text="Label"></asp:Label>
                    <br /> 
                    <div class="species_list">                      
                        <asp:DataList ID="DataListSpecies" runat="server" 
                        onitemdatabound="DataListSpecies_ItemDataBound">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLinkSpecies" runat="server">HyperLink</asp:HyperLink>
                            </ItemTemplate>
                        </asp:DataList> 
                    </div>
                    <a href='#top' >Top ↑</a>
                    <br /><br />                                                                             
                </ItemTemplate>                
            </asp:DataList>
        
    <br />
    </div>

    </asp:Content>

