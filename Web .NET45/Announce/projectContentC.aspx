<%@ Page Language="VB" MasterPageFile="~/MasterPageTWFlora.master" AutoEventWireup="false" CodeFile="projectContentC.aspx.vb" Inherits="Announce_projectContentC" title="HAST - 台灣本土植物資料庫 - 資料庫介紹" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    
    <link href="../Styles/Style.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/twfloraOld.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/TWFlora.css" rel="stylesheet" type="text/css" />
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="site_label">
        <img height="36" src="../images/ic-1-4.jpg"  /><br />
        <img height="20" src="../images/ic-2-8.jpg" width="203" /><br />
    </div>           
          
          <div id="announce">
         
              <h5>
                  <a href="../Specimens/specimenQueryC.aspx" 
                      target="_blank">台灣本土植物標本資料庫</a></h5>
              <p>
                  　 
                  中央研究院植物標本館典藏之標本目前已逾120,000號，其中採集自台灣本地者約85,000號，經由分析標本標籤內容及網路上資料庫查詢欄位之互通性，並參考國際間重要之植物資料庫，建立一套中英文雙語，兼具文字記錄、植物標本影像的台灣本土植物標本資料查詢系統。 
                  <br />
                  <span class="style5">目前資料庫建檔內容統計：共76,027筆 </span>
              </p>
              <br />
          
              
                <h5>
                    <a href="../Photo/imageQueryC.aspx" target="_blank">
                    台灣本土植物影像資料庫</a></h5>
              <p>
                  　　台灣本土植物影像資料庫典藏以台灣原生維管束植物生態照為主要內容，保存珍貴的影像記錄，記錄了台灣寶貴的自然資源，並為專業學術研究奠定良好的基礎。此外，精彩寫實的生態照片，除可提供教學輔助參考之外，亦是一般大眾認識台灣原生植物的最佳管道。 
              </p>
              <br />
          
                <h5>
                    <a href="http://db1n.sinica.edu.tw/textdb/hast/literature_q.php" 
                        target="_blank">台灣本土植物文獻資料庫</a></h5>
              <p>
                  　　台灣本土植物文獻資料庫以台灣原生維管束植物分類文獻為主要典藏內容，建立一套台灣本土植物的分類書目資料系統，而將各時期、各分類群之資訊以資料庫查詢之方式呈現，其中以台灣早期植物分類文獻資料之整理建檔，提供植物學研究人員相當大之助益，同時有效進行標本館館藏文獻之建檔及管理。 
              </p>
              <br />
         
                <h5>
                    <a href="http://webgis.sinica.edu.tw/website/plant/viewer.htm" target="_blank">
                    台灣本土植物分布資料庫</a></h5>
              <p>
                  　　配合網際網路空間資訊系統（WebGIS）的技術研發，整合標本採集地之經緯度數據，製作「台灣植物採集地分布圖」，與標本資料庫內容結合，透過地圖直接針對地區查詢標本採集記錄及植物資料，亦可由地圖顯示某種植物在台灣的分布狀況；對台灣植被研究及生態、保育等方面將大有助益。 
              </p>
              <br />
         </div>
          
</asp:Content>

