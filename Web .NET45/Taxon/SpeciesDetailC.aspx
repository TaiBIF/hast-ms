<%@ Page Language="VB" MasterPageFile="~/MasterPageTWFlora.master" AutoEventWireup="false" CodeFile="SpeciesDetailC.aspx.vb" Inherits="Taxon_SpeciesDetailC" title="HAST - 植物物種資訊" %>

<%@ Register Assembly="GMaps" Namespace="Subgurim.Controles" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Styles/Style.css" rel="stylesheet" type="text/css" />   
    <link href="../Styles/TWFlora.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="controls ">
        <a id="Top_Anchor"></a>       
        <a href="#Specimens_Anchor">Specimens</a>&nbsp; |&nbsp;<a href="#Distribution_Anchor">Distribution</a>        
        |&nbsp;<a href="#Images_Anchor">Images</a> 
    </div>
    <br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
         <ContentTemplate>
             <asp:DetailsView ID="DetailsViewSpecies" runat="server" AutoGenerateRows="False" 
                DataKeyNames="speciesID" cssClass="details" Width="960px">
                <FieldHeaderStyle VerticalAlign="Top" Width="150px" CssClass="fieldHeader"  />
                <RowStyle CssClass="item_field" />
                <Fields>
                    <asp:BoundField DataField="speciesE" HeaderText="Scientific Name" 
                        SortExpression="speciesE" />
                    <asp:BoundField DataField="speciesC" HeaderText="Common Name" 
                        SortExpression="speciesC" />
                    <asp:BoundField DataField="sectionName" HeaderText="Section" 
                        SortExpression="sectionName" />
                    <asp:BoundField DataField="distribution" HeaderText="Distribution" 
                        SortExpression="distribution" />
                    <asp:BoundField DataField="continent" HeaderText="Continent" 
                        SortExpression="continent" />
                    <asp:HyperLinkField DataNavigateUrlFields="protologueLink" 
                        DataTextField="protologue" HeaderText="Protologue" />
                    <asp:HyperLinkField DataNavigateUrlFields="referenceLink" 
                        DataTextField="reference" HeaderText="Reference" />
                </Fields>
                <HeaderStyle CssClass="fieldHeader" />
            </asp:DetailsView>      
         </ContentTemplate>
    </asp:UpdatePanel>
   
    <a href="#Top_Anchor">Top</a>
    <br />
    <br />
    <a id="Specimens_Anchor">Specimens</a><br />
    <asp:GridView ID="GridViewSpecimens" runat="server" AutoGenerateColumns="False" 
        cssClass="listShow" AllowPaging="True">
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="specimenOrderNum" 
                    DataNavigateUrlFormatString="~/Specimens/SpecimenDetailC.aspx?specimenOrderNum={0}" 
                    DataTextField="specimenOrderNum" HeaderText="HAST 館號" >
                    <ItemStyle HorizontalAlign="Right" Width="100px" />
                </asp:HyperLinkField>
                <asp:BoundField DataField="collectionFLCNo" HeaderText="採集號" 
                    SortExpression="collectionNum" >            
                    <ItemStyle HorizontalAlign="Left" Width="250px" />
                </asp:BoundField>
                <asp:BoundField DataField="collectionDate" DataFormatString="{0:d}" 
                    HeaderText="採集日期" HtmlEncode="False" 
                    SortExpression="collectionDate" >
                    <ItemStyle HorizontalAlign="Left" Width="150px" />
                </asp:BoundField>
                <asp:BoundField DataField="countryc" HeaderText="國家" 
                    SortExpression="countryC" >
                    <ItemStyle HorizontalAlign="Left" Width="150px" />
                </asp:BoundField>
                <asp:BoundField DataField="districtC" HeaderText="行政區" 
                    SortExpression="countryProvinceC" >
                    <ItemStyle HorizontalAlign="Left" Width="310px" />
                </asp:BoundField>
        </Columns>
        <PagerStyle HorizontalAlign="Center" />
        <HeaderStyle BackColor="#33CCFF" />
        <AlternatingRowStyle BackColor="#CCFFFF" />
    </asp:GridView>
    <a href="#Top_Anchor">Top</a>
    <br />
    <br />
    <a id="Distribution_Anchor">Distribution</a><br />
    <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <table id="distribution" >
                    <tr>            
                        <td class="GMaps">
                            <cc1:gmap ID="GMap1" runat="server" DataGIconAnchorField="" DataGIconImageField=""
                                DataGIconShadowField="" DataGIconShadowSizeField="" DataGIconSizeField="" DataGInfoWindowAnchorField=""
                                DataGInfoWindowTextField="" DataLatField="WGS84Lat" 
                                DataLngField="WGS84Lng"
                                enableGetGMapElementById="True" enablePostBackPersistence="True" Height="500px"
                                Version="2" Width="600px" GZoom="1" />
                        </td>            
                        <td style="width: 5px">
                        </td>
                        <td class="GMaps">
                            <cc1:gmap ID="GMap2" runat="server" DataLatField="WGS84Lat" 
                                DataLngField="WGS84Lng" DataGIconAnchorField="" DataGIconImageField="" 
                                DataGIconShadowField="" DataGIconShadowSizeField="" DataGIconSizeField="" 
                                DataGInfoWindowAnchorField="" DataGInfoWindowTextField="" enableGetGMapElementById="True" 
                                enablePostBackPersistence="True" Height="500px" Version="2" 
                                Width="350px" />
                         </td>            
                    </tr>        
                </table>  
            </ContentTemplate>
    </asp:UpdatePanel>    
      
    <a href="#Top_Anchor">Top</a>
    <br />
   
    
    <asp:GridView ID="GridViewGreenhouse" runat="server" 
        AutoGenerateColumns="False" cssClass="listShow" AllowPaging="True" 
        AllowSorting="True">
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="potID" 
                DataNavigateUrlFormatString="~/Mgm/greenhouse/GreenhouseDetail.aspx?potID={0}" 
                DataTextField="potID" HeaderText="Pot ID" >
                <HeaderStyle HorizontalAlign="Center" Width="80px" />
                <ItemStyle Width="80px" />
            </asp:HyperLinkField>
            <asp:BoundField DataField="greenhouseArea" HeaderText="Greenhouse" >
                <ItemStyle HorizontalAlign="Left" Width="80px" />
            </asp:BoundField>
            <asp:BoundField DataField="verSpeciesEA" HeaderText="Species A" >
                <ItemStyle HorizontalAlign="Left" Width="140px" />
            </asp:BoundField>
            <asp:BoundField DataField="collectionNumA" HeaderText="Collection No. A" 
                ReadOnly="True" SortExpression="collectionNumA" >
                <ItemStyle HorizontalAlign="Left" Width="120px" />
            </asp:BoundField>
            <asp:BoundField DataField="CDateA" DataFormatString="{0:d}" 
                HeaderText="Collection date A" HtmlEncode="False" SortExpression="CDateA" >
                <HeaderStyle HorizontalAlign="Center" Width="70px" />
                <ItemStyle HorizontalAlign="Left" Width="70px" />
            </asp:BoundField>
            <asp:BoundField DataField="countryA" HeaderText="Country A" 
                SortExpression="countryA" >
                <ItemStyle HorizontalAlign="Left" Width="70px" />
            </asp:BoundField>
            <asp:BoundField DataField="verSpeciesEB" HeaderText="Species B" >
                <ItemStyle HorizontalAlign="Left" Width="140px" />
            </asp:BoundField>
            <asp:BoundField DataField="collectionNumB" HeaderText="Collection No. B" 
                ReadOnly="True" SortExpression="collectionNumB" >
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Left" Width="120px" />
            </asp:BoundField>
            <asp:BoundField DataField="CDateB" DataFormatString="{0:d}" 
                HeaderText="Collection date B" HtmlEncode="False" SortExpression="CDateB" >
                <ItemStyle HorizontalAlign="Left" Width="70px" />
            </asp:BoundField>
            <asp:BoundField DataField="countryB" HeaderText="Country B" 
                SortExpression="countryB" >
                <ItemStyle HorizontalAlign="Left" Width="70px" />
            </asp:BoundField>
        </Columns>
        <PagerStyle HorizontalAlign="Center" />
        <HeaderStyle BackColor="#99FFCC" />
        <AlternatingRowStyle BackColor="#CCFFCC" />
    </asp:GridView>
   
   
    <br />
    <a id="Images_Anchor">Images</a>
    <br />
    <div id="content">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
            <ContentTemplate>        
                <asp:DataList ID="DataListImages" runat="server"  repeatColumns="5"  
                    repeatdirection="Horizontal" cellpadding="10" CssClass="imagesList" 
                    CellSpacing="10">
                    <ItemStyle VerticalAlign="Top" />      
                        <ItemTemplate>        
                                    <div class="albumpic">
                                        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# "~/Photo/ImageDetailC.aspx?imageCode=" & Eval("imageCode") %>' >
                                        <asp:Image ID="Image1" runat="server" />
                                        </asp:HyperLink>
                                    </div>
                                    <div class="picNote">
                                        ID:<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "~/Photo/ImageDetailC.aspx?imageCode=" & Eval("imageCode") %>'
                                            Text='<%# Eval("imageCode") %>'></asp:HyperLink><br />
                                        <!--<asp:Label ID="Label1" runat="server" Text='<%# Eval("speciesE") %>'></asp:Label><br />
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("speciesC") %>'></asp:Label>-->
                                    </div>                
                    </ItemTemplate>
                </asp:DataList>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <a href="#Top_Anchor">Top</a>
    <br />
        
</asp:Content>

