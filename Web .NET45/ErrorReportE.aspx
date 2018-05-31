<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ErrorReportE.aspx.vb" Inherits="ErrorReportE" %>

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
                            
                                        Item</td>
                                    <td class="item_field">
                           
                                        <asp:Label ID="LabelReportItem" runat="server" Text=""></asp:Label>
                           
                                    </td>
                                </tr>
                                <tr>
                                    <td class="item_header">
                           
                                        Name</td>
                                    <td class="item_field">
                            
                                        <asp:TextBox ID="textBoxName" runat="server" CssClass="fillbox"></asp:TextBox>
                            
                                    </td>
                                </tr>
                                <tr>
                                    <td class="item_header">
                            
                                        Email Address</td>
                                    <td class="item_field">
                            
                                        <asp:TextBox ID="textBoxEmail" runat="server" CssClass="fillbox"></asp:TextBox>
                            
                                    </td>
                                </tr>
                                <tr>
                                    <td class="item_header">
                           
                                        <label for="description_of_error" 
                                            style="color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans_serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">
                                        Description of error</label><span 
                                            style="color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans_serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(255, 255, 255);"><span 
                                            class="Apple-converted-space">&nbsp;</span></span></td>
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