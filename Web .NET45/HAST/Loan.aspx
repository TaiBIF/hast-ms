<%@ Page Title="" Language="VB" MasterPageFile="~/HAST/MasterPages/ContentC.master" AutoEventWireup="false" CodeFile="Loan.aspx.vb" Inherits="HAST_Loan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="wrapper style6">
		<section class="container">
			<header>
				<h5>中研院植物標本館 > 借閱標本 > 借入標本 </h5>
			</header>
        </section>
    </div>
        		<!-- Main-->

    <div class="wrapper style2">
    

<section class="container">
    
   
            <div class="row 150%">

				

				<div class="10u 12u(2) important(2)">
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" RepeatDirection="Horizontal" RepeatLayout="Flow">
           
                 <asp:ListItem Value="%">全部</asp:ListItem>
            <asp:ListItem Value="已歸還">已歸還</asp:ListItem>
            <asp:ListItem Value="未歸還">未歸還</asp:ListItem>
        </asp:RadioButtonList>

        <section id="content">

<p>&nbsp;
    &nbsp;&nbsp;
                    </p>
             
            <p>目前借閱標本份共 1685 份</p>
   
 <div class="table-wrapper">
     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" PageSize="50">
         <Columns>
             <asp:BoundField DataField="shippingDate" HeaderText="借出日期" SortExpression="shippingDate" DataFormatString="{0:d}" />
             <asp:BoundField DataField="applicant" HeaderText="借閱人" SortExpression="applicant" />
             <asp:BoundField DataField="institutionAbbr" HeaderText="所屬單位" SortExpression="institutionAbbr" />
             <asp:BoundField DataField="specimenOrderNum" HeaderText="館號" SortExpression="specimenOrderNum" />
             <asp:BoundField DataField="nativeX" HeaderText="國內/外" SortExpression="nativeX" />
             <asp:BoundField DataField="checkinX" HeaderText="歸還" SortExpression="checkinX" />
             <asp:BoundField DataField="verFamilyE" HeaderText="科名" SortExpression="verFamilyE" />
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
<asp:SqlDataSource ID="SqlDataSource1" runat="server"
     ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>" 
                    SelectCommand="SELECT shippingDate, applicant, institutionAbbr, specimenOrderNum, nativeX, checkinX, verFamilyE, verSpeciesC, verSpeciesE
                    FROM vwLoan WHERE (checkinX like @checkinX) ORDER BY shippingDate DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="RadioButtonList1" DefaultValue="%" Name="checkinX" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    
</asp:Content>

