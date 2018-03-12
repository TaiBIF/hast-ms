<%@ Page Title="" Language="VB" MasterPageFile="~/HAST/MasterPages/ContentC.master" AutoEventWireup="false" CodeFile="SpecimenList.aspx.vb" Inherits="HAST_SpecimenList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <style>
            select {
                display:inline ;
                width:10%;
            }

        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

           <div class="wrapper style6">
		<section class="container">
			<header>
				<h5>中研院植物標館 > 植物標本清單 </h5>
			</header>
        </section>
    </div>
        		<!-- Main-->

    <div class="wrapper style2">
    
   
    <section class="container">
            <div class="row 150%">

				
				

				<div class="10u 12u(2) important(2)">
<p>&nbsp;&nbsp;&nbsp;</p>

        <section id="content">
            共 118,812 筆資料，僅列出前1000筆，請使用查詢功能篩選資料<br />
        <asp:HyperLink ID="HyperLinkRequery" runat="server" >進階查詢</asp:HyperLink><br />

   
&nbsp;&nbsp; 每頁資料筆數：<asp:DropDownList ID="DropDownList1" runat="server" 
        AutoPostBack="True">
        <asp:ListItem>20</asp:ListItem>
        <asp:ListItem>50</asp:ListItem>
        <asp:ListItem>100</asp:ListItem>
        <asp:ListItem Value="0">不分頁</asp:ListItem>
    </asp:DropDownList> 
   
 <div class="table-wrapper">

   <asp:GridView ID="GridViewSpecimens" runat="server" 
        AutoGenerateColumns="False"  GridLines="None" 
        BorderStyle="None">
    </asp:GridView>
        
        <br />
   
        
        </div>
        </section>
                    </div>
            </div>

            </section>
        </div>

     <asp:SqlDataSource ID="SDSSpecimensList" runat="server" >
    
    </asp:SqlDataSource>

   
</asp:Content>

