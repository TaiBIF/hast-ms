<%@ Page Title="" Language="VB" MasterPageFile="~/HAST/MasterPages/ContentC.master" AutoEventWireup="false" CodeFile="DupsDetail.aspx.vb" Inherits="HAST_DupsDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

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
    
            <div class="row 150%">

				

				<div class="10u 12u(2) important(2)">


        <section id="content">

   
 <div class="table-wrapper">
    
        
        <br />
   
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDS">
            <Columns>
                <asp:BoundField DataField="CKSN" HeaderText="清查序號" />
                <asp:BoundField DataField="familyE" HeaderText="科名" />
                <asp:BoundField DataField="genusE" HeaderText="屬名" />
                <asp:BoundField DataField="speciesE" HeaderText="學名" />
                <asp:BoundField DataField="speciesC" HeaderText="中文名" />
                <asp:BoundField DataField="collectNum" HeaderText="採集號" />                
                <asp:CheckBoxField DataField="blnBored" HeaderText="蟲蛀" />
                <asp:CheckBoxField DataField="blnDestroyed" HeaderText="損毀" />
                <asp:CheckBoxField DataField="blnNoFlwFruit" HeaderText="缺花果" />
                <asp:BoundField DataField="specimenOrderNum" HeaderText="正份館號" />
            </Columns>
        </asp:GridView>
    
    <asp:SqlDataSource ID="SqlDS" runat="server"></asp:SqlDataSource>

        </div>
        </section>
                    </div>
            </div>

            </section>
        </div>

</asp:Content>

