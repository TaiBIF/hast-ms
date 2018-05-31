<%@ Control Language="VB" AutoEventWireup="false" CodeFile="DDListLocation.ascx.vb" Inherits="Ascx_DDListLocation" %>



    <table border="0">
        <tr>
            <td width="50px">
                &nbsp;</td>
            <td width="130px">
                <asp:Label ID="LabelCountry" runat="server"></asp:Label>
            </td>
            <td >
                <asp:DropDownList ID="DDListCountry" runat="server" AutoPostBack="True">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td width="50px">
                &nbsp;</td>
            <td width="130px">
                <asp:Label ID="LabelAdminDivision" runat="server"></asp:Label>
            </td>
            <td >
                <asp:DropDownList ID="DDListProvince" runat="server" AutoPostBack="True">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td width="50px">
                &nbsp;</td>
            <td width="130px">
                </td>
            <td >
                <asp:DropDownList ID="DDListHsien" runat="server" AutoPostBack="True">
                </asp:DropDownList>        
            </td>
        </tr>
        <tr>
            <td width="50px">
                &nbsp;</td>
            <td width="130px">
                &nbsp;</td>
            <td >
                <asp:DropDownList ID="DDListTown" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td width="50px">
                &nbsp;</td>
            <td width="130px">
                    <asp:Label ID="LabelPark" runat="server"></asp:Label>
            </td>
            <td >
                <asp:DropDownList ID="DDListPark" runat="server">
                </asp:DropDownList>               
            </td>
        </tr>
    </table>
