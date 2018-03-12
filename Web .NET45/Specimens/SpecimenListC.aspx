<%@ Page Language="VB" MasterPageFile="~/MasterPageTWFlora.master" AutoEventWireup="false" CodeFile="SpecimenListC.aspx.vb" Inherits="Specimens_SpecimenListC" title="HAST - 台灣本土植物資料庫 - 植物標本查詢清單" %>

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
    <asp:HyperLink ID="HyperLinkRequery" runat="server" >重新查詢</asp:HyperLink>
    <br />
    <br />
&nbsp;&nbsp; 每頁資料筆數：<asp:DropDownList ID="DropDownList1" runat="server" 
        AutoPostBack="True">
        <asp:ListItem>20</asp:ListItem>
        <asp:ListItem>50</asp:ListItem>
        <asp:ListItem>100</asp:ListItem>
        <asp:ListItem Value="0">不分頁</asp:ListItem>
    </asp:DropDownList>    
    <br />
    &nbsp;&nbsp; 查詢結果：共&nbsp;<asp:Label ID="LabelDataCount" runat="server" 
        Text="Label"></asp:Label>
    &nbsp;筆（限查3000筆）
&nbsp;<asp:GridView ID="GridViewSpecimens" runat="server" 
        AutoGenerateColumns="False" cssClass="listShow" GridLines="None" 
        BorderStyle="None">
    </asp:GridView>
    <br />
    <a href="#Top_Anchor">Top</a> | <asp:HyperLink ID="HyperLink2" runat="server" >重新查詢</asp:HyperLink>
    <br />
    <br />
    <br />
    <asp:SqlDataSource ID="SDSSpecimensList" runat="server" >
    
    </asp:SqlDataSource>
    <br />
</asp:Content>

