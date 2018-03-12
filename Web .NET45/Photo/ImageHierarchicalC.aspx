<%@ Page Language="VB" MasterPageFile="~/MasterPageTWFlora.master" AutoEventWireup="false" CodeFile="ImageHierarchicalC.aspx.vb" Inherits="Photo_ImageHierarchicalC" title="HAST - 台灣本土植物資料庫 - 生態影像查詢結果" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <link href="../Styles/Style.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/TWFlora.css" rel="stylesheet" type="text/css" />
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="content">
        
        <div id='upper_taxon'>        
            <b><asp:Label ID="LabelUpperTaxon" runat="server" Text="Label"></asp:Label><br /></b>
        </div>
        <br />
        
        <asp:DataList ID="DataListFamily" runat="server">
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                
                    <asp:DataList ID="DataListSpecies" runat="server" cellpadding="10" 
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
                
                </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>

