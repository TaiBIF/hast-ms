<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageSinicaOutSkirts.master" AutoEventWireup="false" CodeFile="SinicaOutskirtsListC.aspx.vb" Inherits="Project_SinicaOutskirtsListC" %>

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
            
         #header_menu      
            {
            	margin-left:300px;
            	background-color:White;
            	
            }
            
        
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
            
            .main_list table,.main_list tr,.main_list td
            {
    	        border-width:2px;
    	        border-color:White;
    	        border-style:solid;       	        	
            }
        
        #content
            {
            	margin-left:20px;
            }
        
        #menu_2
            {
            	margin-left:270px;
            }
        
     </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="menu_2">
        <asp:Menu ID="Menu2" runat="server" Font-Size="10pt" Orientation="Horizontal" 
            StaticDisplayLevels="2">
            <Items>
                <asp:MenuItem Text="中研院近郊數位植物誌" Value="中研院近郊數位植物誌">
                    <asp:MenuItem NavigateUrl="~/Project/SinicaOutskirtsIntroC.aspx" Text="簡介" 
                        Value="簡介"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/Project/SinicaOutskirtsListC.aspx" Text="植物名錄" 
                        Value="植物名錄"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/Project/SinicaOutskirtsHierachicalC.aspx" 
                        Text="植物名錄–階層" Value="植物名錄–階層"></asp:MenuItem>                    
                </asp:MenuItem>
            </Items>
        </asp:Menu>
    </div>
    <br />
    <b><label id='top' >中研院近郊 － 植物名錄清單</label></b>
    <div id='content' class="listShow">    
        類別 <asp:DropDownList ID="DDListClass" runat="server" AutoPostBack="True">
        </asp:DropDownList>
        <br />
        <br />         
         <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
             CssClass="main_list" HorizontalAlign="Center" Width="96%" 
            AllowSorting="True" >
            <RowStyle CssClass="specimen_list_row" />
            <Columns>
                <asp:BoundField DataField="listID" HeaderText="List No." Visible="False" >
                    <ItemStyle Width="40px" />
                </asp:BoundField>
                <asp:BoundField DataField="speciesID" HeaderText="Sp. ID" Visible="False" >
                     <ItemStyle Width="40px" />
                </asp:BoundField>      
                <asp:BoundField DataField="classC" HeaderText="綱" SortExpression="classC"  >
                    <ItemStyle Width="60px" />
                </asp:BoundField>
                <asp:BoundField DataField="familyE" HeaderText="Family Name" 
                    SortExpression="familyE" >
                    <ItemStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="familyC" HeaderText="科名" SortExpression="familyC"  >
                    <ItemStyle Width="80px" />
                </asp:BoundField>
                <asp:HyperLinkField DataNavigateUrlFields="listID" 
                    DataNavigateUrlFormatString="~/Project/SpeciesDetailC.aspx?lid={0}&QP=SinicaOutskirts" 
                    DataTextField="speciesE" HeaderText="Scientific Name" Target="_blank" 
                    SortExpression="speciesE" />
                <asp:BoundField DataField="speciesC" HeaderText="中文名" 
                    SortExpression="speciesC" >
                    <ItemStyle Width="100px" />
                </asp:BoundField>
                
            </Columns>
            <HeaderStyle CssClass="specimen_list_header" />
            <AlternatingRowStyle CssClass="specimen_list_alterrow" />
        </asp:GridView>
      </div>
    
        <asp:SqlDataSource ID="SDSList" runat="server"></asp:SqlDataSource>
</asp:Content>

