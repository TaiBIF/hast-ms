<%@ Page Language="VB" MasterPageFile="~/MasterPageTWFlora.master" AutoEventWireup="false" CodeFile="projectDescriptionC.aspx.vb" Inherits="Announce_ProgramDescriptionC" title="HAST - 台灣本土植物資料庫 - 計畫內容" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <link href="../Styles/Style.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/twfloraOld.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/TWFlora.css" rel="stylesheet" type="text/css" />
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="site_label">
        <img src="../images/ic-1-2.jpg"  /><br />
        <img src="../images/ic-2-12.jpg" /><br />
    </div>

    <div id='announce'>    
        <span><strong>一、台灣本土植物資源之重要與計畫依據</strong></span><br />
        <p>
           台灣地區位處亞熱帶，由於特殊的地理位置與多樣化的生態環境，加上全島高山林立，海拔高差幾達4,000公尺，涵括了熱、暖、溫、寒不同的氣候帶，因而孕育了極為豐富的生物相。根據初步估計，台灣擁有維管束植物約4,000種，單位面積物種歧異度之高，為世界上絕大部份的地區所無法比擬，堪稱是地球上重要的生物資源庫。惟這些極為豐富的天然資源，由於近年來台灣人口成長與經濟發展，以及對環境資源的超限利用，自然生態環境相對也遭受到極大的破壞，許多生物種類已經受到威脅或瀕臨滅絕的危機。因此，建立一套詳實便捷、有效整合與管理本土植物資訊的資料庫，以了解物種的名稱、分布、數量、物候、生育環境現況，作為植物保育、土地利用、保護區規劃、資源經營管理等工作之參考，及進一步進行環境監測之依據，在現階段及未來有其急迫性與必要性。
           <br />
           由於生物多樣性的資料相當龐雜，基礎資料的建立顯得相當重要，而物種基礎資料之記錄匯集、管理與保存更可說是生物領域研究的基礎，所以生物資訊是否充分交流與方便擷取對於生物多樣性之研究影響至鉅。為了能使生物多樣性之科學資料提供充分而便捷的應用，網路資源的提供與延伸無疑是最適合的策略，而生物科學資料庫之建置更在1994年國科會生物科學之學門及資源規劃中已列為重點研究方向之一，可惜目前生物科學資料庫之建置多分散各地，而自行開發的資料庫亦缺乏聯繫，因此如何妥善的管理、應用與整合生物科學資料與生物科學資料庫系統無疑是目前最為迫
        </p>
        <br />
        <strong>二、台灣本土植物典藏之數位化</strong> <br />
        <p>
           中央研究院生物多樣性研究中心典藏豐富的台灣本土植物資料、文獻、珍貴標本、野生植物及棲地影像，可供學術研究、生態保育、環境影響評估、相關產業開發等之參考。本計畫擬將台灣本土植物標本採集記錄、標本影像、植物生態照及植物分類相關文獻等加以數位化，建置一套兼具文字與影像的台灣植物資源查詢系統，提供各界人士使用，以期使此項資源受到更有效的運用，發揮更大功能。同時並配合網際網路空間資訊系統（WebGIS）的技術研發，整合標本採集地之經緯度數據，可依使用者需求自行製作「台灣植物分布圖」，與標本資料庫內容結合，並顯示植物物種在台灣的分布狀況，將地理分布與標本資料、物種文獻與植物影像整合為「台灣本土植物資料庫」。
        </p>
        <br />
        <strong>三、相關主題之研究發展與國內相關計畫 </strong><br />
        <p>
           目前國際生物多樣性後設資料之發展分別在於互通性與標準化，整合生物多樣性資源的主要挑戰來自於太多類型的生物資訊卻沒有統一的標準。近年來，國際上相繼進行生物資訊基礎建設與生物多樣資訊網路的後設資料相關議題討論；例如，<a href='http://www.nbii.gov' target='_blank'>美國生物資訊內設架構（NBII, National Biological Information  Infrastructure）</a>，在生物科學社群與其他相關社群間扮演資訊基礎建設連接與互通的橋樑；<a href='http://nbn.org.uk' target='_blank'>英國生物多樣性網路（NBN, National Biodiversity Network）</a>，重點發展與確認標準化之生物資料；<a href='http://www.iabin-us.org' target='_blank'>美洲國際生物多樣性資訊網路（IABIN, Inter-American Biodiversity Information Network）</a>，倡導泛美洲地區國家有效的蒐集、共享與使永生物多樣性相關資訊；目前，以<a href='http://www.gbif.org' target='_blank'>全球生物多樣性機構（GBIF, The Global Biodiversity Information  Facility）</a>為最大的國際性生物多樣性組織，配合生物多樣性國際公約之要求，推動全球生物多樣性資料之蒐集、整理、保存與相互交換，使各國之生物多樣性資訊可與全球其他國家交流，對於生物多樣性之保育、利用、教育與研究十分重要。
           <br />
           <br />
           國內目前已成立「台灣生物多樣性資訊機構」（TaiBIF），並加入GBIF，以期能儘速推動國內生物多樣性資料之數位化典藏、資料庫之整合及上網等工作。而在植物學領域參與相關工作的單位正陸續增加，除中央研究院生物多樣性研究中心外，國立自然科學博物館植物學組、國立台灣大學植物標本館、行政院農委會林業試驗所標本館等單位都已進行本土植物標本及資訊數位化，期望在資料整合與資料庫系統維持各單位特色及個別需求前提之下，建立通用、標準化之資料庫系統，並以作為建構國內單一窗口之基礎，與國際接軌。<br />
        </p>
        <br />
    </div>
          
</asp:Content>

