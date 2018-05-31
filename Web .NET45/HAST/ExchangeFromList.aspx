<%@ Page Title="" Language="VB" MasterPageFile="~/HAST/MasterPages/ContentC.master" AutoEventWireup="false" CodeFile="ExchangeFromList.aspx.vb" Inherits="HAST_ExchangeFromList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="wrapper style6">
		<section class="container">
			<header>
				<h5>中研院植物標本館 > 交換標本 > 交換入標本清單 </h5>
			</header>
        </section>
    </div>
        		<!-- Main-->

    <div class="wrapper style2">
    

<section class="container">
            <div class="row 150%">

				
                <p>&nbsp;</p>
                				
				

				<div class="10u 12u(2) important(2)">
<p>&nbsp;
    &nbsp;&nbsp;
                    </p>
                        

        <section id="content">

   
 <div class="table-wrapper">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" PageSize="50">
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="館號" DataNavigateUrlFormatString="~/Specimens/SpecimenDetailC.aspx?specimenOrderNum={0}" DataTextField="館號" HeaderText="館號" />
            <asp:BoundField DataField="交換單位" HeaderText="交換單位" SortExpression="交換單位" />
            <asp:BoundField DataField="科名" HeaderText="科名" SortExpression="科名" />
            <asp:BoundField DataField="科中文名" HeaderText="科中文名" SortExpression="科中文名" />
            <asp:BoundField DataField="學名" HeaderText="學名" SortExpression="學名" />
            <asp:BoundField DataField="中文名" HeaderText="中文名" SortExpression="中文名" />
        </Columns>
    </asp:GridView>
        
        <br />
   
        
        </div>
        </section>
                    </div>
            </div>

            </section>
        </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>" SelectCommand="SELECT [館號], [交換單位], [科名], [科中文名], [學名], [中文名] FROM [vwExchangeFromList] ORDER BY [交換單位], [科名], [學名]"></asp:SqlDataSource>
</asp:Content>

