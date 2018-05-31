<%@ Page Language="VB" MasterPageFile="~/MasterPageYYLC.master" AutoEventWireup="false" CodeFile="YuanYangLakeResultC.aspx.vb" Inherits="Project_YuanYangLakeResultC" title="未命名頁面" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Styles/Style.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/TWFlora.css" rel="stylesheet" type="text/css" /> 
    
    <style type="text/css">
    
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
    
    <div id="content">
       
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" >
            <Columns>
                <asp:BoundField DataField="speciesE" HeaderText="學名" />
                <asp:BoundField DataField="speciesC" HeaderText="中文名" />
            </Columns>
                    
        </asp:GridView>       
       
       
        <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal">
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("characteristicC") %>'></asp:Label>
                &nbsp;/
            </ItemTemplate>
        </asp:DataList>
        
        <br />
        <asp:DataList ID="DataListSpecies" runat="server">
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                
                    <asp:DataList ID="DataListImages" runat="server" cellpadding="10" 
                        CellSpacing="10" CssClass="imagesList" repeatColumns="5" 
                        repeatdirection="Horizontal">
                        <ItemStyle VerticalAlign="Top" />
                        <ItemTemplate>
                            <div class="albumpic">
                                <asp:HyperLink ID="HyperLink3" runat="server" 
                                    NavigateUrl='<%# "~/Photo/ImageDetailC.aspx?imageCode=" & Eval("imageCode")%>' 
                                    target="_blank">
                                <!--<asp:Image ID="Image1" runat="server" />-->
                                <img alt="" src='<%# GetImage(Eval("imageCode")) %>'> </img></asp:HyperLink>
                            </div>
                            <div class="picNote">
                                ID:<asp:HyperLink ID="HyperLink2" runat="server" 
                                    NavigateUrl='<%# "~/Photo/ImageDetailC.aspx?imageCode=" & Eval("imageCode") %>' 
                                    target="_blank" text='<%# Eval("imageCode") %>'></asp:HyperLink>
                                <br />
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                <br />
                </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>

