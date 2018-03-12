<%@ Page Title="台灣維管束植物名錄" Language="VB" MasterPageFile="~/MasterPageTWFlora.master" AutoEventWireup="false" CodeFile="ListTwHierachicalC.aspx.vb" Inherits="Taxon_ListTwHierachicalC" %>

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
        <b><label id='top'   >台灣維管束植物名錄：分類階層</label></b>
        <br />
    <div id='content' class="listShow">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" Visible="True">
            <ContentTemplate>
                <!--p id='order_by'>排序方式：</p-->
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
                    RepeatDirection="Horizontal" Visible="False" >
                    <asp:ListItem Selected="True" Value="Zh">中文</asp:ListItem>
                    <asp:ListItem Value="En">英文</asp:ListItem>
                </asp:RadioButtonList>
                <uc1:TaxonHierachicalTreeView ID="TaxonHierachicalTreeView1" runat="server" />                
                
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:Label ID="LabelCountry" runat="server" Text="TW"></asp:Label> 
        <br />
        <a href='#top' >Top ↑</a>
    </div>
</asp:Content>

