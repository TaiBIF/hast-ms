<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageSinicaOutSkirts.master" AutoEventWireup="false" CodeFile="SinicaOutskirtsIntroC.aspx.vb" Inherits="Project_SinicaOutskirtsIntroC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Styles/Style.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/TWFlora.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .specimen_list_header
        {
        	background-color:rgb(172,214,203);
            color:Black;
        	
        }
        
        .specimen_list_row
        {
        	background-color:rgb(229,245,241);
        }
        .specimen_list_alterrow
        {
        	background-color:rgb(213,234,229);
        }
        .specimen_list_pager
        {
        	background-color:rgb(61,138,130);
        } 
        #article
        {        	
        	margin:50px;
        	font-size:10pt;
        	word-spacing:3px;
            	
        	        	
        }
        
        #main_content
        {
        	margin:20px;
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
    <br />
    <h4>台灣本土植物資料庫 － 中研院近郊數位植物誌</h4>
    <div id="article">
        <p>中研院位於大台北盆地的東南側，行政區域劃屬台北市南港區，鄰近地區環繞翠綠的山林美景，西南方以南港山系與台北市信義區、文山區為鄰，東南側以土庫岳山系與新北市深坑區、石碇區為鄰。中研院院區內仍舊保有一片稻田景觀，並有復育成功的生態池、緊鄰活動中心後方的小山丘自然生態步道，具有豐富的生物資源值得認真的調查紀錄，將中研院近郊美好的環境及植物資訊運用網路與社會大眾一同分享。</p>
        <p>台北近郊低海拔闊葉林在數十年來的次生演替下，許多低海拔的森林已回復成穩定的狀態，在植物的組成及結構上呈現出多樣的物種種類與複層森林的現象，而並非單調、結構鬆散的初期次生林(蘇聲欣，2001)。森林植群包括桑科闊葉樹林區、樟科闊葉樹林區以及部分的殼斗科闊葉樹林區(陳玉峰，1995)，由於受到東北季風的影響程度不同，森林植群分為六大群叢：「紅楠-大明橘-山紅柿群叢」代表著面對東北季風強烈影響下的森林植群，具有硬葉林(灌叢)、森林層次分化不明、樹高降低、林木密度增大、徑級較小等形相特徵，而可以稱為東北季風風壓林；「紅楠-香楠-江某群叢」則代表季風效應減弱的地區；而在季風效應減弱，且地勢較低、潮濕的山坡下側及溪溝附近森林則改變以榕屬植物為優勢的「菲律賓榕-水同木-島榕-幹花榕群叢」；大屯火山群因特殊的火成岩地質環境發展出「紅楠-樹杞-大葉楠群叢」；寬闊溪流及河川兩側則轉變為「大葉楠群叢」；海拔較高、靠近雪山山脈尾稜地區的新店、木柵、石碇、平溪等地區出現「長尾栲-烏來柯-錐果櫟-紅楠群叢」。台北地區海拔700公尺以下的闊葉樹森林具有榕楠林、楠儲林甚至部分櫟林帶下層的森林植群帶，可歸類為廣義的東北季風林 (蘇聲欣，2001)。中研院近郊擁有許多豐富的自然生態環境，十分值得將所有研究學者的努力成果運用網路，結合文字、圖片及引證標本介紹台北近郊低海拔闊葉林的多樣植群生態及植物資源。 </p>
        <p>中央研究院及近郊數位植物誌計畫，首先將介紹「院區內的植物景觀」，包含生態池、小山丘自然生態步道，接著介紹台北市南港、信義區交界的「南港山系、四獸山步道」，南港山海拔374公尺，稜線上展望極佳，可展望整個大台北市，熱鬧的信義商圈就在南港山系的山腳下，之後介紹「土庫岳山系」，土庫岳舊名望高寮，海拔389公尺，山頂有一等三角點，為大台北盆地東南側重要的山岳，然後介紹台北市文山區南側重要的「二格山系」，二格山是木柵貓空、深坑、石碇地區的名山，海拔678公尺，步道系統發達，生態豐富，最後介紹新北市石碇區內的「皇帝殿山群」，奇特的岩石稜線景觀，蘊藏著許多特殊植物於此地。中研院近郊交通便捷，假日早已成為大台北地區居民假日休閒踏青的好去處，只要半天的時間，就能享受大自然的美好舒適，早期雖有先民開墾種植農產作物，不過近年來由於經濟型態逐漸轉型，對台北盆地近郊環境的人為干擾降低很多，自然生態環境也慢慢的回復次生林的多樣景觀。中央研究院及近郊數位植物誌計畫預計針對五個重點地區個別介紹40種原生植物，總計200種台北近郊低海拔的常見、美麗及特殊植物進行深入介紹，呈現中央研究院的研究成果，兼具科普推廣與改善學術研究環境之效。社會大眾在登山健行休閒之餘，也可以親近大自然的花花草草，放鬆身心，紓解生活壓力，除了有益健康外，更可以增加知性內涵，欣賞大自然的美好。 </p>
    </div>

</asp:Content>

