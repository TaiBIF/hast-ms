<%@ Page Title="HAST - Hierarchical taxnomy of Taiwan Plants" Language="VB" MasterPageFile="~/MasterPageTWFloraE.master" AutoEventWireup="false" CodeFile="ListTwHierachicalE.aspx.vb" Inherits="Taxon_ListTwHierachicalE" %>

<%@ Register src="../UserControls/TaxonHierachicalTreeView.ascx" tagname="TaxonHierachicalTreeView" tagprefix="uc1" %>

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
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <br />
        <b><label id='top'   >Hierarchical Taxnomy of Taiwan Plants</label></b>
        <br />
    <div id='content' class="listShow">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
              
                <uc1:TaxonHierachicalTreeView ID="TaxonHierachicalTreeView1" runat="server" />
              
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:Label ID="LabelCountry" runat="server" Text="TW"></asp:Label> 
        <br />
        <a href='#top' >Top ↑</a>
    </div>
</asp:Content>


