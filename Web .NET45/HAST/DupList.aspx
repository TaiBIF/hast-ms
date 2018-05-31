<%@ Page Title="" Language="VB" MasterPageFile="~/HAST/MasterPages/ContentC.master" AutoEventWireup="false" CodeFile="DupList.aspx.vb" Inherits="HAST_DupList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>

    <div class="wrapper style6">
		<section class="container">
			<header>
				<h5>中研院植物標本館 > 複份標本 > 複份標本統計 </h5>
			</header>
        </section>
    </div>
        		<!-- Main-->

    <div class="wrapper style2">
    

<section class="container">
    <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" RepeatDirection="Horizontal" RepeatLayout="Flow">
            <asp:ListItem Value="%">全部</asp:ListItem>
            <asp:ListItem Value="1">蕨類植物</asp:ListItem>
            <asp:ListItem Value="2">裸子植物</asp:ListItem>
            <asp:ListItem Value="3">雙子葉植物</asp:ListItem>
            <asp:ListItem Value="4">單子葉植物</asp:ListItem>
        </asp:RadioButtonList>
            <div class="row 150%">

				<p>目前庫存複份共 34731 份</p>

				<div class="10u 12u(2) important(2)">


        <section id="content">

   
 <div class="table-wrapper">
    
        
        <br />
   
        <asp:GridView ID="GridViewFamily" runat="server" AutoGenerateColumns="False" DataKeyNames="familyID" >
            <Columns>
                <asp:BoundField DataField="familyE" HeaderText="科名" />
                <asp:BoundField DataField="familyC" HeaderText="中文科名" />
                <asp:BoundField DataField="total" HeaderText="小計" />
                <asp:HyperLinkField DataNavigateUrlFields="familyID" DataNavigateUrlFormatString="~/HAST/DupsListGenus.aspx?familyID={0}" HeaderText="科庫存統計" Text="統計" />
                <asp:HyperLinkField DataNavigateUrlFields="familyID" DataNavigateUrlFormatString="~/HAST/DupsDetail.aspx?familyID={0}" HeaderText="科庫存清單" Text="清單" />
            </Columns>
        </asp:GridView>
        </div>
        </section>
                    </div>
            </div>

            </section>
        </div>
        <asp:SqlDataSource ID="SqlDS" runat="server"></asp:SqlDataSource>
    </div>

</asp:Content>

