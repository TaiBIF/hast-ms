<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageSinicaOutSkirts.master" AutoEventWireup="false" CodeFile="SinicaOutskirtsQueryC.aspx.vb" Inherits="Project_SinicaOutskirtsQueryC" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Styles/Style.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/TWFlora.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #content
            {
            	margin:20px 50px;
            	font-size:10pt;
            }
        .option_title
            {
            	font-weight:bold;               
                
            }
        .illustration
            {
            	background-color:#ddffff;
            	text-align:left;
            	margin-bottom:5px;            	
            }
            
        .img_illustration
            {
            	width:128px;
            	height:128px;
            	margin:5px;
            	margin-bottom:2px;
            	
            }
        .table_illustration
            {
                text-align:center;
            }
            
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="menu_2">
        <asp:Menu ID="Menu2" runat="server" Font-Size="10pt" Orientation="Horizontal" 
            StaticDisplayLevels="2">
            <Items>
                <asp:MenuItem Text="中研院近郊數位植物誌" Value="中研院近郊數位植物誌">
                    <asp:MenuItem NavigateUrl="~/Project/SinicaOutskirtsIntroC.aspx" Text="簡介" 
                        Value="簡介"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/Project/SinicaOutskirtsListC.aspx" Text="植物名錄" 
                        Value="植物名錄"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/Project/SinicaOutskirtsHierachicalC.aspx" 
                        Text="植物名錄–階層" Value="植物名錄–階層"></asp:MenuItem>                    
                </asp:MenuItem>
            </Items>
        </asp:Menu>
    </div>
    
    <div id="content">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <h4>中央研究院近郊 - 植物特徵查詢</h4><br />
        <br />
        <asp:Label ID="LabelPlantCate" runat="server" CssClass="option_title" 
            Text="類型"></asp:Label>        
        <asp:RadioButtonList ID="plantCate" runat="server" 
            RepeatDirection="Horizontal" CellSpacing="7">
            <asp:ListItem Value="25">蕨類</asp:ListItem>
            <asp:ListItem Value="26">開花植物</asp:ListItem>
        </asp:RadioButtonList>
        <br />
       
        <asp:Label ID="LabelStem" runat="server" CssClass="option_title" 
            Text="莖的大小及木質化程度"></asp:Label>
        <asp:Image ID="ImageStem" runat="server" ImageUrl="~/images/icon/down.jpg" />
        <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtenderStem" runat="server"
        TargetControlID="PanelStem" CollapseControlID="ImageStem" ExpandControlID="ImageStem"
            TextLabelID = "" CollapsedText = "" ExpandedText = "" 
            ImageControlID = "ImageStem" CollapsedImage = "~/images/icon/down.jpg" ExpandedImage = "~/images/icon/up.jpg" 
            Collapsed="true">
        </ajaxToolkit:CollapsiblePanelExtender>
        <asp:Panel ID="PanelStem" runat="server" CssClass="illustration">            
            <table class="table_illustration">
                <tr>
                    <td>
                        <img alt="" src="../images/illustration/stem131.jpg" class="img_illustration"/>
                        <br />草本
                    </td>
                    <td>
                        <img alt="" src="../images/illustration/stem135.jpg" class="img_illustration"/>
                        <br />草質藤本
                    </td>
                    <td>
                        <img alt="" src="../images/illustration/stem133.jpg" class="img_illustration"/>
                        <br />木質藤本
                    </td>
                    <td>
                        <img alt="" src="../images/illustration/stem134.jpg" class="img_illustration"/>
                        <br />灌木
                    </td>
                    <td>                    
                        <img alt="" src="../images/illustration/stem132.jpg" class="img_illustration"/>
                        <br />喬木
                    </td>
                    <td>
                    </td>                    
                </tr>                
            </table>
        </asp:Panel>
        <asp:CheckBoxList ID="stem" runat="server" 
            RepeatDirection="Horizontal" CellSpacing="7">
            <asp:ListItem Value="131">草本</asp:ListItem>
            <asp:ListItem Value="135">草質藤本</asp:ListItem>
            <asp:ListItem Value="133">木質藤本</asp:ListItem>
            <asp:ListItem Value="134">灌木</asp:ListItem>
            <asp:ListItem Value="132">喬木</asp:ListItem>
        </asp:CheckBoxList>
        <br />
        
        <asp:Label ID="LabelHabitation" runat="server" CssClass="option_title" 
            Text="習性"></asp:Label>
        <asp:Image ID="ImageHabitation" runat="server" ImageUrl="~/images/icon/down.jpg" />
        <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtenderHabitation" runat="server"
        TargetControlID="PanelHabitation" CollapseControlID="ImageHabitation" ExpandControlID="ImageHabitation"
            TextLabelID = "" CollapsedText = "" ExpandedText = "" 
            ImageControlID = "ImageHabitation" CollapsedImage = "~/images/icon/down.jpg" ExpandedImage = "~/images/icon/up.jpg" 
            Collapsed="true">
        </ajaxToolkit:CollapsiblePanelExtender>
        <asp:Panel ID="PanelHabitation" runat="server" CssClass="illustration">
            <table class="table_illustration">
                <tr>
                    <td>
                        <img alt="" src="../images/illustration/habitation4.jpg" class="img_illustration"/>
                        <br />附生
                    </td>
                    <td>
                        <img alt="" src="../images/illustration/habitation6.jpg" class="img_illustration"/>
                        <br />寄生
                    </td>
                    <td>
                    </td>
                    <td>                        
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>                    
                </tr>                
            </table>
        </asp:Panel>    
        <asp:CheckBoxList ID="habitation" runat="server" 
            RepeatDirection="Horizontal" CellSpacing="7" >
            <asp:ListItem Value="3">地生</asp:ListItem>
            <asp:ListItem Value="4">附生</asp:ListItem>
            <asp:ListItem Value="5">攀緣</asp:ListItem>
            <asp:ListItem Value="6">寄生</asp:ListItem>
            <asp:ListItem Value="7">溼生</asp:ListItem>
            <asp:ListItem Value="8">水生</asp:ListItem>
        </asp:CheckBoxList>
        <br />
        
        <asp:Label ID="LabelFlowerColor" runat="server" CssClass="option_title" 
            Text="花色"></asp:Label>
        <asp:CheckBoxList ID="flowerColor" runat="server" 
            RepeatDirection="Horizontal" CellSpacing="7" >
            <asp:ListItem Value="51">黃</asp:ListItem>
            <asp:ListItem Value="52">綠</asp:ListItem>
            <asp:ListItem Value="53">紅</asp:ListItem>
            <asp:ListItem Value="54">紫</asp:ListItem>
            <asp:ListItem Value="55">白</asp:ListItem>
            <asp:ListItem Value="56">褐</asp:ListItem>
            <asp:ListItem Value="57">藍</asp:ListItem>
        </asp:CheckBoxList>
        <br />
        
        <asp:Label ID="LabelPetal" runat="server" CssClass="option_title" 
            Text="花瓣"></asp:Label>        
        <asp:Image ID="ImagePetal" runat="server" ImageUrl="~/images/icon/down.jpg" />
        <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtenderPetal" runat="server"
        TargetControlID="PanelPetal" CollapseControlID="ImagePetal" ExpandControlID="ImagePetal"
            TextLabelID = "" CollapsedText = "" ExpandedText = "" 
            ImageControlID = "ImagePetal" CollapsedImage = "~/images/icon/down.jpg" ExpandedImage = "~/images/icon/up.jpg" 
            Collapsed="true">
        </ajaxToolkit:CollapsiblePanelExtender>
        <asp:Panel ID="PanelPetal" runat="server" CssClass="illustration">
        <table class="table_illustration">
                <tr>
                    <td>
                        <img alt="" src="../images/illustration/petal58.jpg" class="img_illustration"/>
                         <br />合瓣花
                    </td>
                    <td>
                        <img alt="" src="../images/illustration/petal59.jpg" class="img_illustration"/>
                        <br />離瓣花
                    </td>                
                    <td>                      
                    </td>
                    <td>                            
                    </td>                   
                </tr>
            </table>
        </asp:Panel>    
        <asp:RadioButtonList ID="petal" runat="server"
          RepeatDirection="Horizontal" CellSpacing="7" >
            <asp:ListItem Value="58">合瓣花</asp:ListItem>
            <asp:ListItem Value="59">離瓣花</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        
        <asp:Label ID="LabelPerianth" runat="server" CssClass="option_title" 
            Text="花被裂片數目"></asp:Label>
        <asp:Image ID="ImagePerianth" runat="server" ImageUrl="~/images/icon/down.jpg" />
        <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtenderPerianth" runat="server"
        TargetControlID="PanelPerianth" CollapseControlID="ImagePerianth" ExpandControlID="ImagePerianth"
            TextLabelID = "" CollapsedText = "" ExpandedText = "" 
            ImageControlID = "ImagePerianth" CollapsedImage = "~/images/icon/down.jpg" ExpandedImage = "~/images/icon/up.jpg" 
            Collapsed="true">
        </ajaxToolkit:CollapsiblePanelExtender>
        <asp:Panel ID="PanelPerianth" runat="server" CssClass="illustration">
            <table class="table_illustration">
                <tr>
                    <td>
                        <img alt="" src="../images/illustration/perianth1.gif" class="img_illustration"/>
                        <br />花被片
                    </td>                    
                    <td>
                        <img alt="" src="../images/illustration/perianth2.jpg" class="img_illustration"/>
                        <br />花被片
                    </td>
                    <td>                       
                    </td>
                </tr>
            </table>
        </asp:Panel>    
        <asp:CheckBoxList ID="perianth" runat="server" 
            RepeatDirection="Horizontal" CellSpacing="7" >
            <asp:ListItem Value="60">0</asp:ListItem>
            <asp:ListItem Value="61">1</asp:ListItem>
            <asp:ListItem Value="62">2</asp:ListItem>
            <asp:ListItem Value="63">3</asp:ListItem>
            <asp:ListItem Value="64">4</asp:ListItem>
            <asp:ListItem Value="65">5</asp:ListItem>
            <asp:ListItem Value="66">6</asp:ListItem>
            <asp:ListItem Value="67">多花被</asp:ListItem>
        </asp:CheckBoxList>
        <br />
        
        <asp:Label ID="LabelAnthotaxy" runat="server" CssClass="option_title" 
            Text="花序形態"></asp:Label>
        <asp:Image ID="ImageAnthotaxy" runat="server" ImageUrl="~/images/icon/down.jpg" />
        <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtenderAnthotaxy" runat="server"
        TargetControlID="PanelAnthotaxy" CollapseControlID="ImageAnthotaxy" ExpandControlID="ImageAnthotaxy"
            TextLabelID = "" CollapsedText = "" ExpandedText = "" 
            ImageControlID = "ImageAnthotaxy" CollapsedImage = "~/images/icon/down.jpg" ExpandedImage = "~/images/icon/up.jpg" 
            Collapsed="true">
        </ajaxToolkit:CollapsiblePanelExtender>
        <asp:Panel ID="PanelAnthotaxy" runat="server" CssClass="illustration">
            <table class="table_illustration">
                <tr>
                    <td>
                        <img alt="" src="../images/illustration/anthotaxy68.gif" class="img_illustration"/>
                        <br />單生
                    </td>
                    <td>
                        <img alt="" src="../images/illustration/anthotaxy69.gif" class="img_illustration"/>
                        <br />穗狀
                    </td>
                    <td>
                        <img alt="" src="../images/illustration/anthotaxy70.gif" class="img_illustration"/>
                        <br />總狀
                    </td>                        
                    <td>
                        <img alt="" src="../images/illustration/anthotaxy71.gif" class="img_illustration"/>
                        <br />圓錐
                    </td>
                    <td>
                        <img alt="" src="../images/illustration/anthotaxy72.gif" class="img_illustration"/>
                        <br />繖形
                    </td>
                    <td>
                        <img alt="" src="../images/illustration/anthotaxy74.gif" class="img_illustration"/>
                        <br />聚繖
                    </td>
                </tr>                
                <tr>
                    <td>
                        <img alt="" src="../images/illustration/anthotaxy75.jpg" class="img_illustration"/>
                        <br />頭狀
                    </td>
                    <td>
                        <img alt="" src="../images/illustration/anthotaxy76.jpg" class="img_illustration"/>
                        <br />肉穗
                    </td>
                    <td>
                        <img alt="" src="../images/illustration/anthotaxy77.gif" class="img_illustration"/>
                        <br />柔荑
                    </td>
                    <td>
                        <img alt="" src="../images/illustration/anthotaxy78.gif" class="img_illustration"/>
                        <br />繖房
                    </td>
                    <td>
                        <img alt="" src="../images/illustration/anthotaxy79.jpg" class="img_illustration"/>
                        <br />佛焰
                    </td>
                    <td>
                    </td>
                </tr>               
            </table>
        </asp:Panel>    
        <asp:CheckBoxList ID="anthotaxy" runat="server" RepeatColumns="7" 
            RepeatDirection="Horizontal" CellSpacing="7">
            <asp:ListItem Value="68">單生</asp:ListItem>
            <asp:ListItem Value="69">穗狀</asp:ListItem>
            <asp:ListItem Value="70">總狀</asp:ListItem>
            <asp:ListItem Value="71">圓錐</asp:ListItem>
            <asp:ListItem Value="72">繖形</asp:ListItem>
            <asp:ListItem Value="73">叢生</asp:ListItem>
            <asp:ListItem Value="74">聚繖</asp:ListItem>
            <asp:ListItem Value="75">頭狀</asp:ListItem>
            <asp:ListItem Value="76">肉穗</asp:ListItem>
            <asp:ListItem Value="77">柔荑</asp:ListItem>
            <asp:ListItem Value="78">繖房</asp:ListItem>
            <asp:ListItem Value="79">佛燄</asp:ListItem>
            <asp:ListItem Value="80">輪繖</asp:ListItem>
            <asp:ListItem Value="90">團繖</asp:ListItem>
        </asp:CheckBoxList>
        <br />
        
        <asp:Label ID="LabelInflorescene" runat="server" CssClass="option_title" 
            Text="花期"></asp:Label>        
        <asp:CheckBoxList ID="inflorescene" runat="server" RepeatColumns="6" 
            RepeatDirection="Horizontal" CellSpacing="7" >
            <asp:ListItem Value="91">一月</asp:ListItem>
            <asp:ListItem Value="92">二月</asp:ListItem>
            <asp:ListItem Value="93">三月</asp:ListItem>
            <asp:ListItem Value="94">四月</asp:ListItem>
            <asp:ListItem Value="95">五月</asp:ListItem>
            <asp:ListItem Value="96">六月</asp:ListItem>
            <asp:ListItem Value="97">七月</asp:ListItem>
            <asp:ListItem Value="98">八月</asp:ListItem>
            <asp:ListItem Value="99">九月</asp:ListItem>
            <asp:ListItem Value="100">十月</asp:ListItem>
            <asp:ListItem Value="101">十一月</asp:ListItem>
            <asp:ListItem Value="102">十二月</asp:ListItem>
        </asp:CheckBoxList>
        <br />
        
        <asp:Label ID="LabelFruit" runat="server" CssClass="option_title" 
            Text="果實形態"></asp:Label>
        <asp:Image ID="ImageFruit" runat="server" ImageUrl="~/images/icon/down.jpg" />
        <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtenderFruit" runat="server"
        TargetControlID="PanelFruit" CollapseControlID="ImageFruit" ExpandControlID="ImageFruit"
            TextLabelID = "" CollapsedText = "" ExpandedText = "" 
            ImageControlID = "ImageFruit" CollapsedImage = "~/images/icon/down.jpg" ExpandedImage = "~/images/icon/up.jpg" 
            Collapsed="true">
        </ajaxToolkit:CollapsiblePanelExtender>
        <asp:Panel ID="PanelFruit" runat="server" CssClass="illustration">
            <table class="table_illustration">
                <tr>
                    <td>
                        <img alt="" src="../images/illustration/fruit103.jpg" class="img_illustration"/>
                        <br />毬果
                    </td>
                    <td>
                        <img alt="" src="../images/illustration/fruit104.jpg" class="img_illustration"/>
                        <br />蒴果
                    </td>
                    <td>
                        <img alt="" src="../images/illustration/fruit105.jpg" class="img_illustration"/>
                        <br />翅果
                    </td>
                    <td>
                        <img alt="" src="../images/illustration/fruit106.gif" class="img_illustration"/>
                        <br />核果
                    </td>
                    <td>
                        <img alt="" src="../images/illustration/fruit107.jpg" class="img_illustration"/>
                        <br />梨果
                    </td>
                    <td>
                        <img alt="" src="../images/illustration/fruit108.jpg" class="img_illustration"/>
                        <br />漿果
                    </td>
                </tr>               
                <tr>
                    <td>
                        <img alt="" src="../images/illustration/fruit109.jpg" class="img_illustration"/>
                        <br />瘦果
                    </td>
                    <td>
                        <img alt="" src="../images/illustration/fruit110.jpg" class="img_illustration"/>
                        <br />蓇葖果
                    </td>
                    <td>
                        <img alt="" src="../images/illustration/fruit112.jpg" class="img_illustration"/>
                        <br />梨果
                    </td>
                    <td>
                        <img alt="" src="../images/illustration/fruit114.jpg" class="img_illustration"/>
                        <br />聚合果
                    </td>
                    <td>
                        <img alt="" src="../images/illustration/fruit115.jpg" class="img_illustration"/>
                        <br />穎果
                    </td>
                    <td>                        
                    </td>
                </tr>                                          
            </table>
        </asp:Panel>    
        <asp:CheckBoxList ID="fruit" runat="server" RepeatColumns="7" 
            RepeatDirection="Horizontal" CellSpacing="7" >
            <asp:ListItem Value="103">毬果</asp:ListItem>
            <asp:ListItem Value="104">蒴果</asp:ListItem>
            <asp:ListItem Value="105">翅果</asp:ListItem>
            <asp:ListItem Value="106">核果</asp:ListItem>
            <asp:ListItem Value="107">離果</asp:ListItem>
            <asp:ListItem Value="108">漿果</asp:ListItem>
            <asp:ListItem Value="109">瘦果</asp:ListItem>
            <asp:ListItem Value="110">蓇葖果</asp:ListItem>
            <asp:ListItem Value="111">小堅果</asp:ListItem>
            <asp:ListItem Value="112">梨果</asp:ListItem>
            <asp:ListItem Value="113">薔薇果</asp:ListItem>
            <asp:ListItem Value="114">聚合果</asp:ListItem>
            <asp:ListItem Value="115">穎果</asp:ListItem>
        </asp:CheckBoxList>
        <br />
        
        <asp:Label ID="LabelPhyllotaxy" runat="server" CssClass="option_title" 
            Text="葉序"></asp:Label>
        <asp:Image ID="ImagePhyllotaxy" runat="server" ImageUrl="~/images/icon/down.jpg" />
        <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtenderPhyllotaxy" runat="server"
        TargetControlID="PanelPhyllotaxy" CollapseControlID="ImagePhyllotaxy" ExpandControlID="ImagePhyllotaxy"
            TextLabelID = "" CollapsedText = "" ExpandedText = "" 
            ImageControlID = "ImagePhyllotaxy" CollapsedImage = "~/images/icon/down.jpg" ExpandedImage = "~/images/icon/up.jpg" 
            Collapsed="true">
        </ajaxToolkit:CollapsiblePanelExtender>
        <asp:Panel ID="PanelPhyllotaxy" runat="server" CssClass="illustration">
            <table class="table_illustration">               
                <tr>
                    <td>
                        <img alt="" src="../images/illustration/phyllotaxy121.gif" class="img_illustration"/>
                        <br />叢生
                    </td>
                    <td>
                        <img alt="" src="../images/illustration/phyllotaxy124.gif" class="img_illustration"/>
                        <br />對生
                    </td>
                    <td>
                        <img alt="" src="../images/illustration/phyllotaxy125.gif" class="img_illustration"/>
                        <br />互生
                    </td>
                    <td>
                        <img alt="" src="../images/illustration/phyllotaxy127.gif" class="img_illustration"/>
                        <br />輪生
                    </td>
                    <td>
                        <img alt="" src="../images/illustration/phyllotaxy129.jpg" class="img_illustration"/>
                        <br />基生
                    </td>
                    <td>
                    </td>
                </tr>                
            </table>
        </asp:Panel>    
        <asp:CheckBoxList ID="phyllotaxy" runat="server" 
            RepeatDirection="Horizontal" CellSpacing="7" >
            <asp:ListItem Value="121">叢生</asp:ListItem>
            <asp:ListItem Value="122">根莖上散生</asp:ListItem>
            <asp:ListItem Value="123">遠生</asp:ListItem>
            <asp:ListItem Value="124">對生</asp:ListItem>
            <asp:ListItem Value="125">互生</asp:ListItem>
            <asp:ListItem Value="126">四行排列</asp:ListItem>
            <asp:ListItem Value="127">輪生</asp:ListItem>
            <asp:ListItem Value="128">螺旋狀</asp:ListItem>
            <asp:ListItem Value="129">基生</asp:ListItem>
        </asp:CheckBoxList>
        <br />
        
        <asp:Label ID="LabelLeaf" runat="server" CssClass="option_title" 
            Text="葉"></asp:Label>
        <asp:Image ID="ImageLeaf" runat="server" ImageUrl="~/images/icon/down.jpg" />
        <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtenderLeaf" runat="server"
        TargetControlID="PanelLeaf" CollapseControlID="ImageLeaf" ExpandControlID="ImageLeaf"
            TextLabelID = "" CollapsedText = "" ExpandedText = "" 
            ImageControlID = "ImageLeaf" CollapsedImage = "~/images/icon/down.jpg" ExpandedImage = "~/images/icon/up.jpg" 
            Collapsed="true">
        </ajaxToolkit:CollapsiblePanelExtender>
        <asp:Panel ID="PanelLeaf" runat="server" CssClass="illustration">
            <table class="table_illustration">                
                <tr>
                    <td>
                        <img alt="" src="../images/illustration/leaf10.gif" class="img_illustration"/>
                        <br />單葉
                    </td>
                    <td>
                        <img alt="" src="../images/illustration/leaf12.gif" class="img_illustration"/>
                        <br />複葉
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>                
            </table>
        </asp:Panel>    
        <asp:RadioButtonList ID="leaf" runat="server" 
            RepeatDirection="Horizontal" CellSpacing="7" >
            <asp:ListItem Value="10">單葉</asp:ListItem>
            <asp:ListItem Value="12">複葉</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        
        <asp:Label ID="LabelCompoundLeaf" runat="server" CssClass="option_title" 
            Text="複葉形態"></asp:Label>
        <asp:Image ID="ImageCompoundLeaf" runat="server" ImageUrl="~/images/icon/down.jpg" />
        <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtenderCompoundLeaf" runat="server"
        TargetControlID="PanelCompoundLeaf" CollapseControlID="ImageCompoundLeaf" ExpandControlID="ImageCompoundLeaf"
            TextLabelID = "" CollapsedText = "" ExpandedText = "" 
            ImageControlID = "ImageCompoundLeaf" CollapsedImage = "~/images/icon/down.jpg" ExpandedImage = "~/images/icon/up.jpg" 
            Collapsed="true">
        </ajaxToolkit:CollapsiblePanelExtender>
        <asp:Panel ID="PanelCompoundLeaf" runat="server" CssClass="illustration">
            <table class="table_illustration">
                <tr>
                    <td>
                        <img alt="" src="../images/illustration/compoundLeaf116.gif" class="img_illustration"/>
                        <br />三出
                    </td>
                    <td>
                        <img alt="" src="../images/illustration/compoundLeaf117.gif" class="img_illustration"/>
                        <br />羽狀
                    </td>
                    <td>
                        <img alt="" src="../images/illustration/compoundLeaf118.gif" class="img_illustration"/>
                        <br />掌狀
                    </td>
                    <td>                        
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>                                
            </table>
        </asp:Panel>    
        <asp:RadioButtonList ID="compoundLeaf" runat="server" 
            RepeatDirection="Horizontal" CellSpacing="7" >
            <asp:ListItem Value="116">三出</asp:ListItem>
            <asp:ListItem Value="117">羽狀</asp:ListItem>
            <asp:ListItem Value="118">掌狀</asp:ListItem>
            <asp:ListItem Value="119">鳥足狀</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        
        <asp:Label ID="LabelPinnate" runat="server" CssClass="option_title" 
            Text="羽狀複葉型態"></asp:Label>
        <asp:Image ID="ImagePinnate" runat="server" ImageUrl="~/images/icon/down.jpg" />
        <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtenderPinnate" runat="server"
        TargetControlID="PanelPinnate" CollapseControlID="ImagePinnate" ExpandControlID="ImagePinnate"
            TextLabelID = "" CollapsedText = "" ExpandedText = "" 
            ImageControlID = "ImagePinnate" CollapsedImage = "~/images/icon/down.jpg" ExpandedImage = "~/images/icon/up.jpg" 
            Collapsed="true">
        </ajaxToolkit:CollapsiblePanelExtender>    
        <asp:Panel ID="PanelPinnate" runat="server" CssClass="illustration">
            <table class="table_illustration">
                <tr>
                    <td>
                        <img alt="" src="../images/illustration/pinnate13.gif" class="img_illustration"/>
                        <br />一回羽裂
                    </td>
                    <td>
                        <img alt="" src="../images/illustration/pinnate14.gif" class="img_illustration"/>
                        <br />一回
                    </td>
                    <td>
                        <img alt="" src="../images/illustration/pinnate15.gif" class="img_illustration"/>
                        <br />二回羽裂
                    </td>
                    <td>
                        <img alt="" src="../images/illustration/pinnate16.gif" class="img_illustration"/>
                        <br />二回
                    </td>
                    <td>
                        <img alt="" src="../images/illustration/pinnate18.gif" class="img_illustration"/>
                        <br />三回
                    </td>
                    <td>                      
                    </td>
                </tr>                
            </table>
        </asp:Panel>
        <asp:CheckBoxList ID="pinnate" runat="server" 
            RepeatDirection="Horizontal" CellSpacing="7" >
            <asp:ListItem Value="13">一回羽裂</asp:ListItem>
            <asp:ListItem Value="14">一回</asp:ListItem>
            <asp:ListItem Value="15">二回羽裂</asp:ListItem>
            <asp:ListItem Value="16">二回</asp:ListItem>
            <asp:ListItem Value="17">三回羽裂</asp:ListItem>
            <asp:ListItem Value="18">三回</asp:ListItem>
            <asp:ListItem Value="19">四回羽裂</asp:ListItem>
            <asp:ListItem Value="20">四回</asp:ListItem>
        </asp:CheckBoxList>
        <br />
        
        <asp:Label ID="LabelPerispore" runat="server" CssClass="option_title" 
            Text="孢膜"></asp:Label>
        <asp:CheckBoxList ID="perispore" runat="server" 
            RepeatDirection="Horizontal" CellSpacing="7" >
            <asp:ListItem Value="27">有孢膜</asp:ListItem>
            <asp:ListItem Value="29">假孢膜</asp:ListItem>
        </asp:CheckBoxList>
        <br />
        
        <asp:Label ID="LabelPerisporeType" runat="server" CssClass="option_title" 
            Text="孢膜及孢子囊群形態"></asp:Label>
        <asp:CheckBoxList ID="perisporeType" runat="server" 
            RepeatColumns="7" RepeatDirection="Horizontal"  CellSpacing="7" >
            <asp:ListItem Value="31">線型</asp:ListItem>            
            <asp:ListItem Value="35">圓形</asp:ListItem>
            <asp:ListItem Value="40">球狀</asp:ListItem>
            <asp:ListItem Value="43">圓柱狀</asp:ListItem> 
            <asp:ListItem Value="36">橢圓形</asp:ListItem> 
            <asp:ListItem Value="34">馬蹄形</asp:ListItem>           
            <asp:ListItem Value="44">四角柱狀</asp:ListItem>            
            <asp:ListItem Value="39">碗狀</asp:ListItem>            
            <asp:ListItem Value="32">腎形</asp:ListItem>
            <asp:ListItem Value="33">J 型</asp:ListItem>
            <asp:ListItem Value="37">香腸形</asp:ListItem>
            <asp:ListItem Value="38">魚鱗形</asp:ListItem>            
            <asp:ListItem Value="41">兩瓣狀</asp:ListItem>
            <asp:ListItem Value="42">葉背全面散生</asp:ListItem>
        </asp:CheckBoxList>
        <br />
        <asp:Button ID="btnQuery" runat="server" Text="查詢" />
        &nbsp;
        <asp:Button ID="btnReset" runat="server" Text="重設" />
    </div>
</asp:Content>

