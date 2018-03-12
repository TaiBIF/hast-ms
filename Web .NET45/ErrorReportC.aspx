<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ErrorReportC.aspx.vb" Inherits="ErrorReportC" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>

    <style type="text/css">
        #report_main
        {
        	text-align:center;
        	margin-left:auto;
        	margin-right:auto;
        	width:800px;
        }
        
        #report_content
        {
        text-align:center;
        width:100%;
        margin-left:auto;
        margin-right:auto;
        border:solid 1px black;  
        }
        
               
        .report_detail
        {
	        font-size:10pt;
	        
	        width:100%;
	        
	        padding: 0;
	        border:solid 1px white; 
	        text-align:left;    
        	
        }
        .report_detail tr td
        {
        	border:solid 1px white; 
        	
        }
                
         .item_header
        {
        	width:120px;
        	background-color:#77B371;
        	color:White;
        	min-height:30px;
        }
        .item_field
        {
        	background-color:#AAFFCC;
        }
        #check_test
        {
        	color:Black;
        	
        }
        
        .fillbox
        {
        	width:100%;
        }
        
        </style>
    

</head>
<body>
    <form id="form1" runat="server">
    <div id="report_main">
        <asp:Panel ID="pnlLogin" runat="server">
            <table>
                <tr><td>Please log in to report error</td></tr>
                <tr><td><asp:ImageButton ID="btnFacebookLogin" runat="server" ImageUrl="~/images/Login_with_Facebook.png" />
            <asp:ImageButton ID="btnGoogleLogin" runat="server" ImageUrl="~/images/Login_with_Google.png" />
            <asp:ImageButton ID="btnTwitterLogin" runat="server" ImageUrl="~/images/Login_with_Twitter.png" /></td></tr>
            
            </table>
        </asp:Panel>
        
        <asp:Panel ID="pnlErrorReport" runat="server" Visible="false">
        
            <table id="report_content">
                    <tr>
                        <td>
                         
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table class="report_detail">
                                <tr>
                                    <td class="item_header">
                            
                                        回報項目</td>
                                    <td class="item_field">
                           
                                        <asp:Label ID="LabelReportItem" runat="server" Text=""></asp:Label>
                           
                                    </td>
                                </tr>
                                <tr>
                                    <td class="item_header">
                           
                                        回報人</td>
                                    <td class="item_field">
                            
                                        <asp:TextBox ID="textBoxName" runat="server" CssClass="fillbox"></asp:TextBox>
                            
                                    </td>
                                </tr>
                                <tr>
                                    <td class="item_header">
                            
                                        email</td>
                                    <td class="item_field">
                            
                                        <asp:TextBox ID="textBoxEmail" runat="server" CssClass="fillbox"></asp:TextBox>
                            
                                    </td>
                                </tr>
                                <tr>
                                    <td class="item_header">
                           
                                        訂正內容</td>
                                    <td class="item_field">
                            
                                        <asp:TextBox ID="textBoxError" runat="server" TextMode="MultiLine" 
                                            CssClass="fillbox" Height="120px"></asp:TextBox>
                                        <asp:Label ID="labelUserID" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                
                            </table>
                        </td>
                    
                        
                    
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnSend" runat="server" Text="Send" />
                            &nbsp;&nbsp;<asp:Button ID="btnCancel" runat="server" Text="Cancel" />
                            &nbsp;
                            <asp:Button ID="btnLogout" runat="server" Text="Logout" Visible="False" />
                        </td>
                    </tr>
                    
                </table>            

         </asp:Panel>
    
    </div>

    </form>
</body>
</html>