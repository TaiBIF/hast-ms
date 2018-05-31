<%@ Page Language="VB" MasterPageFile="~/MasterPageTWFlora.master" AutoEventWireup="false" CodeFile="InfoDocumentC.aspx.vb" Inherits="Announce_documentC" title="HAST - 台灣本土植物資料庫 - 文件下載" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <link href="../Styles/Style.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/twfloraOld.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/TWFlora.css" rel="stylesheet" type="text/css" />
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="site_label">
        <img src="../images/ic-1-3.jpg" width="106" height="36" /><br />
        <img src="../images/ic-2-4.jpg" width="203" height="20" /><br />
    </div> 

    <div id="announce">
        <ul>
               <li>
                   台灣維管束植物編碼索引[2003年6月增編修訂]
                   <a href="http://taiwanflora.sinica.edu.tw/ch/download/code.xls" target="_blank"><img src="../images/excel.gif" border="0"/></a>
                   <a href="http://taiwanflora.sinica.edu.tw/ch/download/code.doc" target="_blank"><img src="../images/word.gif" border="0"/></a>
               </li>          
               <li>
                   台灣維管束植物編碼索引（編碼手冊新增原則）<a href="http://taiwanflora.sinica.edu.tw/ch/download/explain.doc" target="_blank"><img src="../images/word.gif" border="0" /></a>
               </li>         
               <li>
                   台灣本土植物資料庫欄位分群與比對<a href="http://taiwanflora.sinica.edu.tw/ch/download/tpdb_gc.xls" target="_blank"><img src="../images/excel.gif" border="0" /></a>
               </li>
               <li>
                   台灣維管束植物編碼索引 （2002/01/04）農委會正式版<a href="http://taiwanflora.sinica.edu.tw/ch/download/COAsX2002-01-14().xls" target="_blank"><img src="../images/excel.gif" border="0" /></a>
               </li>
               <li>
                   植物標本METADATA發展與分析報告（二）2001/6/7 <a href="http://taiwanflora.sinica.edu.tw/ch/download/010607Her5.pdf" target="_blank"><img src="../images/pdf.gif" border="0" /></a>
               </li>          
               <li>
                   植物標本METADATA發展與分析報告（一） 2001/4/30</span> <a href="http://taiwanflora.sinica.edu.tw/ch/download/010430Her3.pdf" target="_blank"><img src="../images/pdf.gif" border="0" /></a>
               </li>          
               <li>
                   國際標本館資訊標準與資料交換協定（HISPIS3）<a href="http://taiwanflora.sinica.edu.tw/ch/download/HISDRAFT.DOC" target="_blank"><img src="../images/word.gif" border="0" /></a><br />
                   Herbarium Information Standards  and Protocols for Interchange of Data
               </li>
        </ul>
    </div>
            
</asp:Content>

