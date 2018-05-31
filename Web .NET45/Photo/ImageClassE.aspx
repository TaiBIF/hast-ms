<%@ Page Language="VB" MasterPageFile="~/MasterPageTWFloraE.master" AutoEventWireup="false" CodeFile="ImageClassE.aspx.vb" Inherits="Photo_ImageClassE" title="HAST - Living plant images" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <link href="../Styles/Style.css" rel="stylesheet" type="text/css" />   
    <link href="../Styles/TWFlora.css" rel="stylesheet" type="text/css" />
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="content">
        
        <asp:DataList ID="DataListClass" runat="server">
        <ItemTemplate>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            
                <asp:DataList ID="DataListFamily" runat="server" cellpadding="10" 
                    CellSpacing="10" CssClass="imagesList" repeatColumns="5" 
                    repeatdirection="Horizontal" 
                onitemcreated="DataListFamily_ItemCreated" >
                    <ItemStyle VerticalAlign="Top" />
                    <ItemTemplate>
                        <div class="albumpic">
                            <asp:HyperLink ID="HyperLink3" runat="server" target="_self">
                            <!--<asp:Image ID="Image1" runat="server" />-->
                            <img alt="" src='<%# GetImage(Eval("imageCode")) %>'> </img></asp:HyperLink>
                        </div>
                        <div class="picNote">
                            <asp:HyperLink ID="HyperLink2" runat="server" target="_self" ></asp:HyperLink>
                            <br />
                            <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                            <br />
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            
        </ItemTemplate>
    </asp:DataList>
        
    
    </div>
</asp:Content>

