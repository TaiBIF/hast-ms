<%@ Page Language="VB" MasterPageFile="~/MasterPageTWFlora.master" AutoEventWireup="false" CodeFile="ImageQueryC.aspx.vb" Inherits="Photo_ImageQueryC" title="HAST - 台灣本土植物資料庫 - 植物生態影像查詢" %>

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
                    &nbsp;</td>
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
                    植物名</td>
                <td>
            <asp:TextBox ID="TextBoxScientificName" runat="server" Width="300px"></asp:TextBox>
</td>
</tr>
            
            <tr>
                <td colspan="3">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <uc1:DDListScientificName ID="DDListScientificName1" runat="server" />
                        </ContentTemplate>
                    </asp:UpdatePanel>&nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    拍攝者</td>
                <td>
                    <asp:DropDownList ID="DDListAuthor" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    拍攝月份</td>
                <td>
                    <asp:DropDownList ID="DDListCollectionMonth" runat="server">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem Value="1">一月</asp:ListItem>
                        <asp:ListItem Value="2">二月</asp:ListItem>
                        <asp:ListItem Value="3">三月</asp:ListItem>
                        <asp:ListItem Value="4">四月</asp:ListItem>
                        <asp:ListItem Value="5">五月</asp:ListItem>
                        <asp:ListItem Value="6">六月</asp:ListItem>
                        <asp:ListItem Value="7">七月</asp:ListItem>
                        <asp:ListItem Value="8">八月</asp:ListItem>
                        <asp:ListItem Value="9">九月</asp:ListItem>
                        <asp:ListItem Value="10">十月</asp:ListItem>
                        <asp:ListItem Value="11">十一月</asp:ListItem>
                        <asp:ListItem Value="12">十二月</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    拍攝日期</td>
                <td>
                    <asp:TextBox ID="TextBoxPhotoDate" runat="server" Width="100px"></asp:TextBox>
                    &nbsp;-
                    <asp:TextBox ID="TextBoxPhotoDateEnd" runat="server" Width="100px"></asp:TextBox>
                    （ex. 2003-2-24）<asp:RegularExpressionValidator ID="REValidatorPhotoDate" 
                        runat="server" ControlToValidate="TextBoxPhotoDate" ErrorMessage="日期格式錯誤" 
                        ValidationExpression="^((\d{2}(([02468][048])|([13579][26]))[\-\/\s]?((((0?[13578])|(1[02]))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\-\/\s]?((0?[1-9])|([1-2][0-9])))))|(\d{2}(([02468][1235679])|([13579][01345789]))[\-\/\s]?((((0?[13578])|(1[02]))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\-\/\s]?((0?[1-9])|(1[0-9])|(2[0-8]))))))(\s(((0?[1-9])|(1[0-2]))\:([0-5][0-9])((\s)|(\:([0-5][0-9])\s))([AM|PM|am|pm]{2,2})))?$"></asp:RegularExpressionValidator>
                    <asp:RegularExpressionValidator ID="REValidatorPhotoDateEnd" runat="server" 
                        ControlToValidate="TextBoxPhotoDateEnd" ErrorMessage="日期格式錯誤" 
                        ValidationExpression="^((\d{2}(([02468][048])|([13579][26]))[\-\/\s]?((((0?[13578])|(1[02]))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\-\/\s]?((0?[1-9])|([1-2][0-9])))))|(\d{2}(([02468][1235679])|([13579][01345789]))[\-\/\s]?((((0?[13578])|(1[02]))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\-\/\s]?((0?[1-9])|(1[0-9])|(2[0-8]))))))(\s(((0?[1-9])|(1[0-2]))\:([0-5][0-9])((\s)|(\:([0-5][0-9])\s))([AM|PM|am|pm]{2,2})))?$"></asp:RegularExpressionValidator>
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
                    地名</td>
                <td>
                    <asp:TextBox ID="TextBoxLocation" runat="server" Width="150px"></asp:TextBox>
                    &nbsp;</td>
            </tr>            
            <tr>
                <td colspan="3">
                                      
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional" >
                        <ContentTemplate>
                            <uc2:DDListLocation ID="DDListLocation1" runat="server"/>
                        </ContentTemplate>
                    </asp:UpdatePanel>&nbsp;
                     
                </td>
            </tr>            
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:CheckBox ID="CheckBoxPublicWeb" runat="server" Text="含未公開上網之資料" />
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="查詢" />
                    &nbsp;
                    <asp:Button ID="Button2" runat="server" Text="重設" />
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

