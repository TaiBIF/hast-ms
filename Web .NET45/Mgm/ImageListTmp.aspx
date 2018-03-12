<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ImageListTmp.aspx.vb" Inherits="Mgm_ImageListTmp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>未命名頁面</title>
    <link type="text/css" href="~/styles/styleMgm.css" rel="stylesheet" />
<script language="javascript" type="text/javascript">
// <!CDATA[

// ]]>
</script>
</head>
<body>
    <form id="form1" runat="server">
        <div id='header'>
           <h1></h1>
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" DataSourceID="SDSClassX"
                DataTextField="classC" DataValueField="classID" RepeatDirection="Horizontal">
            </asp:RadioButtonList>
        </div>
        <div id='container'>
            <div id='first-column'>
                <asp:Panel ID="Panel1" runat="server" Height="100%" ScrollBars="Both" Width="100%">
                    <asp:TreeView ID="TreeView1" runat="server" ExpandDepth="1" MaxDataBindDepth="2"
                        ShowLines="True">
                        <Nodes>
                            <asp:TreeNode PopulateOnDemand="True" SelectAction="None" Text="新節點" Value="新節點"></asp:TreeNode>
                        </Nodes>
                    </asp:TreeView>
                </asp:Panel>
            </div>
            <div id='content'>
                <asp:MultiView ID="mv" runat="server" ActiveViewIndex="0">
                    <asp:View ID="viewFamilyList" runat="server">
                        <a href='javascript:history.go(-1)' title="回上一頁">回上一頁</a>
                        &nbsp;<br />
                        科影像列表：
                        <asp:GridView ID="gridViewFamily" runat="server" DataKeyNames="familyID" HorizontalAlign="Left" AutoGenerateColumns="False">
                            <Columns>
                                <asp:BoundField DataField="familyE" HeaderText="科名" />
                                <asp:BoundField DataField="familyC" HeaderText="中文科名" />
                                <asp:BoundField DataField="total" HeaderText="影像張數" />
                                <asp:HyperLinkField DataNavigateUrlFields="familyID" DataNavigateUrlFormatString="~/Photos.aspx?familyID={0}" HeaderText="開啟影像清單" Text="影像清單" Target="_blank" />
                            </Columns>
                        </asp:GridView>
                    </asp:View>
                    <asp:View ID="viewGenusList" runat="server">
                        <a href='javascript:history.go(-1)' title="回上一頁">回上一頁</a>
                        &nbsp;<br />
                    
                        屬影像列表：<br />
                        <asp:GridView ID="gridViewGenus" runat="server" AutoGenerateColumns="False" DataKeyNames="genusID">
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" HeaderText="檢視學名" SelectText="學名清單" />
                                <asp:BoundField DataField="genusE" HeaderText="屬名" />
                                <asp:BoundField DataField="genusC" HeaderText="中文屬名" />
                                <asp:BoundField DataField="total" HeaderText="影像張數" />
                                <asp:HyperLinkField DataNavigateUrlFields="familyID,genusID" DataNavigateUrlFormatString="~/Photos.aspx?familyID={0}&amp;genusID={1}" HeaderText="開啟影像清單" Text="影像清單" Target="_blank" />
                            </Columns>
                        </asp:GridView>
                    </asp:View>
                    <asp:View ID="viewSpeciesList" runat="server">
                             <a href='javascript:history.go(-1)' title="回上一頁">回上一頁</a>
                             &nbsp;<br />
                        種影像列表：&nbsp;
                       
                        <asp:GridView ID="gridViewSpecies" runat="server" DataKeyNames="speciesID" AutoGenerateColumns="False">
                            <Columns>
                                <asp:BoundField DataField="speciesE" HeaderText="學名" />
                                <asp:BoundField DataField="speciesC" HeaderText="中文名" />
                                <asp:BoundField DataField="total" HeaderText="影像張數" />
                                <asp:HyperLinkField DataNavigateUrlFields="familyID,genusID,speciesID" DataNavigateUrlFormatString="~/photos.aspx?familyID={0}&amp;genusID={1}&amp;speciesID={2}"
                                    Text="影像清單" HeaderText="開啟影像清單" Target="_blank" />
                            </Columns>
                        </asp:GridView>
                       
                        </asp:View>
                </asp:MultiView>&nbsp;
            </div>
            <div id='third-column' onclick="return third-column_onclick()">
                <asp:RadioButtonList ID="RadioButtonList2" runat="server" AutoPostBack="True">
                    <asp:ListItem Selected="True" Value="0">全部</asp:ListItem>
                    <asp:ListItem Value="1">有影像</asp:ListItem>
                    <asp:ListItem Value="2">缺影像</asp:ListItem>
                </asp:RadioButtonList><br />
                <br />
                依檔名序列出 50張影像：<br />
                <asp:TextBox ID="textBoxImageCode" runat="server" Width="90px"></asp:TextBox>
                &nbsp;<input id="btn50Img" runat="server" type="button" value="查詢" /><br />
                <br />
                <br />
                <div id='codeAbbr'>
                舊檔名影像清單：<br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SDSOldImgCode">
                    <Columns>
                        <asp:HyperLinkField DataNavigateUrlFields="familyAbbr" DataNavigateUrlFormatString="~/photos.aspx?imageCodeAbbr={0}"
                            DataTextField="familyAbbr" HeaderText="科名代碼" Target="_blank">                            
                        </asp:HyperLinkField>
                        <asp:BoundField DataField="familyE" HeaderText="科名" SortExpression="familyE">                            
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
                </div>
                <br />
            </div>
            </div>
        <div id='footer'>
            待處理的問題的影像：<br />
            &nbsp; 1. 0015593 - 0017864未整理<br />
            &nbsp; 2. 0015574 - 0015575、0016199 - 0016202原圖遺失<br />
            &nbsp;
            <br />
            <h6>
                footer</h6>
            <br />
        </div>

        <asp:SqlDataSource ID="SDSClassX" runat="server" ConnectionString="<%$ ConnectionStrings:PhotoDBConnectionString %>"
            SelectCommand="SELECT [classID], [classE], [classC] FROM [classX] ORDER BY [classID]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SDSFamily" runat="server"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SDSGenus" runat="server"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SDSSpecies" runat="server"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SDSOldImgCode" runat="server" ConnectionString="<%$ ConnectionStrings:PhotoDBConnectionString %>"
            SelectCommand="SELECT [familyAbbr], [familyE], [familyC] FROM [vwOldImageCodeExpr] ORDER BY [familyAbbr]">
        </asp:SqlDataSource>
    </form>
</body>
</html>
