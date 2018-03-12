<%@ Page Language="VB" MasterPageFile="~/MasterPageTWFloraE.master" AutoEventWireup="false" CodeFile="TypeListE.aspx.vb" Inherits="Type_TypeListE" title="HAST - Type specimens" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Styles/Style.css" rel="stylesheet" type="text/css" />   
    <link href="../Styles/TWFlora.css" rel="stylesheet" type="text/css" />
    <style type="text/css" >
        #type_header
            {
            	margin-left:50px;
            }
        #type_main
            {
            	 margin:0px 50px;
            	 
            	 
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id='type_header' style="font-weight: normal">
        &nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Font-Names="Monotype Corsiva" Font-Size="20pt"
            ForeColor="#336600" Text="Herbarium, Research Center for Biodiversity, Academia Sinica, Taipei (HAST)"></asp:Label><br />
        <br />
        <img id="IMG1" src="../images/leave2.jpg" onclick="return IMG1_onclick()" /><font face="Arial" color="#336600" size="4">Vescular
            Plant Type</font><br /><br />
      </div>
    <div id='type_main' style="font-weight: normal" >
        <table style="width: 900px">
            <tr>
                <td style="width: 223px; height: 13px">
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                        Width="192px">
                    </asp:DropDownList>
                </td>
                <td style="width: 334px; height: 13px" align="right">
                    Order by </td>
                <td style="height: 13px">                    
                    <asp:RadioButtonList ID="RadioButtonListSortBy" runat="server" 
                        AutoPostBack="True" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="species">Scientific Name</asp:ListItem>
                        <asp:ListItem Value="typeCate">Type</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
        </table>
    
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            Font-Overline="False" Font-Size="14px" ForeColor="#336600" 
            Height="32px" Width="900px">
            <Columns>
                <asp:BoundField DataField="verFamilyE" HeaderText="Family Name" />
                <asp:BoundField DataField="verSpeciesE" HeaderText="Scientific Name" />                                
                <asp:HyperLinkField DataNavigateUrlFields="LiteraryLink" 
                    DataTextField="reference" HeaderText="Referance" />
                <asp:HyperLinkField DataNavigateUrlFields="specimenOrderNum" 
                    DataNavigateUrlFormatString="~/Specimens/specimenDetailC.aspx?specimenOrderNum={0}" 
                    DataTextField="specimenOrderNum" HeaderText="HAST ID" Target="_blank" />
                <asp:BoundField DataField="typeCategory" HeaderText="Type" />
                
            </Columns>
            <RowStyle BackColor="#FFFFCC" BorderColor="#CCFFCC" Font-Italic="False" 
                Font-Names="Verdana" />
            <HeaderStyle BackColor="#CCFFCC" />
        </asp:GridView>
        
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>" SelectCommand="SELECT [SN], [specimenOrderNum], [subjNameE], [speciesE], [speciesC], [reference], [literaryLink], [typeCategory] FROM [vwTypeDetail]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>" 
                SelectCommand="SELECT [SN], [specimenOrderNum], [subjNameE], [speciesE], [speciesC], [reference], [literaryLink], [typeCategory] FROM [vwTypeDetail]">
            </asp:SqlDataSource>
    </div>
</asp:Content>

