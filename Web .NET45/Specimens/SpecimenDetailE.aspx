<%@ Page Language="VB" MasterPageFile="~/MasterPageTWFloraE.master" AutoEventWireup="false" CodeFile="SpecimenDetailE.aspx.vb" Inherits="Specimens_SpecimenDetailE" title="HAST - Specimens Label Information" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <link href="../Styles/Style.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/TWFlora.css" rel="stylesheet" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <a href="javascript:history.go(-1)" title="back_privious">Back to previous page</a><br />
    <br />
    Specimens Label Information
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="SN" >
        <ItemTemplate>
            <br />
            &nbsp;<asp:Label ID="Label1" runat="server" Text="SN: "></asp:Label>
            <asp:Label ID="LabelSN" runat="server" Text='<%# Eval("SN") %>'></asp:Label>
&nbsp;<br />
            <table class="details">
                <tr>
                    <td class="fieldHeader">
                        HAST Specimen ID</td>
                    <td colspan="4" class="item_field">
                        <asp:Label ID="specimenOrderNumLabel" runat="server" 
                            Text='<%# Eval("specimenOrderNum") %>' />
                        &nbsp;
                        <asp:Button ID="btnErrorReport" runat="server" onclick="btnErrorReport_Click" 
                            Text="Error Report" />
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
                        Family Name</td>
                    <td colspan="4" class="item_field">
                        <asp:Label ID="verOFamilyELabel" runat="server" 
                            Text='<%# Eval("verOFamilyE") %>' />                        
                    </td>
                    
                </tr>
                <tr>
                    <td class="fieldHeader">
                        Genus Name</td>
                    <td colspan="4" class="item_field">
                        <asp:Label ID="verOGenusELabel" runat="server" 
                            Text='<%# Eval("verOGenusE") %>' />
                    </td>
                    
                </tr>
                <tr>
                    <td class="fieldHeader">
                        Scientific Name</td>
                    <td colspan="4" class="item_field">                        
                        <asp:HyperLink ID="HyperLinkOSpecies" runat="server" 
                            NavigateUrl='<%# "~/Taxon/SpeciesDetailE.aspx?speciesID=" & Eval("verOSpeciesID") %>' 
                            Text='<%# Eval("verOSpeciesE") %>'></asp:HyperLink>                        
                    </td>
                   
                </tr>
                <tr>
                    <td class="fieldHeader">
                        Identifier</td>
                    <td colspan="4" class="item_field">
                        <asp:Label ID="verifierONameLabel" runat="server" 
                            Text='<%# Eval("verifierONameFL") %>' />
                        &nbsp;<asp:Label ID="verODateLabel" runat="server" 
                            Text='<%# Eval("verODate", "{0:d}") %>' />
                    </td>
                                       
                </tr>
                <tr>
                    <td class="fieldHeader">
                        Collection No.</td>
                    <td colspan="4" class="item_field">
                        <asp:Label ID="collectionFLCNoLabel" runat="server" 
                            Text='<%# Eval("collectionFLNo") %>' />
                    </td>
                    
                </tr>
                <tr>
                    <td class="fieldHeader">
                        Collection Date</td>
                    <td class="item_field">
                        <asp:Label ID="collectionDateLabel" runat="server" 
                            Text='<%# Eval("collectionDate", "{0:d}") %>' />
                    </td>
                    <td class="fieldHeader">
                        Companion</td>
                    <td colspan="3" class="item_field">
                        <asp:Label ID="companionELabel" runat="server" 
                            Text='<%# Eval("companionE") & Eval("companion") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="fieldHeader">
                        Country</td>
                    <td colspan="5" class="item_field">
                        <asp:Label ID="countryLabel" runat="server" Text='<%# Eval("country") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="fieldHeader">
                        Administrative Division</td>
                    <td colspan="5" class="item_field">
                        <asp:Label ID="districtCLabel" runat="server" Text='<%# Eval("districtE") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="fieldHeader">
                        Locality</td>
                    <td colspan="5" class="item_field">
                        <asp:Label ID="localityDescELabel" runat="server" 
                            Text='<%# Eval("localityDescC") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="fieldHeader">
                        GPS Info.</td>
                    <td colspan="2" class="item_field">
                        <asp:Label ID="GPSInfoLabel" runat="server"  />
                        
                    </td>
                    <td class="fieldHeader">
                        Altitude (m)</td>
                    <td colspan="2" class="item_field">
                        <asp:Label ID="elevationLabel" runat="server" Text='<%# Eval("elevation") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="fieldHeader">
                        Habitat</td>
                    <td colspan="2" class="item_field">
                        <asp:Label ID="habitatLabel" runat="server" Text='<%# Eval("habitat") %>' />
                    </td>
                    <td class="fieldHeader">
                        Topography</td>
                    <td colspan="2" class="item_field">
                        <asp:Label ID="topographyLabel" runat="server" 
                            Text='<%# Eval("topography") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="fieldHeader">
                        Naturalness</td>
                    <td colspan="2" class="item_field">
                        <asp:Label ID="naturalnessStatusLabel" runat="server" 
                            Text='<%# Eval("naturalnessStatus") %>' />
                    </td>
                    <td class="fieldHeader">
                        Vegetation</td>
                    <td colspan="2" class="item_field">
                        <asp:Label ID="vegetLabel" runat="server" Text='<%# Eval("veget") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="fieldHeader">
                        Life Form</td>
                    <td colspan="2" class="item_field">
                        <asp:Label ID="lifeFormLabel" runat="server" Text='<%# Eval("lifeForm") %>' />
                    </td>
                    <td class="fieldHeader">
                        Plant height</td>
                    <td colspan="2" class="item_field">
                        <asp:Label ID="plantHLabel" runat="server" Text='<%# Eval("plantH") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="fieldHeader" rowspan="3">
                        Phenology</td>
                    <td class="subFieldHeader">
                        Flowers</td>
                    <td class="item_field">
                        <asp:Label ID="flowerLabel" runat="server" Text='<%# Eval("flower") %>' />
                    </td>
                    <td class="subFieldHeader">
                        Flower color
                    </td>
                    <td colspan="2" class="item_field">
                        <asp:Label ID="flowerColorLabel" runat="server" 
                            Text='<%# Eval("flowerColor") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="subFieldHeader">
                        Fruits</td>
                    <td colspan="1" class="item_field">
                        <asp:Label ID="fruitsLabel" runat="server" Text='<%# Eval("fruits") %>' />
                    </td>
                    <td class="subFieldHeader">
                        Fruit color</td>
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
                        Abundance</td>
                    <td class="item_field">
                        <asp:Label ID="abundanceLabel" runat="server" Text='<%# Eval("abundance") %>' />
                    </td>
                    <td class="fieldHeader">
                        Lightness</td>
                    <td class="item_field">
                        <asp:Label ID="lightIntensityLabel" runat="server" 
                            Text='<%# Eval("lightIntensity") %>' />
                    </td>
                    <td class="fieldHeader">
                        Humidity</td>
                    <td class="item_field">
                        <asp:Label ID="humidityLabel" runat="server" Text='<%# Eval("humidity") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="fieldHeader">
                        Associated Species</td>
                    <td colspan="5" class="item_field">
                        <asp:Label ID="trophicDataLabel" runat="server" 
                            Text='<%# Eval("trophicData") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="fieldHeader">
                        Note</td>
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
                        Exchanged Replicates</td>
                    <td colspan="5" class="item_field">
                        <asp:Label ID="exchangeToLabel" runat="server" 
                            Text='<%# Eval("exchangeTo") %>' />
                        &nbsp;<asp:Label ID="exchangeDeptLabel" runat="server" 
                            Text='<%# Eval("exchangeDept") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="fieldHeader">
                        Project</td>
                    <td colspan="5" class="item_field">
                        <asp:Label ID="projectNameLabel" runat="server" 
                            Text='<%# Eval("projectName") %>' />
                    </td>
                </tr>
            </table>
            <br />
        </ItemTemplate>
    </asp:FormView>
    <asp:Label ID="LabelVerification" runat="server" Text="Taxonomic Identifiaction Records"></asp:Label>
    <br />
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SDSVerification">
        <ItemTemplate>
            <table class="details">
                <tr>
                    <td class="fieldHeader">
                        Family name</td>
                    <td class="item_field">
                        <asp:Label ID="verFamilyELabel" runat="server" 
                            Text='<%# Eval("verFamilyE") %>' />                                                 
                    </td>
                </tr>
                <tr>
                    <td class="fieldHeader">
                        Genus name</td>
                    <td class="item_field">
                        <asp:Label ID="verGenusELabel" runat="server" Text='<%# Eval("verGenusE") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="fieldHeader">
                        Scientific name</td>
                    <td class="item_field">                       
                        <asp:HyperLink ID="HyperLinkSpecies" runat="server" 
                            NavigateUrl='<%# "~/Taxon/SpeciesDetailC.aspx?speciesID=" & Eval("verSpeciesID") %>' 
                            Text='<%# Eval("verSpeciesE") %>'></asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td class="fieldHeader">
                        Identifier</td>
                    <td class="item_field">
                        <asp:Label ID="verifierNameFLC1Label" runat="server" 
                            Text='<%# Eval("verifierNameFL") %>' />
                        &nbsp;
                        <asp:Label ID="verDateLabel" runat="server" 
                            Text='<%# Eval("verDate", "{0:d}") %>' />
                    </td>                    
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
    <asp:Label ID="LabelLivingImage" runat="server" Text="Living Plant Images"></asp:Label>
    <br />
    <div id="content">
        <asp:DataList ID="DataList2" runat="server"  repeatColumns="5"  
            repeatdirection="Horizontal" cellpadding="10" 
            DataSourceID="SDSImages" CssClass="imagesList" CellSpacing="10">
            <ItemStyle VerticalAlign="Top" />      
                <ItemTemplate>        
                            <div class="albumpic">
                                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# "~/Photo/ImageDetailE.aspx?imageCode=" & Eval("imageCode") %>' target="_blank">
                                <asp:Image ID="Image1" runat="server" />
                                </asp:HyperLink>
                            </div>
                            <div class="picNote">
                                ID:<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "~/Photo/ImageDetailE.aspx?imageCode=" & Eval("imageCode") %>'
                                    Text='<%# Eval("imageCode") %>' target="_blank"></asp:HyperLink><br />                                
                            </div>                
            </ItemTemplate>
        </asp:DataList>
    </div>
    
    <asp:SqlDataSource ID="SDSHast" runat="server" >
        
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDSVerification" runat="server"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SDSImages" runat="server"></asp:SqlDataSource>
</asp:Content>

