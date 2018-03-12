<%@ Page Language="VB" MasterPageFile="~/MasterPageBegonia.master" AutoEventWireup="false" CodeFile="BegoniaList.aspx.vb" Inherits="Begonia_BegoniaList" title="HAST - List of Begonia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Styles/Style.css" rel="stylesheet" type="text/css" /> 
    <link href="../Styles/TWFlora.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .StaticMenu
        {
	        background-color:#D3D3D3;
	    }
    </style>  
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="controls">            
           Section:
            <asp:DropDownList ID="DDListSection" runat="server" 
                DataSourceID="SDSSection" DataTextField="sectionName" 
                DataValueField="sectionName" meta:resourcekey="DDListSectionResource1">
            </asp:DropDownList>
    &nbsp;&nbsp;Continent:
            <asp:DropDownList ID="DDListContinent" runat="server" 
                DataSourceID="SDSContinent" DataTextField="continent" 
                DataValueField="continent" meta:resourcekey="DDListContinentResource1">
            </asp:DropDownList>
    &nbsp;&nbsp;Distribution:
            <asp:DropDownList ID="DDListDistribution" runat="server" 
                DataSourceID="SDSDistribution" DataTextField="distribution" 
                DataValueField="distribution" 
                meta:resourcekey="DDListDistributionResource1">
            </asp:DropDownList>
        
            <br />
           <br />
           The first letter in epithet: <asp:DropDownList ID="DDLEpithet" runat="server">
               <asp:ListItem Value=""></asp:ListItem>
               <asp:ListItem Value="?">?</asp:ListItem>
               <asp:ListItem Value="x">×</asp:ListItem>               
               <asp:ListItem Value="a">A</asp:ListItem>
               <asp:ListItem Value="b">B</asp:ListItem>
               <asp:ListItem Value="c">C</asp:ListItem>
               <asp:ListItem Value="d">D</asp:ListItem>
               <asp:ListItem Value="e">E</asp:ListItem>
               <asp:ListItem Value="f">F</asp:ListItem>
               <asp:ListItem Value="g">G</asp:ListItem>
               <asp:ListItem Value="h">H</asp:ListItem>
               <asp:ListItem Value="i">I</asp:ListItem>
               <asp:ListItem Value="j">J</asp:ListItem>
               <asp:ListItem Value="k">K</asp:ListItem>
               <asp:ListItem Value="l">L</asp:ListItem>
               <asp:ListItem Value="m">M</asp:ListItem>
               <asp:ListItem Value="n">N</asp:ListItem>
               <asp:ListItem Value="o">O</asp:ListItem>
               <asp:ListItem Value="p">P</asp:ListItem>
               <asp:ListItem Value="q">Q</asp:ListItem>
               <asp:ListItem Value="r">R</asp:ListItem>
               <asp:ListItem Value="s">S</asp:ListItem>
               <asp:ListItem Value="t">T</asp:ListItem>
               <asp:ListItem Value="u">U</asp:ListItem>
               <asp:ListItem Value="v">V</asp:ListItem>
               <asp:ListItem Value="w">W</asp:ListItem>
               <asp:ListItem Value="x">X</asp:ListItem>
               <asp:ListItem Value="y">Y</asp:ListItem>
               <asp:ListItem Value="z">Z</asp:ListItem>               
           </asp:DropDownList>
        
            <br />
           <br />
           <asp:TextBox ID="TextBox1" runat="server" Width="150px"></asp:TextBox>
&nbsp;
            <asp:Button ID="BtnQuery" runat="server" Text="Query" 
                meta:resourcekey="BtnQueryResource1" />
    &nbsp;
            <asp:Button ID="BtnReset" runat="server" Text="Reset" 
                meta:resourcekey="BtnResetResource1" />
            
         </div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            cssClass="listShow" meta:resourcekey="GridView1Resource1">
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="speciesID" 
                    DataNavigateUrlFormatString="~/Taxon/SpeciesDetailC.aspx?speciesID={0}&QP=Begonia" 
                    DataTextField="speciesE" HeaderText="Scientific Name" 
                    SortExpression="speciesE" meta:resourcekey="HyperLinkFieldResource1" >
                    <ItemStyle Width="460px" />
                </asp:HyperLinkField>
                <asp:BoundField DataField="speciesC" HeaderText="Common Name" 
                    SortExpression="speciesC" meta:resourcekey="BoundFieldResource1" >
                    <ItemStyle Width="120px" />
                </asp:BoundField>
                <asp:BoundField DataField="sectionName" HeaderText="Section" 
                    SortExpression="sectionName" meta:resourcekey="BoundFieldResource2" >
                    <ItemStyle Width="120px" />
                </asp:BoundField>
                <asp:BoundField DataField="distribution" HeaderText="Distribution" 
                    SortExpression="distribution" meta:resourcekey="BoundFieldResource3" >
                    <ItemStyle Width="160px" />
                </asp:BoundField>
                <asp:BoundField DataField="continent" HeaderText="Continent" 
                    SortExpression="continent" meta:resourcekey="BoundFieldResource4" >
                    <ItemStyle Width="100px" />
                </asp:BoundField>
            </Columns>
            <HeaderStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="#CCCCCC" />
        </asp:GridView>
    
    
        <asp:SqlDataSource ID="SDSSection" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ScientificNameConnectionString %>" 
            SelectCommand="SELECT DISTINCT [sectionName] FROM [species] WHERE [genusID] = 1007 ORDER BY [sectionName]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SDSContinent" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ScientificNameConnectionString %>" 
            SelectCommand="SELECT DISTINCT [continent] FROM [species] WHERE [genusID] = 1007 ORDER BY [continent]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SDSDistribution" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ScientificNameConnectionString %>" 
            SelectCommand="SELECT DISTINCT [distribution] FROM [species] WHERE ([genusID] =1007) ORDER BY [distribution]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SDSBegoniaList" runat="server"></asp:SqlDataSource>
        <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />
</asp:Content>

