<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="FloraAreaC.aspx.vb" 
 enableEventValidation="false" Inherits="Mgm_Project_FloraAreaC" title="HAST - 地點-植物名錄" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../../Styles/Style.css" rel="stylesheet" type="text/css" />
    <link href="../../Styles/TWFlora.css" rel="stylesheet" type="text/css" />
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
        
        .main_list table,.main_list tr,.main_list td
        {
        	border-width:2px;
        	border-color:White;
        	border-style:solid;       	        	
        }
        
        
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div id="container">
        <br />
        <a href="../Project/FloraAreaSelect.aspx">回地點選擇頁</a>
        <br />
        <br />
        類別 <asp:DropDownList ID="DDListClass" runat="server" AutoPostBack="True">
        </asp:DropDownList>
        <br />
        <br />
         <asp:HyperLink ID="HyperLink2" runat="server">新增</asp:HyperLink>
         <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
             CssClass="main_list" HorizontalAlign="Center" Width="96%" >
            <RowStyle CssClass="specimen_list_row" />
            <Columns>
                <asp:BoundField DataField="listID" HeaderText="List No." >
                    <ItemStyle Width="40px" />
                </asp:BoundField>
                <asp:BoundField DataField="speciesID" HeaderText="Sp. ID" >
                     <ItemStyle Width="40px" />
                </asp:BoundField>      
                <asp:BoundField DataField="classC" HeaderText="綱"  >
                    <ItemStyle Width="60px" />
                </asp:BoundField>
                <asp:BoundField DataField="familyE" HeaderText="Family Name" >
                    <ItemStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="familyC" HeaderText="科名"  >
                    <ItemStyle Width="80px" />
                </asp:BoundField>
                <asp:HyperLinkField DataNavigateUrlFields="listID" 
                    DataNavigateUrlFormatString="~/Project/SpeciesDetailC.aspx?lid={0}" 
                    DataTextField="speciesE" HeaderText="Scientific Name" Target="_blank" />
                <asp:BoundField DataField="speciesC" HeaderText="中文名" >
                    <ItemStyle Width="100px" />
                </asp:BoundField>
                <asp:HyperLinkField Text="編緝" DataNavigateUrlFields="listID" 
                    
                    DataNavigateUrlFormatString="~/Mgm/Project/FloraAreaSpeciesUpdateC.aspx?listID={0}" >
                    <ItemStyle Width="40px" />
                </asp:HyperLinkField>
                <asp:HyperLinkField DataNavigateUrlFields="areaID" 
                    DataNavigateUrlFormatString="~/Mgm/Project/FloraAreaSpeciesUpdateC.aspx?areaID={0}" 
                    Text="新增" >
                    <ItemStyle Width="40px" />
                </asp:HyperLinkField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnDelete" runat="server" 
                            CommandArgument='<%# Eval("listID") %>' Text="刪除" onclick="btnDelete_Click" 
                            OnClientClick="return confirm('確定刪除這筆資料？')"/>
                    </ItemTemplate>
                    <ItemStyle Width="40px" />
                </asp:TemplateField>
                <asp:HyperLinkField DataNavigateUrlFields="speciesID,areaID" 
                    DataNavigateUrlFormatString="~/Mgm/Project/speciesDescription.aspx?speciesID={0}&amp;areaID={1}" 
                    Target="_blank" Text="描述/分佈" />
                <asp:HyperLinkField DataNavigateUrlFields="speciesID" 
                    DataNavigateUrlFormatString="~/Mgm/Project/EditSpeciesCharacteristics.aspx?speciesID={0}" 
                    Target="_blank" Text="特徵" />
            </Columns>
            <AlternatingRowStyle CssClass="specimen_list_alterrow" />
        </asp:GridView>
      
    
        <asp:SqlDataSource ID="SDSList" runat="server"></asp:SqlDataSource>
      
    
    </div>
</asp:Content>

