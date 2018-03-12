<%@ Page Language="VB" MasterPageFile="~/MasterPageTWFloraE.master" AutoEventWireup="false" CodeFile="SpecimenListE.aspx.vb" Inherits="Specimens_SpecimenListE" title="HAST - Specimens List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <link href="../Styles/Style.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/TWFlora.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .specimen_list_header
        {
        	background-color:rgb(172,214,203);
            color:Black;
        	
        }
        
        .specimen_list_row
        {
        	background-color:rgb(229,245,241);
        }
        .specimen_list_alterrow
        {
        	background-color:rgb(213,234,229);
        }
        .specimen_list_pager
        {
        	background-color:rgb(61,138,130);
        }
        
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <a id="Top_Anchor">Specimens</a>
    |
    <asp:HyperLink ID="HyperLinkRequery" runat="server" >Query again</asp:HyperLink>
    <br />
    <br />
&nbsp;&nbsp;<asp:DropDownList ID="DropDownList1" runat="server" 
        AutoPostBack="True">
        <asp:ListItem>20</asp:ListItem>
        <asp:ListItem>50</asp:ListItem>
        <asp:ListItem>100</asp:ListItem>
        <asp:ListItem Value="0">Disable pager</asp:ListItem>
    </asp:DropDownList>&nbsp;records per page    
    <br />
    &nbsp;&nbsp; Total¡G&nbsp;<asp:Label ID="LabelDataCount" runat="server" 
        Text="Label"></asp:Label>
    &nbsp;records (3000 rows limit)
&nbsp;<asp:GridView ID="GridViewSpecimens" runat="server" 
        AutoGenerateColumns="False" cssClass="listShow" GridLines="None" 
        BorderStyle="None">
    </asp:GridView>
    <br />
    <a href="#Top_Anchor">Top</a> | <asp:HyperLink ID="HyperLink2" runat="server" >Query again</asp:HyperLink>
    <br />
    <br />
    <br />
    <asp:SqlDataSource ID="SDSSpecimensList" runat="server" >
    
    </asp:SqlDataSource>
    <br />
</asp:Content>

