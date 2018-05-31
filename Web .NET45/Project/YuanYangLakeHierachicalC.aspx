﻿<%@ Page Language="VB" MasterPageFile="~/MasterPageYYLC.master" AutoEventWireup="false" CodeFile="YuanYangLakeHierachicalC.aspx.vb" Inherits="Project_YuanYangLakeHierachicalC" title="HAST - 鴛鴦湖自然保留區 - 植物名錄" %>

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
         
         #menu_2
            {
            	margin-left:270px;
            }
                
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="menu_2">
        <asp:Menu ID="Menu2" runat="server" Font-Size="10pt" Orientation="Horizontal" 
                StaticDisplayLevels="2">
                <Items>
                    <asp:MenuItem Text="鴛鴦湖自然保留區" Value="鴛鴦湖自然保留區">
                        <asp:MenuItem NavigateUrl="~/Project/YuanYangLakeIntroC.aspx" Text="簡介" 
                            Value="簡介"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/Project/YuanYangLakeListC.aspx" Text="植物名錄" 
                            Value="植物名錄"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/Project/YuanYangLakeHierachicalC.aspx" 
                            Text="植物名錄–階層" Value="植物名錄–階層"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/Project/YuanYangLakeQueryC.aspx" Text="植物特徵查詢" 
                            Value="植物特徵查詢"></asp:MenuItem>
                    </asp:MenuItem>
                </Items>
       </asp:Menu>
   </div>
    <br />
        <b><label id='top' >鴛鴦湖自然保留區 - 植物名錄</label></b>
        <br /><br />
    <div id='content' class="listShow">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <p id='order_by'>排序方式：</p>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
                    RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" Value="1">中文</asp:ListItem>
                    <asp:ListItem Value="2">英文</asp:ListItem>
                </asp:RadioButtonList>
                
                <br />
                <asp:TreeView ID="TreeView1" runat="server">
                </asp:TreeView>
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />
        <a href='#top' >Top ↑</a>
    </div>

</asp:Content>

