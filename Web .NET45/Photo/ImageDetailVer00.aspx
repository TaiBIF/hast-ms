<%@ Page Language="VB" MasterPageFile="~/MasterPageTWFlora.master" AutoEventWireup="false" CodeFile="ImageDetailVer00.aspx.vb" Inherits="Photo_ImageDetail" title="未命名頁面" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="http://www.hast.biodiv.tw/Styles/Style.css" rel="stylesheet" type="text/css" />
    <link href="~/Styles/Style.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DataList ID="DataList1" runat="server" borderwidth="0px" cellpadding="0" 
    DataSourceID="SDSImage" repeatColumns="1" repeatdirection="Horizontal">
    <ItemStyle />
    <ItemTemplate>
        <!--開在新視窗，先取消回上一頁功能
                <a href="photos2.aspx?speciesID=<%# Eval("speciesID")  %>"><-- back </a>
                -->
        <table style="vertical-align: top; text-align: left" width="940px">
            <tr>
                <td align="left" style="width: 100px; vertical-align: top;">
                    <b>圖檔名：<%#Server.HtmlEncode(Eval("imageCode").ToString())%></b><asp:HyperLink 
                        ID="HyperLink1" runat="server" 
                        NavigateUrl='<%# "../Mgm/secure/download.aspx?imageCode=" + Eval("imageCode") %>'>Download</asp:HyperLink>
                </td>
                <td colspan="" valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left" style="width: 810px; vertical-align: top;">
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="center">
                                <img alt="" src='<%# GetImageFilePath(Eval("imageCode")) %>' />
                            </td>
                        </tr>
                    </table>
                </td>
                <td colspan="" rowspan="" valign="top">
                    <table id="image_detail" class="details" width="160px">
                        <tr>
                            <td class="fieldHeader">
                                Scientific Name</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblSpecies" runat="server" Text='<%# Eval("speciesE") %>'></asp:Label>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="fieldHeader">
                                Family Name</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblFamily" runat="server" Text='<%# Eval("familyE") %>'></asp:Label>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="fieldHeader">
                                Photographer</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblAuthor" runat="server" Text='<%# Eval("authorFL") %>'></asp:Label>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="fieldHeader">
                                Photography Date</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblDate" runat="server" Text='<%# Eval("photoDate", "{0:d}") %>'></asp:Label>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="fieldHeader">
                                Collection No.</td>
                        </tr>
                        <tr>
                            <td>                               
                                <asp:HyperLink ID="HyperLinkCollectorNo" runat="server" 
                                    Text='<%# Eval("collectionLFNo") %>'></asp:HyperLink>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="fieldHeader">
                                Locality</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblDisctrictE" runat="server" Text='<%# Eval("districtE") %>'></asp:Label>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="fieldHeader">
                                Theme</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="imgSubject" runat="server" Text='<%# Eval("imgSubject") %>'></asp:Label>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td id="image_subject">
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Eval("wholePlant") %>' 
                                    Text="Whole Plant" />
                                <br />
                                <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Eval("root") %>' 
                                    Text="Root" />
                                <br />
                                <asp:CheckBox ID="CheckBox3" runat="server" Checked='<%# Eval("stem") %>' 
                                    Text="Stem" />
                                <br />
                                <asp:CheckBox ID="CheckBox4" runat="server" Checked='<%# Eval("leaf") %>' 
                                    Text="Leaf" />
                                <br />
                                <asp:CheckBox ID="CheckBox5" runat="server" Checked='<%# Eval("flower") %>' 
                                    Text="Flower" />
                                <br />
                                <asp:CheckBox ID="CheckBox6" runat="server" Checked='<%# Eval("fruit") %>' 
                                    Text="Fruit" />
                                <br />
                                <asp:CheckBox ID="CheckBox7" runat="server" Checked='<%# Eval("seed") %>' 
                                    Text="Seed" />
                                <br />
                                <asp:CheckBox ID="CheckBox8" runat="server" Checked='<%# Eval("sorus") %>' 
                                    Text="Sorus" />
                                <br />
                                <asp:CheckBox ID="CheckBox9" runat="server" 
                                    Checked='<%# Eval("pistillateFlower") %>' Text="Pistillate Flower" />
                                <br />
                                <asp:CheckBox ID="CheckBox10" runat="server" 
                                    Checked='<%# Eval("staminateFlower") %>' Text="Staminate Flower" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <br />
                    <br />
                </td>
            </tr>
        </table>
        &nbsp; &nbsp;&nbsp; &nbsp;<!-- 以html的超連結下載 <a href="management/powerUser/download.aspx?imageCode=<%# Eval("imageCode") %>"><br />download</a> &nbsp;  -->
    </ItemTemplate>
</asp:DataList>
<br />
    <asp:SqlDataSource ID="SDSImage" runat="server" ></asp:SqlDataSource>
    <asp:SqlDataSource ID="SDSSN" runat="server"></asp:SqlDataSource>
</asp:Content>

