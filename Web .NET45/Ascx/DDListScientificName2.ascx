<%@ Control Language="VB" AutoEventWireup="false" CodeFile="DDListScientificName2.ascx.vb" Inherits="Ascx_WebUserControl" %>

<div>
    <table border="0">

        <tr>
            <td width="50px">
                &nbsp;</td>
            <td width="130px">
                &nbsp;</td>
            <td width="800px">

                <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem Value="0">全部科名</asp:ListItem>
                    <asp:ListItem Value="1">Tracheophyte 類群</asp:ListItem>
                </asp:RadioButtonList>

                
                <p><asp:RadioButtonList ID="RadioButtonListTrach" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" RepeatLayout="Flow">
                </asp:RadioButtonList></p>
            </td>

        </tr>

       


        <tr>
            <td width="50px">
                &nbsp;</td>
            <td width="130px">
                <asp:Label ID="LabelOrders" runat="server"></asp:Label>
            </td>
            <td width="800px">

        <asp:DropDownList ID="DDListOrders" runat="server" AutoPostBack="True">
        </asp:DropDownList>
            </td>

        </tr>

        <tr>
            <td width="50px">
                &nbsp;</td>
            <td width="130px">
                <asp:Label ID="LabelFamily" runat="server"></asp:Label>
            </td>
            <td width="800px">

        <asp:DropDownList ID="DDListFamily" runat="server" AutoPostBack="True">
        </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td width="50px">
                &nbsp;</td>
            <td width="130px">
                <asp:Label ID="LabelGenus" runat="server"></asp:Label>
            </td>
            <td width="800px">
        
        <asp:DropDownList ID="DDListGenus" runat="server" AutoPostBack="True">
        </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td width="50px">
                &nbsp;</td>
            <td width="130px">
                <asp:Label ID="LabelSpecies" runat="server"></asp:Label>
            </td>
            <td width="800px">
        <asp:DropDownList ID="DDListSpecies" runat="server">
        </asp:DropDownList>
        
            </td>
        </tr>        
    </table>        
</div>