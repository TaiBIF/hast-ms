<%@ Page Language="VB" MasterPageFile="~/MasterPageYYLC.master" AutoEventWireup="false" CodeFile="SpeciesDetailC.aspx.vb" Inherits="Project_SpeciesDetailC" title="HAST - 植物物種資訊" %>

<%@ Register Assembly="GMaps" Namespace="Subgurim.Controles" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
     <style type="text/css">
                    
         #header_menu      
            {
            	margin-left:300px;
            	background-color:White;
            	
            }
         #menu_2
            {
            	margin-left:270px;
            }
        
            
    </style>
    <link href="../Styles/Style.css" rel="stylesheet" type="text/css" />   
    <link href="../Styles/TWFlora.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="menu_2">
        <asp:Menu ID="Menu2" runat="server" Font-Size="10pt" Orientation="Horizontal" 
            StaticDisplayLevels="2">
            <Items>
                <asp:MenuItem Text="鴛鴦湖自然保留區" Value="鴛鴦湖自然保留區">
                    <asp:MenuItem NavigateUrl="~/Project/YuanYangLakeIntroC.aspx" Text="簡介" 
                        Value="簡介"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/Project/YuanYangLakeListC.aspx" Text="植物名錄" 
                        Value="植物名錄"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/Project/YuanYangLakeHierachicalC.aspx" 
                        Text="植物名錄–階層" Value="植物名錄–階層"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/Project/YuanYangLakeQueryC.aspx" Text="植物特徵查詢" 
                        Value="植物特徵查詢"></asp:MenuItem>
                </asp:MenuItem>
            </Items>
        </asp:Menu>
    </div>  
    <div class="controls ">
        <a id="Top_Anchor"></a>       
        <a href="#Specimens_Anchor">標本資訊</a>&nbsp; |&nbsp;<a href="#Distribution_Anchor">分佈圖</a>        
        |&nbsp;<a href="#Images_Anchor">生態影像</a> 
    </div>
          
    <asp:DetailsView ID="DetailsViewSpecies" runat="server" AutoGenerateRows="False" 
        DataKeyNames="speciesID" cssClass="details" Width="960px">
        <FieldHeaderStyle VerticalAlign="Top" Width="150px" CssClass="fieldHeader"  />
        <RowStyle CssClass="item_field" />
        <Fields>
            <asp:BoundField DataField="speciesE" HeaderText="學名" 
                SortExpression="speciesE" />
            <asp:BoundField DataField="speciesC" HeaderText="中文名" 
                SortExpression="speciesC" />
            <asp:BoundField DataField="characteristicC" HeaderText="形態描述" />
            <asp:TemplateField HeaderText="分佈">
                <ItemTemplate>
                    <asp:Label ID="LabelDistribution" runat="server" 
                        Text='<%# Eval("distributionWC") & Eval("distributionTC") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="本區分佈" />
        </Fields>
        <HeaderStyle CssClass="fieldHeader" />
    </asp:DetailsView>
    <a href="#Top_Anchor">Top</a>
    <br />
    <br />
    <a id="Specimens_Anchor">標本資訊
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
         <ContentTemplate>
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
        
        
         </ContentTemplate>
     </asp:UpdatePanel>
     </a><br />
     
    
    <a href="#Top_Anchor">Top</a>
    <br />
    <br />
    <a id="Distribution_Anchor">分佈圖</a><br />
    <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table id="distribution" >
                <tr>            
                    <td class="GMaps">
                        <cc1:gmap ID="GMap1" runat="server" DataGIconAnchorField="" DataGIconImageField=""
                            DataGIconShadowField="" DataGIconShadowSizeField="" DataGIconSizeField="" DataGInfoWindowAnchorField=""
                            DataLatField="WGS84Lat" 
                            DataLngField="WGS84Lng"
                            enableGetGMapElementById="True" enablePostBackPersistence="True" Height="500px"
                            Version="2" Width="520px" GZoom="8" />
                    </td>            
                    <td style="width: 5px">
                    </td>
                    <td class="GMaps">
                        <cc1:gmap ID="GMap2" runat="server" DataLatField="WGS84Lat" 
                            DataLngField="WGS84Lng" DataGIconAnchorField="" DataGIconImageField="" 
                            DataGIconShadowField="" DataGIconShadowSizeField="" DataGIconSizeField="" 
                            DataGInfoWindowAnchorField="" DataGInfoWindowTextField="" enableGetGMapElementById="True" 
                            enablePostBackPersistence="True" Height="500px" Version="2" 
                            Width="430px" />
                     </td>            
                </tr>        
            </table>
        
        </ContentTemplate>
    </asp:UpdatePanel>
        
    
    <a id="Greenhouse_Anchor"></a>
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
    <a href="#Top_Anchor">Top</a>
    <br />
    <br />
    <a id="Images_Anchor">生態影像</a>
     <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
        <div id="content">
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
    </div>
        </ContentTemplate>
        
     </asp:UpdatePanel>
    <br />
    
    <a href="#Top_Anchor">Top</a>
    <br />
        
</asp:Content>

