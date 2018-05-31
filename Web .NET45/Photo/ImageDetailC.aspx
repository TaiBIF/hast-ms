<%@ Page Language="VB" MasterPageFile="~/MasterPageTWFlora.master" AutoEventWireup="false" CodeFile="ImageDetailC.aspx.vb" Inherits="Photo_ImageDetailC" title="HAST - 台灣本土植物資料庫 - 生態影像詳細資料" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server" >
    
    <!--link href="http://www.hast.biodiv.tw/Styles/Style.css" rel="stylesheet" type="text/css" /-->
    <link href="../Styles/Style.css" rel="stylesheet" type="text/css" />    
    <link href="../Styles/TWFlora.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        #image_main
        {
        	text-align:center;
        	margin-left:auto;
        	margin-right:auto;
        	width:1000px;
        }
        
        #image_content
        {
        text-align:center;
        
        margin-left:auto;
        margin-right:auto;
        border:solid 1px black;  
        }
        
               
        .image_detail
        {
	        font-size:10pt;
	        
	        width:100%;
	        
	        padding: 0;
	        border:solid 1px white; 
	        text-align:left;    
        	
        }
        .image_detail tr td
        {
        	border:solid 1px white; 
        	
        }
                
         .item_header
        {
        	width:80px;
        	background-color:#77B371;
        	color:White;
        }
        .item_field
        {
        	background-color:#AAFFCC;
        }
        #check_test
        {
        	color:Black;
        	
        }
        
        
    </style>
    
   
   

   
</asp:Content>
<asp:Content   ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <asp:FormView ID="FormView1" runat="server" DataSourceID="SDSImage">
        <ItemTemplate>
            <div id="image_main"> 
            <table id="image_content">
                <tr>
                    <td>
                         <img alt="" src='<%# GetImageFilePath(Eval("imageCode")) %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        <table class="image_detail">
                    <tr>
                        <td class="item_header">
                            圖檔 
                        </td>
                        <td class="item_field">
                           <%#Server.HtmlEncode(Eval("imageCode").ToString())%>&nbsp;
                           <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "../Mgm/Secure/download.aspx?imageCode=" + Eval("imageCode") %>'>Download</asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td class="item_header">
                            物種名
                        </td>
                        <td class="item_field">
                            <asp:Label ID="lblSpecies" runat="server" 
                                Text='<%# Eval("speciesE") %>'></asp:Label>
                            &nbsp;<asp:Label ID="LabelSpeciesC" runat="server" 
                                Text='<%# Eval("speciesC") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="item_header">
                            科名
                        </td>
                        <td class="item_field">
                             <asp:Label ID="lblFamily" runat="server" 
                                Text='<%# Eval("familyE") %>'></asp:Label>
                             &nbsp;<asp:Label ID="LabelFamilyC" runat="server" 
                                Text='<%# Eval("familyC") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="item_header">
                            拍攝者
                        </td>
                        <td class="item_field">
                            <asp:Label ID="lblAuthor" runat="server" 
                                Text='<%# Eval("authorC") %>'> </asp:Label>
                            <asp:Label ID="lblDate" runat="server" 
                                Text='<%# Eval("photoDate", "{0:d}") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="item_header">
                            採集號
                        </td>
                        <td class="item_field">
                            <asp:HyperLink ID="HyperLinkCollectorNo" runat="server" 
                                Text='<%# Eval("collectionFLCNo") %>'></asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td class="item_header">
                            採集地點
                        </td>
                        <td class="item_field">
                            
                            <asp:Label ID="LabelCountryC" runat="server" 
                                Text='<%# Eval("countryC") %>'></asp:Label>
                                <asp:Label ID="lblDisctrictE" runat="server" 
                                Text='<%# Eval("districtC") %>'></asp:Label>
                            <br />
                            <asp:Label ID="LabelLocalityDescC" runat="server" 
                                Text='<%# Eval("localityDescC") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="item_header">
                            主題</td>
                        <td class="item_field">
                             <asp:Label ID="LabelSubject" runat="server" Text="Label"></asp:Label>                           
                        </td>
                    </tr>
                            <tr>
                                <td class="item_header">
                                    &nbsp;</td>
                                <td class="item_field">
                                    <asp:Button ID="btnErrorReport" runat="server" onclick="btnErrorReport_Click" 
                                        Text="錯誤回報" />
                                </td>
                            </tr>
                </table>
                    </td>
                </tr>
            </table>
            </div>  
          
            &nbsp; &nbsp;&nbsp; &nbsp;
        </ItemTemplate>
    </asp:FormView>
    <br />
    <asp:SqlDataSource ID="SDSImage" runat="server"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SDSSN" runat="server"></asp:SqlDataSource>
    
    
    
    
</asp:Content>

