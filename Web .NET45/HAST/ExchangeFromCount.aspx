<%@ Page Title="" Language="VB" MasterPageFile="~/HAST/MasterPages/ContentC.master" AutoEventWireup="false" CodeFile="ExchangeFromCount.aspx.vb" Inherits="HAST_ExchangeFromCount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="wrapper style6">
		<section class="container">
			<header>
				<h5>中研院植物標本館 > 交換標本 > 交換入標本統計 </h5>
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
    &nbsp;&nbsp;交換入標本（已清查）共 4978 份 （資料尚待清查）</p>
                        

        <section id="content">

   
 <div class="table-wrapper">
    
       
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
    <Columns>
        <asp:BoundField DataField="交換單位" HeaderText="交換單位" SortExpression="交換單位" />
        <asp:BoundField DataField="數量" HeaderText="數量" SortExpression="數量" />
    </Columns>
    </asp:GridView>
        
        
       
        
        
        
        
        <br />
   
        
        </div>
        </section>
                    </div>
            </div>

            </section>
        </div>
 
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>" SelectCommand="SELECT [交換單位], [數量] FROM [vwExchangeFromCount] ORDER BY [交換單位]"></asp:SqlDataSource>
    
       
</asp:Content>

