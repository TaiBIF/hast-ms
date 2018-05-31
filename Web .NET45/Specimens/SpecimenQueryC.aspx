<%@ Page Language="VB" MasterPageFile="~/MasterPageTWFlora.master" AutoEventWireup="false" CodeFile="SpecimenQueryC.aspx.vb" Inherits="Specimens_SpecimenQueryC" title="HAST - 台灣本土植物資料庫 -  植物標本標籤查詢" %>

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
                    植物名</td>
                <td>
                    <asp:TextBox ID="TextBoxScientificName" runat="server" Width="300px"></asp:TextBox>
                    &nbsp;</td>
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
                    採集者</td>
                <td>
                    <asp:DropDownList ID="DDListCollector" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    採集號</td>
                <td>
                    <asp:TextBox ID="TextBoxCollectionNum" runat="server" Width="100px"></asp:TextBox>
                    &nbsp;-
                    <asp:TextBox ID="TextBoxCollectionNumEnd" runat="server" Width="100px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="ReValidatorCollectionNum" 
                        runat="server" ControlToValidate="TextBoxCollectionNum" ErrorMessage="限輸入數字" 
                        ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                    <asp:RegularExpressionValidator ID="REValidatorCollectionNumEnd" runat="server" 
                        ControlToValidate="TextBoxCollectionNumEnd" ErrorMessage="限輸入數字" 
                        ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    採集日期</td>
                <td>
                    <asp:TextBox ID="TextBoxCollectionDate" runat="server" Width="100px"></asp:TextBox>
                    &nbsp;-
                    <asp:TextBox ID="TextBoxCollectionDateEnd" runat="server" Width="100px"></asp:TextBox>
                    （ex. 2003-2-24）<asp:RegularExpressionValidator 
                        ID="REValidatorcollectionDate" runat="server" 
                        ControlToValidate="TextBoxCollectionDate" ErrorMessage="日期格式錯誤" 
                        ValidationExpression="^((\d{2}(([02468][048])|([13579][26]))[\-\/\s]?((((0?[13578])|(1[02]))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\-\/\s]?((0?[1-9])|([1-2][0-9])))))|(\d{2}(([02468][1235679])|([13579][01345789]))[\-\/\s]?((((0?[13578])|(1[02]))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\-\/\s]?((0?[1-9])|(1[0-9])|(2[0-8]))))))(\s(((0?[1-9])|(1[0-2]))\:([0-5][0-9])((\s)|(\:([0-5][0-9])\s))([AM|PM|am|pm]{2,2})))?$"></asp:RegularExpressionValidator>
                    <asp:RegularExpressionValidator ID="REValidatorCollectionDateEnd" 
                        runat="server" ControlToValidate="TextBoxCollectionDateEnd" 
                        ErrorMessage="日期格式錯誤" 
                        ValidationExpression="^((\d{2}(([02468][048])|([13579][26]))[\-\/\s]?((((0?[13578])|(1[02]))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\-\/\s]?((0?[1-9])|([1-2][0-9])))))|(\d{2}(([02468][1235679])|([13579][01345789]))[\-\/\s]?((((0?[13578])|(1[02]))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\-\/\s]?((0?[1-9])|(1[0-9])|(2[0-8]))))))(\s(((0?[1-9])|(1[0-2]))\:([0-5][0-9])((\s)|(\:([0-5][0-9])\s))([AM|PM|am|pm]{2,2})))?$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    採集月份</td>
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
                    </td>
            </tr>
            <tr>
                <td colspan="3">
                
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <uc2:DDListLocation ID="DDListLocation1" runat="server" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    &nbsp;
                </td>
            </tr>
            
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    海拔</td>
                <td>
                    <asp:DropDownList ID="DDListAltCompare" runat="server">
                        <asp:ListItem Value="0">=</asp:ListItem>
                        <asp:ListItem Value="1">&gt;=</asp:ListItem>
                        <asp:ListItem Value="2">&lt;=</asp:ListItem>
                        <asp:ListItem Value="3">Between</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;
                    <asp:TextBox ID="TextBoxAlt" runat="server" Width="80px"></asp:TextBox>
                    &nbsp;-
                    <asp:TextBox ID="TextBoxAltx" runat="server" Width="80px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="REValidatorAlt" runat="server" 
                        ControlToValidate="TextBoxAlt" ErrorMessage="限輸入數字或數字超出範圍" 
                        ValidationExpression="^\d{1,4}$"></asp:RegularExpressionValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="TextBoxAltx" ErrorMessage="限輸入數字或數字超出範圍" 
                        ValidationExpression="^\d{1,4}$"></asp:RegularExpressionValidator>
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
                    館號</td>
                <td>
                    <asp:TextBox ID="TextBoxSpecimenOrderNum" runat="server" Width="100px"></asp:TextBox>
                    &nbsp;-
                    <asp:TextBox ID="TextBoxSpecimenOrderNumEnd" runat="server" Width="100px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="REValidatorSpecimenOrderNum" runat="server" 
                        ControlToValidate="TextBoxSpecimenOrderNum" ErrorMessage="限輸入數字或數字超出範圍" 
                        ValidationExpression="^\d{1,7}$"></asp:RegularExpressionValidator>
                    <asp:RegularExpressionValidator ID="REValidatorSpecimenOrderNumEnd" 
                        runat="server" ControlToValidate="TextBoxSpecimenOrderNumEnd" 
                        ErrorMessage="限輸入數字或數字超出範圍" ValidationExpression="^\d{1,7}$"></asp:RegularExpressionValidator>
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


