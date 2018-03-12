<%@ Page Language="VB" MasterPageFile="~/MasterPageTWFlora.master" AutoEventWireup="false" CodeFile="FamilyListC.aspx.vb" Inherits="Taxon_FamilyListC" title="HAST - 植物名錄 - 科名排序" %>

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
        <h3><b><label id='top'>植物名錄：植物名排序</label></b></h3>
        <br />
        <label id='order_by'>排序方式：</label>
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
            RepeatDirection="Horizontal" BorderStyle="None" BorderWidth="0px" 
            RepeatLayout="Flow">
            <asp:ListItem Selected="True" Value="Zh">中文</asp:ListItem>
            <asp:ListItem Value="En">英文</asp:ListItem>
        </asp:RadioButtonList>   
        <br /> <br />            
        <uc1:FamilyList ID="FamilyList1" runat="server" />
    </div>
    <asp:Label ID="LabelCountry" runat="server" Text=""></asp:Label>    
</asp:Content>

