<%@ Page Language="VB" MasterPageFile="~/MasterPageTWFloraE.master" AutoEventWireup="false" CodeFile="FamilyListE.aspx.vb" Inherits="Taxon_FamilyListE" title="HAST - Families List" %>

<%@ Register src="../UserControls/FamilyList.ascx" tagname="FamilyList" tagprefix="uc1" %>

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
        .family_list
            {
            	margin:10px 50px;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id='content' class="listShow">
        <br />
        <h3><b><label id='top'   >List of Families</label></b></h3>
        <br /><br />              
        
           
        <uc1:FamilyList ID="FamilyList1" runat="server" />
    </div>
    <asp:Label ID="LabelCountry" runat="server" Text=""></asp:Label>    
</asp:Content>

