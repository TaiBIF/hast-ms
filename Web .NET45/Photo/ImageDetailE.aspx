<%@ Page Language="VB" MasterPageFile="~/MasterPageTWFloraE.master" AutoEventWireup="false" CodeFile="ImageDetailE.aspx.vb" Inherits="Photo_ImageDetailE" title="HAST - Living plant image" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
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
        
        
        
    </style>
    
   

   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" onload="changeRadioForeColor()">
   
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
                            Image File 
                        </td>
                        <td class="item_field">
                           <%#Server.HtmlEncode(Eval("imageCode").ToString())%>&nbsp;
                           <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "../Mgm/secure/download.aspx?imageCode=" + Eval("imageCode") %>'>Download</asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td class="item_header">
                            Scientific Name
                        </td>
                        <td class="item_field">
                            <asp:Label ID="lblSpecies" runat="server" 
                                Text='<%# Eval("speciesE") %>'></asp:Label>                            
                        </td>
                    </tr>
                    <tr>
                        <td class="item_header">
                            family Name
                        </td>
                        <td class="item_field">
                             <asp:Label ID="lblFamily" runat="server" 
                                Text='<%# Eval("familyE") %>'></asp:Label>                             
                        </td>
                    </tr>
                    <tr>
                        <td class="item_header">
                            Image Author
                        </td>
                        <td class="item_field">
                            <asp:Label ID="lblAuthor" runat="server" 
                                Text='<%# Eval("authorFL") %>'> </asp:Label>
                            <asp:Label ID="lblDate" runat="server" 
                                Text='<%# Eval("photoDate", "{0:d}") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="item_header">
                            Collection No.
                        </td>
                        <td class="item_field">
                            <asp:HyperLink ID="HyperLinkCollectorNo" runat="server" 
                                Text='<%# Eval("collectionFLNo") %>'></asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td class="item_header">
                            Locality
                        </td>
                        <td class="item_field">
                            
                            <asp:Label ID="LabelCountryC" runat="server" 
                                Text='<%# Eval("country") %>'></asp:Label>
                                &nbsp;<asp:Label ID="lblDisctrictE" runat="server" 
                                Text='<%# Eval("districtE") %>'></asp:Label>
                            <br />
                            <asp:Label ID="LabelLocalityDescC" runat="server" 
                                Text='<%# Eval("localityDescE") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="item_header">
                            Content</td>
                        <td class="item_field">
                            <asp:Label ID="LabelSubject" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                            <tr>
                                <td class="item_header">
                                    &nbsp;</td>
                                <td class="item_field">
                                    <asp:Button ID="btnErrorReport" runat="server" onclick="btnErrorReport_Click" 
                                        Text="Error Report" />
                                </td>
                            </tr>
                </table>
                    </td>
                </tr>
            </table>
            </div>    
                   
                
                
            
          
            &nbsp; &nbsp;&nbsp; &nbsp;<!-- 以html的超連結下載 <a href="management/powerUser/download.aspx?imageCode=<%# Eval("imageCode") %>"><br />download</a> &nbsp;  -->
        </ItemTemplate>
    </asp:FormView>
    <br />
    <asp:SqlDataSource ID="SDSImage" runat="server"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SDSSN" runat="server"></asp:SqlDataSource>
    
    <script type="text/javascript">
        function changeRadioForeColor()
{
    //不用Server Control的Enable改用Javascript的disabled屬性
    document.getElementById("RadioButtonList1_1").disabled = true;
    //由於lable沒有ID，透過TagName來取，可以透過jQuery來處理應該會比較簡單
    document.getElementsByTagName("label")[1].style.color = "Blue";

    document.getElementById("CheckBox8").disabled = true;
    document.getElementsByTagName("ctl00_ContentPlaceHolder1_FormView1_CheckBox8").style.color = "Blue";
} 
    
    </script>
    
    
</asp:Content>

