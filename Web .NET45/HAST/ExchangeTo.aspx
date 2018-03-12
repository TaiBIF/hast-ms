<%@ Page Title="" Language="VB" MasterPageFile="~/HAST/MasterPages/ContentC.master" AutoEventWireup="false" CodeFile="ExchangeTo.aspx.vb" Inherits="HAST_ExchangeTo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="wrapper style6">
		<section class="container">
			<header>
				<h5>中研院植物標本館 > 交換標本 > 交換出批次 </h5>
			</header>
        </section>
    </div>
        		<!-- Main-->

    <div class="wrapper style2">
    

<section class="container">
            <div class="row 150%">

				
                <p>&nbsp;</p>

				

				<div class="10u 12u(2) important(2)">
<p>&nbsp;&nbsp;&nbsp;目前交換出標本共 48373 份</p>

        <section id="content">

   
 <div class="table-wrapper">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="交換批次" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:HyperLinkField DataNavigateUrlFields="交換批次" DataNavigateUrlFormatString="~/HAST/ExchangeToList.aspx?batchNum={0}" DataTextField="交換批次" HeaderText="交換批次" />
                        <asp:BoundField DataField="交換日期" DataFormatString="{0:d}" HeaderText="交換日期" SortExpression="交換日期" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>" SelectCommand="SELECT [交換批次], [交換日期], [交換單位], [數量] FROM [vwExchangeToBatch] ORDER BY [交換批次] DESC"></asp:SqlDataSource>
    
</asp:Content>

