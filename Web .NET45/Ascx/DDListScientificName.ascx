<%@ Control Language="VB" AutoEventWireup="false" CodeFile="DDListScientificName.ascx.vb" Inherits="Ascx_DDListScientificName" %>

<div>
    <table border="0">
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