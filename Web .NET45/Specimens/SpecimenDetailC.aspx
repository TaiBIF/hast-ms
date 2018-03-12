<%@ Page Language="VB" MasterPageFile="~/MasterPageTWFlora.master" AutoEventWireup="false" CodeFile="SpecimenDetailC.aspx.vb" Inherits="Specimens_SpecimenDetailC" title="HAST - 台灣本土植物資料庫 - 植物標本標籤詳細資訊" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <link href="../Styles/Style.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/TWFlora.css" rel="stylesheet" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <a href="javascript:history.go(-1)" title="回上一頁">回上一頁</a><br />
    <br />
    採集資訊
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="SN" >
        <ItemTemplate>
            <br />
            &nbsp;<asp:Label ID="Label1" runat="server" Text="系統 ID: "></asp:Label>
            <asp:Label ID="LabelSN" runat="server" Text='<%# Eval("SN") %>'></asp:Label>
&nbsp;<br />
            <table class="details">
                <tr>
                    <td class="fieldHeader">
                        館號</td>
                    <td colspan="4" class="item_field">
                        <asp:Label ID="specimenOrderNumLabel" runat="server" 
                            Text='<%# Eval("specimenOrderNum") %>' />
                        &nbsp;
                        <asp:Button ID="btnErrorReport" runat="server" onclick="btnErrorReport_Click" 
                            Text="錯誤回報" />
                    </td>
                    <td rowspan="6" class="item_field">
                        <asp:HyperLink ID="HyperLinkSpecimenImage" runat="server">
                            <asp:Image ID="ImageSpecimenSamll" runat="server" CssClass="specimenInDetail" 
                            Width="100px" />
                        </asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td class="fieldHeader">
                        科名</td>
                    <td colspan="4" class="item_field">
                        <asp:Label ID="verOFamilyELabel" runat="server" 
                            Text='<%# Eval("verOFamilyE") %>' />
                        &nbsp;<asp:Label ID="verOFamilyCLabel" runat="server" 
                            Text='<%# Eval("verOFamilyC") %>' />
                    </td>
                    
                </tr>
                <tr>
                    <td class="fieldHeader">
                        屬名</td>
                    <td colspan="4" class="item_field">
                        <asp:Label ID="verOGenusELabel" runat="server" 
                            Text='<%# Eval("verOGenusE") %>' />
                        &nbsp;<asp:Label ID="verOGenusCLabel" runat="server" 
                            Text='<%# Eval("verOGenusC") %>' />
                    </td>
                    
                </tr>
                <tr>
                    <td class="fieldHeader">
                        學名</td>
                    <td colspan="4" class="item_field">                        
                        <asp:HyperLink ID="HyperLinkOSpecies" runat="server" 
                            NavigateUrl='<%# "~/Taxon/SpeciesDetailC.aspx?speciesID=" & Eval("verOSpeciesID") %>' 
                            Text='<%# Eval("verOSpeciesE") %>'></asp:HyperLink>
                        &nbsp;<asp:Label ID="verOSpceiesCLabel" runat="server" 
                            Text='<%# Eval("verOSpeciesC") %>' />
                    </td>
                   
                </tr>
                <tr>
                    <td class="fieldHeader">
                        鑑訂者</td>
                    <td colspan="4" class="item_field">
                        <asp:Label ID="verifierONameLabel" runat="server" 
                            Text='<%# Eval("verifierOName") %>' />
                        &nbsp;<asp:Label ID="verODateLabel" runat="server" 
                            Text='<%# Eval("verODate", "{0:d}") %>' />
                    </td>
                                       
                </tr>
                <tr>
                    <td class="fieldHeader">
                        採集號</td>
                    <td colspan="4" class="item_field">
                        <asp:Label ID="collectionFLCNoLabel" runat="server" 
                            Text='<%# Eval("collectionFLCNo") %>' />
                    </td>
                    
                </tr>
                <tr>
                    <td class="fieldHeader">
                        採集日期</td>
                    <td class="item_field">
                        <asp:Label ID="collectionDateLabel" runat="server" 
                            Text='<%# Eval("collectionDate", "{0:d}") %>' />
                    </td>
                    <td class="fieldHeader">
                        隨同人員</td>
                    <td colspan="3" class="item_field">
                        <asp:Label ID="companionELabel" runat="server" 
                            Text='<%# Eval("companionE") & Eval("companion") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="fieldHeader">
                        國家</td>
                    <td colspan="5" class="item_field">
                        <asp:Label ID="countryLabel" runat="server" Text='<%# Eval("countryC") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="fieldHeader">
                        行政區</td>
                    <td colspan="5" class="item_field">
                        <asp:Label ID="districtCLabel" runat="server" Text='<%# Eval("districtC") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="fieldHeader">
                        地點</td>
                    <td colspan="5" class="item_field">
                        <asp:Label ID="localityDescELabel" runat="server" 
                            Text='<%# Eval("localityDescC") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="fieldHeader">
                        經緯度</td>
                    <td colspan="2" class="item_field">
                        <asp:Label ID="GPSInfoLabel" runat="server" />
                    </td>
                    <td class="fieldHeader">
                        海拔(m)</td>
                    <td colspan="2" class="item_field">
                        <asp:Label ID="elevationLabel" runat="server" Text='<%# Eval("elevation") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="fieldHeader">
                        微生育地</td>
                    <td colspan="2" class="item_field">
                        <asp:Label ID="habitatLabel" runat="server" Text='<%# Eval("habitat") %>' />
                    </td>
                    <td class="fieldHeader">
                        地形位置</td>
                    <td colspan="2" class="item_field">
                        <asp:Label ID="topographyLabel" runat="server" 
                            Text='<%# Eval("topography") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="fieldHeader">
                        自然度</td>
                    <td colspan="2" class="item_field">
                        <asp:Label ID="naturalnessStatusLabel" runat="server" 
                            Text='<%# Eval("naturalnessStatus") %>' />
                    </td>
                    <td class="fieldHeader">
                        植群帶</td>
                    <td colspan="2" class="item_field">
                        <asp:Label ID="vegetLabel" runat="server" Text='<%# Eval("veget") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="fieldHeader">
                        生長型</td>
                    <td colspan="2" class="item_field">
                        <asp:Label ID="lifeFormLabel" runat="server" Text='<%# Eval("lifeForm") %>' />
                    </td>
                    <td class="fieldHeader">
                        植物高度</td>
                    <td colspan="2" class="item_field">
                        <asp:Label ID="plantHLabel" runat="server" Text='<%# Eval("plantH") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="fieldHeader" rowspan="3">
                        物候</td>
                    <td class="subFieldHeader">
                        花</td>
                    <td class="item_field">
                        <asp:Label ID="flowerLabel" runat="server" Text='<%# Eval("flower") %>' />
                    </td>
                    <td class="subFieldHeader">
                        花色
                    </td>
                    <td colspan="2" class="item_field">
                        <asp:Label ID="flowerColorLabel" runat="server" 
                            Text='<%# Eval("flowerColor") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="subFieldHeader">
                        果</td>
                    <td colspan="1" class="item_field">
                        <asp:Label ID="fruitsLabel" runat="server" Text='<%# Eval("fruits") %>' />
                    </td>
                    <td class="subFieldHeader">
                        果色</td>
                    <td colspan="2" class="item_field">
                        <asp:Label ID="fruitColorLabel" runat="server" 
                            Text='<%# Eval("fruitColor") %>' />
                    </td>
                </tr>
                <tr>
                    <td colspan="5" class="item_field">
                        <asp:Label ID="sexCharLabel" runat="server" Text='<%# Eval("sexChar") %>' />
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="fieldHeader">
                        豐富度</td>
                    <td class="item_field">
                        <asp:Label ID="abundanceLabel" runat="server" Text='<%# Eval("abundance") %>' />
                    </td>
                    <td class="fieldHeader">
                        環境光度</td>
                    <td class="item_field">
                        <asp:Label ID="lightIntensityLabel" runat="server" 
                            Text='<%# Eval("lightIntensity") %>' />
                    </td>
                    <td class="fieldHeader">
                        環境濕度</td>
                    <td class="item_field">
                        <asp:Label ID="humidityLabel" runat="server" Text='<%# Eval("humidity") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="fieldHeader">
                        寄伴生植物</td>
                    <td colspan="5" class="item_field">
                        <asp:Label ID="trophicDataLabel" runat="server" 
                            Text='<%# Eval("trophicData") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="fieldHeader">
                        備註</td>
                    <td colspan="5" class="item_field">
                        <asp:Label ID="addCharLabel" runat="server" Text='<%# Eval("addChar") %>' />
                        <br />
                        <asp:Label ID="preparationLabel" runat="server" 
                            Text='<%# Eval("preparation") %>' />
                        <asp:Label ID="preparationDateLabel" runat="server" 
                            Text='<%# Eval("preparationDate") %>' />
                        <br />
                        <asp:Label ID="noteELabel" runat="server" Text='<%# Eval("noteE") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="fieldHeader">
                        交換單位</td>
                    <td colspan="5" class="item_field">
                        <asp:Label ID="exchangeToLabel" runat="server" 
                            Text='<%# Eval("exchangeTo") %>' />
                        &nbsp;<asp:Label ID="exchangeDeptLabel" runat="server" 
                            Text='<%# Eval("exchangeDept") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="fieldHeader">
                        執行計畫</td>
                    <td colspan="5" class="item_field">
                        <asp:Label ID="projectNameLabel" runat="server" 
                            Text='<%# Eval("projectName") %>' />
                    </td>
                </tr>
            </table>
            <br />
        </ItemTemplate>
    </asp:FormView>
    <asp:Label ID="LabelVerification" runat="server" Text="訂正歷史"></asp:Label>
    <br />
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SDSVerification">
        <ItemTemplate>
            <table class="details">
                <tr>
                    <td class="fieldHeader">
                        科名</td>
                    <td class="item_field">
                        <asp:Label ID="verFamilyELabel" runat="server" 
                            Text='<%# Eval("verFamilyE") %>' />
                        &nbsp;<asp:Label ID="verFamilyCLabel" runat="server" 
                            Text='<%# Eval("verFamilyC") %>' />                         
                    </td>
                </tr>
                <tr>
                    <td class="fieldHeader">
                        屬名</td>
                    <td class="item_field">
                        <asp:Label ID="verGenusELabel" runat="server" Text='<%# Eval("verGenusE") %>' />
                        &nbsp;<asp:Label ID="verGenusCLabel" runat="server" Text='<%# Eval("verGenusC") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="fieldHeader">
                        學名</td>
                    <td class="item_field">                       
                        <asp:HyperLink ID="HyperLinkSpecies" runat="server" 
                            NavigateUrl='<%# "~/Taxon/SpeciesDetailC.aspx?speciesID=" & Eval("verSpeciesID") %>' 
                            Text='<%# Eval("verSpeciesE") %>'></asp:HyperLink>
                        &nbsp;<asp:Label ID="verSpeciesCLabel" runat="server" Text='<%# Eval("verSpeciesC") %>' />
    
                    </td>
                </tr>
                <tr>
                    <td class="fieldHeader">
                        鑑訂者</td>
                    <td class="item_field">
                        <asp:Label ID="verifierNameFLC1Label" runat="server" 
                            Text='<%# Eval("verifierNameFLC1") %>' />
                        &nbsp;
                        <asp:Label ID="verDateLabel" runat="server" 
                            Text='<%# Eval("verDate", "{0:d}") %>' />
                    </td>                    
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
    <asp:Label ID="LabelLivingImage" runat="server" Text="生態影像"></asp:Label>
    <br />
    <div id="content">
        <asp:DataList ID="DataList2" runat="server"  repeatColumns="5"  
            repeatdirection="Horizontal" cellpadding="10" 
            DataSourceID="SDSImages" CssClass="imagesList" CellSpacing="10">
            <ItemStyle VerticalAlign="Top" />      
                <ItemTemplate>        
                            <div class="albumpic">
                                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# "~/Photo/ImageDetailC.aspx?imageCode=" & Eval("imageCode") %>' target="_blank">
                                <asp:Image ID="Image1" runat="server" />
                                </asp:HyperLink>
                            </div>
                            <div class="picNote">
                                ID:<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "~/Photo/ImageDetailC.aspx?imageCode=" & Eval("imageCode") %>'
                                    Text='<%# Eval("imageCode") %>' target="_blank"></asp:HyperLink><br />                                
                            </div>                
            </ItemTemplate>
        </asp:DataList>
    </div>
    
    <asp:SqlDataSource ID="SDSHast" runat="server" ></asp:SqlDataSource>
    <asp:SqlDataSource ID="SDSVerification" runat="server"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SDSImages" runat="server"></asp:SqlDataSource>
</asp:Content>

