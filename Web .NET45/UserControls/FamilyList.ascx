<%@ Control Language="VB" AutoEventWireup="false" CodeFile="FamilyList.ascx.vb" Inherits="UserControls_FamilyList" %>

             
       
        <asp:DataList ID="DataListGroup" runat="server" RepeatDirection="Horizontal" 
            HorizontalAlign="Center" RepeatColumns="2">
            <ItemTemplate>
                <asp:HyperLink ID="HyperLinkGroup" runat="server">HyperLink</asp:HyperLink>
                <asp:DataList ID="DataListFirstWord" runat="server" RepeatDirection="Horizontal" RepeatColumns="15">
                    <ItemTemplate>
                        <asp:Label ID="LabelFirstWord" runat="server" Text='<%# Eval("fword") %>'></asp:Label>
                    </ItemTemplate>
                </asp:DataList>
            </ItemTemplate>
        </asp:DataList>
        <br />
        <asp:DataList ID="DataListStroke" runat="server">
            <ItemTemplate>
                <div>
                    <asp:Label ID="LabelGroup" runat="server" >labelGroup</asp:Label>                    
                    <br />
                    <div class="family_list">
                        <asp:DataList ID="DataListFamily" runat="server" RepeatColumns="1" 
                            onitemdatabound="DataListFamily_ItemDataBound">
                            <ItemTemplate>
                                <div>
                                    <asp:HyperLink ID="HyperLinkFamily" runat="server" Target="_self">HyperLinkFamily</asp:HyperLink>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                    </div>
                    <a href='#top' >Top ↑</a>
                </div>
                
                <br />                
            </ItemTemplate>                    
        </asp:DataList>




