<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="HastQuery.aspx.vb" Inherits="Mgm_secure_HastQuery" title="採集資料查詢 - HAST" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <table class="style1">
            <tr>
                <td width="50px">
                    &nbsp;</td>
                <td width="130px">
                    &nbsp;</td>
                <td width="800px">
                    採集資料查詢 - 含未建館號資料，不限查詢筆數，請善用條件縮小查詢範圍</td>
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
                    &nbsp;（可輸入拉丁文及中文之科屬種名）</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    科</td>
                <td>
                    <asp:DropDownList ID="DDListFamily" runat="server" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    屬</td>
                <td>
                    <asp:DropDownList ID="DDListGenus" runat="server" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    學名</td>
                <td>
                    <asp:DropDownList ID="DDListSpecies" runat="server">
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
                    &nbsp; （第二欄供採集號範圍查詢始用）<asp:RegularExpressionValidator ID="ReValidatorCollectionNum" 
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
                    &nbsp; （ex. 2003-2-24，採集號非數字時請善用日期）<asp:RegularExpressionValidator 
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
                        <asp:ListItem>六月</asp:ListItem>
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
                    國家</td>
                <td>
                    <asp:DropDownList ID="DDListCountry" runat="server" AutoPostBack="True">
                    </asp:DropDownList>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp; 行政區一級</td>
                <td>
                    <asp:DropDownList ID="DDListProvince" runat="server" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp; 行政區二級</td>
                <td>
                    <asp:DropDownList ID="DDListHsien" runat="server" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp; 行政區三級</td>
                <td>
                    <asp:DropDownList ID="DDListTown" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    國家公園/保護區</td>
                <td>
                    <asp:DropDownList ID="DDListPark" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    地名</td>
                <td>
                    <asp:TextBox ID="TextBoxLocation" runat="server" Width="150px"></asp:TextBox>
                    &nbsp; （可輸入中英文地名，不包含國名查詢）</td>
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
                    &nbsp;（第二欄僅在Between時有作用，海拔範圍有&quot;交集&quot;時都會顯示）</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
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
                    注意事項：</td>
                <td>
                    目前查詢功能設計先以舊版為基準，原上則需達到舊版之所有功能<br />
                    並在「植物名」及「地名」的查詢做加強<br />
                    請與 
                    <asp:HyperLink ID="HyperLink1" runat="server" 
                        NavigateUrl="http://db1n.sinica.edu.tw/textdb/hast/hast_labelquery.php">本土植資料庫標本標籤資料庫</asp:HyperLink>
                    &nbsp;對照<br />
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    <b>測試時請著重在本頁查詢功能是否正常運作，<br />
                    查詢結果的列表及詳細顯示都還會作調整<br />
                    有功能異常時請回報，並記錄何種情況下發生錯誤</b></td>
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

