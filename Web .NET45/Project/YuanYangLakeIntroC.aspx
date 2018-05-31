<%@ Page Language="VB" MasterPageFile="~/MasterPageYYLC.master" AutoEventWireup="false" CodeFile="YuanYangLakeIntroC.aspx.vb" Inherits="Project_YuanYangLakeIntroC" title="HAST - 鴛鴦湖自然保留區簡介" %>

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
    <div id="main_content">
    
        
    <br />
    <h4>鴛鴦湖自然保留區數位植物誌 - 簡介</h4>    
        <div id="article">
            <p>
                「鴛鴦湖自然保留區」位於棲蘭山國有林區內的精華位置，地理位置介於新竹、桃園及宜蘭縣交界處，行政劃分上屬於新竹縣尖石鄉。保留區的總面積為374公頃，其中湖面約3.75公頃，沼澤地約2.2公頃，鴛鴦湖為大漢溪流域集水區的最上游地區，為棲蘭山地區天然溼地植物社會的代表，由湖畔溼地到山脈稜線以台灣扁柏最為優勢，為台灣扁柏型植物社會。保留區地處涼溫帶針闊葉混合林帶，屬中海拔霧林帶地區，海拔高度介於1,650-2,450m之間，湖水面海拔為1,670m，年均溫約為13 
                ℃。保留區東方屬蘭陽溪流域，直接承受來自冬季東北季風及夏季颱風溯蘭陽溪谷，翻越雪山山脈所帶來的雨水，因此雨量甚高，年降雨量約4,000mm。保留區位於稜線的西側，屬大漢溪流域，為石門水庫上游集水區，雖處於背風面，年降雨量仍達2,000mm，使鴛鴦湖一帶成為全台全年最濕潤的中海拔雲霧帶，為溫帶重濕的氣候，在此區域發生濃霧及雲海的頻率相當高，隨處可見濃密的苔蘚覆蓋在林床、倒木、樹幹及樹枝上，顯示台灣中海拔特有的濕潤霧林特質，舉世聞名的台灣檜木的故鄉就在此地，這也是政府規劃中的馬告國家公園之預定範圍。</p>
            <p>
                熱帶山區雲霧林為陸地生態系中相當特殊的林型（柳榗，1975；楊寶霖，1976），在台灣的山地森林植群中扮演一明顯的分界線，此線以上為代表寒冷氣候的針葉林，以下則為代表溫溼氣候的常綠闊葉林（Su，1985；1994）；由於盛行雲霧的氣候條件維持了檜木霧林帶內自然環境之恆定性，因此保存了自冰河時期遷徙至台灣的許多孓遺植物如紅檜、台灣扁柏、台灣杉、紅豆杉等（Peng 
                et al.， 
                1994）。其中如檜木屬（Chamaecyparis）植物，今日僅間斷分布於東亞及北美，此種東亞-北美間斷分布之類型，顯示其祖先在2億年前歐亞和北美仍相聯結之古大陸時期即已存在，後因板塊移動使歐亞北美大陸分離，始形成現今之間斷分布情形；又如舉世聞名的台灣杉（Taiwania）-唯一以台灣為屬名的植物，以及巒大杉、紅豆杉、昆欄樹、八角蓮、台灣青莢葉、台灣樹參、台灣馬醉木及其他繁多孓遺植物，亦均以此一林帶為其主要生育環境。根據最新的資料，鴛鴦湖及棲蘭山區的維管束植物共1,009種，約占台灣植物總數的四分之一，其中台灣特有種佔38.5%，明顯高於全島特有植物之比例（約20%），堪稱台灣生物多樣性的熱點（hotspot），是以檜木林帶雖非台灣生物多樣性最高的地區，但卻是特有種比例最高的地區，此一現象在國外其他地區也有類似之情形，為台灣生物多樣性保育重點研究的地區（王震哲，2000）。</p>
            <p>
                本實驗室自1992年鴛鴦湖長期生態研究計劃開始以來，多年來持續在鴛鴦湖自然保留區進行調查，累積豐富的標本館藏及生態影像資料。鴛鴦湖長期生態研究計劃為中研院植物所的大型團隊研究計畫，由周昌弘院士主持，內容包括植物社會形成之機制、基礎生產力研究、氮素循環之研究、水域生態系研究及水生植物適應機制等研究，本實驗室主要進行鴛鴦湖植物社會之調查，由研究成果得知保留區內植物種類十分豐富，目前所知計有蕨類植物75種、裸子植物8種、雙子葉植物228種、單子葉植物64種，共計375種，其中棲蘭山杜鵑、鴛鴦湖細辛、鴛鴦湖龍膽和鴛鴦湖燈心草為近年學界發表的新種及新紀錄植物；東亞黑三稜、單穗苔、白穗刺子莞、箭葉蓼等物種更是只分布在此區域的台灣稀有及瀕危植物。由於鴛鴦湖得天獨厚的地理、自然環境及優越的研究條件使得各領域的長期生態研究計劃持續在此進行中。</p>
            <p>
                鴛鴦湖為大漢溪集水區的最上游地區，湖水面積3.75公頃，草澤地2.2公頃，為棲蘭山地區天然溼地植物社會的代表。整個溼地環境可以區分為湖中水生植物及沼澤地植物群落。鴛鴦湖中的浮水植物僅有眼子菜一種，挺水植物則以東亞黑三稜及水毛花為主。沼澤地區則以草本植物群落為主，組成包括水毛花、高山芒、燈心草、箭葉蓼、單穗薹、小葉四葉葎、白穗刺子莞、戟葉蓼、火炭母草等，並有少量灌木樹種，如小葉石楠、假柃木、假繡球、壺花莢蒾、水亞木、棲蘭杜鵑、阿里山灰木等（柳榗、徐國士，1973；Chou 
                et 
                al.，2000）。保留區內的森林植物社會則包括柳杉造林地及台灣扁柏原始林。柳杉造林地位於保留區的東北角稜線附近，面積相當小。保留區內的森林林份結構僅具有三個層次，缺乏第二層闊葉樹喬木層，且組成樹種中未發現殼斗科植物。整個區域內皆以台灣扁柏為最優勢的植物，台灣扁柏構成了此區域的第一樹冠層，高度約30-35m；闊葉樹種則構成森林中的灌木層，密度相當高，只有少數闊葉樹種能生長到樹冠層的高度，灌木層的優勢樹種包括白花八角、台灣杜鵑、厚皮香、紅淡比、昆欄樹、深山野牡丹、高山新木薑子、台灣樹參、深紅茵芋等；草本層則以台灣瘤足蕨為優勢，並伴隨有耳形瘤足蕨，五葉黃連，裂緣花、裂葉樓梯草、鴛鴦湖細辛等。著生植物種類則有細葉蕗蕨、肢節蕨、波氏星蕨、著生杜鵑、臺灣一葉蘭等（Chou 
                et al.，2000；王震哲，2000）。</p>
            <p>
                「鴛鴦湖及棲蘭山地區數位植物誌」將以執行「台灣本土植物數位典藏計畫」的成果與經驗為基礎，建立資源分享平台，將生硬的系統分類學知識轉化為對一般使用者具親合力之知識教育介面，彙整植物誌、論文期刊、標本館植物標本、生態影像、地理分布等相關資訊。藉由網路的普及性及便利性進行科普推廣，網頁的內容可持續增加資訊的豐富度與完整性，並可將最新的研究成果及物種分類處理適時進行訂正，以提供即時及正確的資訊，並將本實驗多年來持續在鴛鴦湖及棲蘭山國有林地區進行調查的研究成果以具體整合的網頁樣式呈現。</p>
            <p>
                &nbsp;</p>
        </div>
    </div>
</asp:Content>

