<%@ Page Title="" Language="VB" MasterPageFile="~/HAST/MasterPages/ContentC.master" AutoEventWireup="false" CodeFile="ExchangeToList.aspx.vb" Inherits="HAST_ExchangeToList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="wrapper style6">
		<section class="container">
			<header>
				<h5>中研院植物標本館 > 交換標本 > 交換出標本清單 </h5>
			</header>
        </section>
    </div>
        		<!-- Main-->

    <div class="wrapper style2">
    

<section class="container">
            <div class="row 150%">

				
                <p>&nbsp;</p>

				

				
				

				<div class="10u 12u(2) important(2)">
<p>&nbsp;&nbsp;&nbsp;</p>

        <section id="content">

   
 <div class="table-wrapper">
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="batchNum" HeaderText="交換批次" SortExpression="batchNum" />
                        <asp:BoundField DataField="institutionE" HeaderText="交換單位" SortExpression="institutionE" />                        
                        <asp:HyperLinkField HeaderText="館號" DataNavigateUrlFields="specimenOrderNum" DataNavigateUrlFormatString="~/Specimens/specimenDetailC.aspx?specimenOrderNum={0}" DataTextField="specimenOrderNum" />
                        <asp:BoundField DataField="exchDate" DataFormatString="{0:d}" HeaderText="交換日期" SortExpression="exchDate" />
                        <asp:BoundField DataField="verFamilyE" HeaderText="科名" SortExpression="verFamilyE" />
                        <asp:BoundField DataField="verFamilyC" HeaderText="中文科名" SortExpression="verFamilyC" />
                        <asp:BoundField DataField="verSpeciesE" HeaderText="學名" SortExpression="verSpeciesE" />
                        <asp:BoundField DataField="verSpeciesC" HeaderText="中文名" SortExpression="verSpeciesC" />
                    </Columns>
                </asp:GridView>

        
        
        
        
        
        
        <br />
   
        
        </div>
        </section>
                    </div>
            </div>

            </section>
        </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>" SelectCommand="SELECT [batchNum], institutionE, [specimenOrderNum], [exchDate], [verFamilyE], [verFamilyC], [verSpeciesE], [verSpeciesC] FROM [vwExchangeToList] WHERE ([batchNum] = @batchNum) ORDER BY [verFamilyE], [verSpeciesE]">
            <SelectParameters>
                <asp:QueryStringParameter Name="batchNum" QueryStringField="batchNum" Type="Int16" />
            </SelectParameters>
        </asp:SqlDataSource>
    
</asp:Content>

