<%@ Page Language="VB" MasterPageFile="~/MasterPageTWFloraE.master" AutoEventWireup="false" CodeFile="ImageQueryE.aspx.vb" Inherits="Photo_ImageQueryE" title="HAST - Living Plant Images Query" %>

<%@ Register src="../Ascx/DDListScientificName.ascx" tagname="DDListScientificName" tagprefix="uc1" %>
<%@ Register src="../Ascx/DDListLocation.ascx" tagname="DDListLocation" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <link href="../Styles/Style.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/TWFlora.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div>
        <table class="query_form">
            <tr>
                <td width="50px">
                    &nbsp;</td>
                <td width="130px">
                    &nbsp;</td>
                <td width="800px">
                                   
                                    </td>
                                </tr>
                                <tr>
                                    <td width="50px">
                                        &nbsp;</td>
                                    <td width="130px">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td width="50px">
                                        &nbsp;</td>
                                    <td width="130px">
                                        Plant Name</td>
                <td>
                    <asp:TextBox ID="TextBoxScientificName" runat="server" Width="300px"></asp:TextBox>
                    </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <uc1:DDListScientificName ID="DDListScientificName1" runat="server" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>                
            </tr>            
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    Photographer</td>
                <td>
                    <asp:DropDownList ID="DDListCollector" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    Photo Date</td>
                <td>
                    <asp:DropDownList ID="DDListCollectionMonth" runat="server">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem Value="1">Jan</asp:ListItem>
                        <asp:ListItem Value="2">Feb</asp:ListItem>
                        <asp:ListItem Value="3">Mar</asp:ListItem>
                        <asp:ListItem Value="4">Apr</asp:ListItem>
                        <asp:ListItem Value="5">May</asp:ListItem>
                        <asp:ListItem Value="6">Jun</asp:ListItem>
                        <asp:ListItem Value="7">Jul</asp:ListItem>
                        <asp:ListItem Value="8">Aug</asp:ListItem>
                        <asp:ListItem Value="9">Sep</asp:ListItem>
                        <asp:ListItem Value="10">Oct</asp:ListItem>
                        <asp:ListItem Value="11">Nov</asp:ListItem>
                        <asp:ListItem Value="12">Dec</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>            
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    Locality</td>
                <td>
                    <asp:TextBox ID="TextBoxLocation" runat="server" Width="150px"></asp:TextBox>
                    </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <uc2:DDListLocation ID="DDListLocation1" runat="server" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>                
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Query" />
                    &nbsp;
                    <asp:Button ID="Button2" runat="server" Text="Reset" />
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </div>
</asp:Content>

