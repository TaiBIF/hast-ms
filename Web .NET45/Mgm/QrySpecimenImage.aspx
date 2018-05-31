<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="QrySpecimenImage.aspx.vb" Inherits="Mgm_QrySpecimenImage" title="未命名頁面" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table border="0" cellpadding="4" cellspacing="0" style="font-size: 12pt">
        <tr>
            <td style="font-size: 12pt; width: 50px">
            </td>
            <td style="width: 50px; font-size: 12pt;">
            </td>
            <td style="width: 100px">
            </td>
            <td style="width: 50px; font-size: 12pt; height: 20px;">
            </td>
            <td style="width: 250px; font-size: 12pt; height: 20px; text-align: right;">
            </td>
        </tr>
        <tr>
            <td style="font-size: 12pt; width: 50px">
            </td>
            <td style="width: 50px; font-size: 12pt;">
                館號：</td>
            <td style="width: 200px; font-size: 12pt; height: 20px;">
                <asp:TextBox ID="TextBoxSpecimenOrderNum" runat="server" Font-Size="12pt"></asp:TextBox>
            </td>
            <td style="width: 50px; font-size: 12pt; height: 20px;">
                <asp:Button ID="btnQry" runat="server" Text="查詢" />
            </td>
            <td style="width: 250px; font-size: 12pt; height: 20px; text-align: right;">
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="font-size: 12pt; width: 50px">
            </td>
            <td style="width: 50px; font-size: 12pt;">
                &nbsp;</td>
            <td style="width: 100px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBoxSpecimenOrderNum" Display="Dynamic" 
                    ErrorMessage="請輸入館號" Font-Size="10pt"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="TextBoxSpecimenOrderNum" Display="Dynamic" 
                    ErrorMessage="請輸入六位以下數字" Font-Size="10pt" ValidationExpression="\d{1,6}" 
                    Width="161px"></asp:RegularExpressionValidator>
                <br />
            </td>
            <td style="width: 50px; font-size: 12pt; height: 20px;">
            </td>
            <td style="width: 250px; font-size: 12pt; height: 20px; text-align: right;">
                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td style="font-size: 12pt; width: 50px">
            </td>
            <td style="width: 50px; font-size: 12pt;">
            </td>
            <td style="width: 100px">
            </td>
            <td style="width: 50px; font-size: 12pt; height: 20px;">
            </td>
            <td style="width: 250px; font-size: 12pt; height: 20px; text-align: right;">
            </td>
        </tr>
    </table>
    <br />
    <table border="0" cellpadding="4" cellspacing="0">
        <tr>
            <td style="width: 50px">
            </td>
            <td style="width: 400px">
            </td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td style="width: 50px">
            </td>
            <td style="width: 400px">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="3">
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <RowStyle ForeColor="#000066" />
                    <Columns>
                        <asp:HyperLinkField DataNavigateUrlFields="specimenOrderNum" 
                            DataNavigateUrlFormatString="http://gissrv1.sinica.edu.tw/lizardtech/iserv/calcrgn?cat=plant_sid&amp;item=S_{0:000000}.SID&amp;style=default/view.xsl&amp;wid=800&amp;hei=800&amp;browser=win_ns6&amp;plugin=false" 
                            DataTextField="specimenOrderNum" HeaderText="館號" Target="_blank" 
                            DataTextFormatString="S_{0:000000}">
                            <ItemStyle HorizontalAlign="Center" Width="150px" />
                        </asp:HyperLinkField>
                        <asp:BoundField DataField="diskNo" HeaderText="光碟編號">
                            <ItemStyle HorizontalAlign="Center" Width="150px" />
                        </asp:BoundField>
                    </Columns>
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
            </td>
            <td style="width: 100px">
            </td>
        </tr>
    </table>
    <br />
    <br />
</asp:Content>

