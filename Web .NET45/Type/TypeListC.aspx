<%@ Page Language="VB" MasterPageFile="~/MasterPageTWFlora.master" AutoEventWireup="false" CodeFile="TypeListC.aspx.vb" Inherits="Type_TypeListC" title="HAST - 植物模式標本" %>

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
    <div id='type_header' style="font-weight: normal; font-family: 標楷體">
        &nbsp;<img src="../images/title.jpg" />
        <br />
        <img id="IMG1" onclick="return IMG1_onclick()" src="../images/leave2.jpg" /><font 
            color="#336600" face="標楷體" size="4">模式標本目錄</font>
        <br />
    </div>
    <div id='type_main' style="font-weight: normal; font-family: 標楷體">
        <table style="width: 900px">
            <tr>
                <td style="width: 223px; height: 13px">
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                        Width="192px">
                    </asp:DropDownList>
                </td>
                <td style="width: 334px; height: 13px" align="right">
                    排序方式：</td>
                <td style="height: 13px">                    
                    <asp:RadioButtonList ID="RadioButtonListSortBy" runat="server" 
                        AutoPostBack="True" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="species">學名</asp:ListItem>
                        <asp:ListItem Value="typeCate">模式</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
        </table>
    
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            Font-Names="標楷體" Font-Overline="False" Font-Size="14px" ForeColor="#336600" 
            Height="32px" Width="900px">
            <Columns>
                <asp:BoundField DataField="verFamilyE" HeaderText="科名" />
                <asp:BoundField DataField="verSpeciesE" HeaderText="學名" />                
                <asp:BoundField DataField="verSpeciesC" HeaderText="中文名" />
                <asp:HyperLinkField DataNavigateUrlFields="LiteraryLink" 
                    DataTextField="reference" HeaderText="發表文獻" />
                <asp:HyperLinkField DataNavigateUrlFields="specimenOrderNum" 
                    DataNavigateUrlFormatString="~/Specimens/specimenDetailC.aspx?specimenOrderNum={0}" 
                    DataTextField="specimenOrderNum" HeaderText="館號" Target="_blank" />
                <asp:BoundField DataField="typeCategory" HeaderText="模式" />
                
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

