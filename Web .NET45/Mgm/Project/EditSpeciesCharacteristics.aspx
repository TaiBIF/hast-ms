<%@ Page Language="VB" AutoEventWireup="false" CodeFile="EditSpeciesCharacteristics.aspx.vb" Inherits="Mgm_Project_EditSpeciesCharacteristics" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
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
        <asp:RadioButtonList ID="petal" runat="server"
          RepeatDirection="Horizontal" CellSpacing="7" >
            <asp:ListItem Value="58">合瓣花</asp:ListItem>
            <asp:ListItem Value="59">離瓣花</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        
        <asp:Label ID="LabelPerianth" runat="server" CssClass="option_title" 
            Text="花被裂片數目"></asp:Label>   
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
        <asp:RadioButtonList ID="leaf" runat="server" 
            RepeatDirection="Horizontal" CellSpacing="7" >
            <asp:ListItem Value="10">單葉</asp:ListItem>
            <asp:ListItem Value="12">複葉</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        
        <asp:Label ID="LabelCompoundLeaf" runat="server" CssClass="option_title" 
            Text="複葉形態"></asp:Label>   
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
        <asp:Button ID="btnSave" runat="server" Text="Save" />
&nbsp;
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
        <br />
    </div>
    </form>
</body>
</html>
