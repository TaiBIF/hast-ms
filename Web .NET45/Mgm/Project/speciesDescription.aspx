<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="speciesDescription.aspx.vb" Inherits="Mgm_Project_speciesDescription" title="未命名頁面" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .t_table
        {
        	width: 96%;
        	
        }
        .t_table, tr, td, table2
        {
        	border: solid 1px white;
        }
        
        .t_title
        {
        	width: 100px;
        	background-color: Aqua;
        }
        .t_item,.t_alteritem
        {
        	width:800px;
        	background-color: #E0FFFF;
        }
        .t_item
        {
        	background-color: #aaeeff;
        }
        .item_text
        {
        	width: 780px;
        	height: 100px;
        	margin: 10px;
        }
        .item_text2
        {
        	width: 780px;
        	height: 60px;
        	margin: 10px;        	
        }
        
        #table2 .t_title
        {
        	background-color: #00FA9A;
        }
        #table2 .t_item,#table2 .t_alteritem
        {
        	background-color: #7FFFD4;
        }
        #table2 .t_item
        {
        	background-color: #98FFCC;
        }
        
        
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <asp:FormView ID="FormView1" runat="server" DataSourceID="SDSSpecies">            
            <ItemTemplate>
                <table class="t_table">
                    <tr>
                        <td width="60px">
                            &nbsp;</td>
                        <td width="600px">
                            <asp:Label ID="speciesIDLabel" runat="server" Text='<%# Bind("speciesID") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            學名</td>
                        <td>
                            <asp:Label ID="speciesELabel" runat="server" Text='<%# Bind("speciesE") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            中名</td>
                        <td>
                            <asp:Label ID="speciesCLabel" runat="server" Text='<%# Bind("speciesC") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            類別</td>
                        <td>
                            <asp:Label ID="classELabel" runat="server" Text='<%# Bind("classE") %>' />
                            &nbsp;<asp:Label ID="classCLabel" runat="server" Text='<%# Bind("classC") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            科</td>
                        <td>
                            <asp:Label ID="familyExprLabel" runat="server" 
                                Text='<%# Bind("familyExpr") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            屬</td>
                        <td>
                            <asp:Label ID="genusExprLabel" runat="server" Text='<%# Bind("genusExpr") %>' />
                        </td>
                    </tr>                           
                </table>
            </ItemTemplate>
        </asp:FormView>
    </p>
    <p>
        
        <asp:FormView ID="FormView2" runat="server" DataKeyNames="speciesID" 
            DataSourceID="SDSDescription">
            <EditItemTemplate>
                <table class="t_table">                    
                    <tr>
                        <td class ="t_title">
                            物種描述 - 中文</td>
                        <td class ="t_item">                            
                            <asp:TextBox ID="characteristicCTextBox" runat="server" 
                                Text='<%# Bind("characteristicC") %>' CssClass="item_text" 
                                TextMode="MultiLine"  />                            
                        </td>
                    </tr>
                    <tr>
                        <td class ="t_title">
                            物種描述 - 英文</td>
                        <td class ="t_alteritem">                            
                            <asp:TextBox ID="characteristicETextBox" runat="server" 
                                Text='<%# Bind("characteristicE") %>' CssClass="item_text" 
                                TextMode="MultiLine"  />                            
                        </td>
                    </tr>
                    <tr>
                        <td class ="t_title">
                            全球分佈 - 中文</td>
                        <td class ="t_item">                            
                            <asp:TextBox ID="distributionWCTextBox" runat="server" 
                                Text='<%# Bind("distributionWC") %>' CssClass="item_text2"  
                                TextMode="MultiLine"  />                            
                        </td>
                    </tr>
                    <tr>
                        <td class ="t_title">
                            全球分佈 - 英文</td>
                        <td class ="t_alteritem">                            
                            <asp:TextBox ID="distributionWETextBox" runat="server" 
                                Text='<%# Bind("distributionWE") %>' CssClass="item_text2"  
                                TextMode="MultiLine"  />                            
                        </td>
                    </tr>
                    <tr>
                        <td class ="t_title">
                            台灣分佈 - 中文</td>
                        <td class ="t_item">                            
                            <asp:TextBox ID="distributionTCTextBox" runat="server" 
                                Text='<%# Bind("distributionTC") %>' CssClass="item_text2"  
                                TextMode="MultiLine"  />                            
                        </td>
                    </tr>
                    <tr>
                        <td class ="t_title">
                            台灣分佈 - 英文</td>
                        <td class ="t_alteritem">                            
                            <asp:TextBox ID="distributionTETextBox" runat="server" 
                                Text='<%# Bind("distributionTE") %>' CssClass="item_text2"  
                                TextMode="MultiLine"  />                            
                        </td>
                    </tr>                                        
                </table>            
                
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="更新" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="取消" />
            </EditItemTemplate>
            <InsertItemTemplate>
                <table class="t_table">                    
                    <tr>
                        <td class ="t_title">
                            物種描述 - 中文</td>
                        <td class ="t_item">                            
                            <asp:TextBox ID="characteristicCTextBox" runat="server" 
                                Text='<%# Bind("characteristicC") %>' CssClass="item_text"  
                                TextMode="MultiLine"  />                            
                        </td>
                    </tr>
                    <tr>
                        <td class ="t_title">
                            物種描述 - 英文</td>
                        <td class ="t_alteritem">                            
                            <asp:TextBox ID="characteristicETextBox" runat="server" 
                                Text='<%# Bind("characteristicE") %>' CssClass="item_text"  
                                TextMode="MultiLine"  />                            
                        </td>
                    </tr>
                    <tr>
                        <td class ="t_title">
                            全球分佈 - 中文</td>
                        <td class ="t_item">                            
                            <asp:TextBox ID="distributionWCTextBox" runat="server" 
                                Text='<%# Bind("distributionWC") %>' CssClass="item_text2"  
                                TextMode="MultiLine"  />                            
                        </td>
                    </tr>
                    <tr>
                        <td class ="t_title">
                            全球分佈 - 英文</td>
                        <td class ="t_alteritem">                            
                            <asp:TextBox ID="distributionWETextBox" runat="server" 
                                Text='<%# Bind("distributionWE") %>' CssClass="item_text2"  
                                TextMode="MultiLine"  />                            
                        </td>
                    </tr>
                    <tr>
                        <td class ="t_title">
                            台灣分佈 - 中文</td>
                        <td class ="t_item">                            
                            <asp:TextBox ID="distributionTCTextBox" runat="server" 
                                Text='<%# Bind("distributionTC") %>' CssClass="item_text2"  
                                TextMode="MultiLine"  />                            
                        </td>
                    </tr>
                    <tr>
                        <td class ="t_title">
                            台灣分佈 - 英文</td>
                        <td class ="t_alteritem">                            
                            <asp:TextBox ID="distributionTETextBox" runat="server" 
                                Text='<%# Bind("distributionTE") %>' CssClass="item_text2"  
                                TextMode="MultiLine"  />                            
                        </td>
                    </tr>
                </table>                                          
                
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="插入" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="取消" />
            </InsertItemTemplate>
            <ItemTemplate>
                <table class="t_table">                    
                    <tr>
                        <td class ="t_title">
                            物種描述 - 中文</td>
                        <td class ="t_item">
                            <asp:Label ID="characteristicCLabel" runat="server" 
                                Text='<%# Bind("characteristicC") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class ="t_title">
                            物種描述 - 英文</td>
                        <td class ="t_alteritem">
                            <asp:Label ID="characteristicELabel" runat="server" 
                                Text='<%# Bind("characteristicE") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class ="t_title">
                            全球分佈 - 中文</td>
                        <td class ="t_item">
                            <asp:Label ID="distributionWCLabel" runat="server" 
                                Text='<%# Bind("distributionWC") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class ="t_title">
                            全球分佈 - 英文</td>
                        <td class ="t_alteritem">
                            <asp:Label ID="distributionWELabel" runat="server" 
                                Text='<%# Bind("distributionWE") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class ="t_title">
                            台灣分佈 - 中文</td>
                        <td class ="t_item">
                            <asp:Label ID="distributionTCLabel" runat="server" 
                                Text='<%# Bind("distributionTC") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class ="t_title">
                            台灣分佈 - 英文</td>
                        <td class ="t_alteritem">
                            <asp:Label ID="distributionTELabel" runat="server" 
                                Text='<%# Bind("distributionTE") %>' />
                        </td>
                    </tr>                                       
                </table>               
                
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                    CommandName="Edit" Text="編輯" />                
            </ItemTemplate>
        </asp:FormView>
    </p>
    <p>
       <asp:FormView ID="FormView4" runat="server" DataSourceID="SDSArea">            
            <ItemTemplate>
                <asp:Label ID="nLocalityCLabel" runat="server" 
                    Text='<%# Bind("nLocalityC") %>' />
               &nbsp;分佈
            </ItemTemplate>
       </asp:FormView>
        <asp:FormView ID="FormView3" runat="server" DataKeyNames="speciesID,areaID" 
            DataSourceID="SDSDistributionArea">
            <EditItemTemplate>
		        <table id="table2" class="t_table">                    
                    <tr>
                        <td class ="t_title">
                            本區分佈 - 中文</td>
                        <td class ="t_item">                            
                            <asp:TextBox ID="distributionACTextBox" runat="server" 
                        Text='<%# Bind("distributionAC") %>' CssClass="item_text2"  
                                TextMode="MultiLine"   />                              
                        </td>
                    </tr>
                    <tr>
                        <td class ="t_title">
                            本區分佈 - 英文</td>
                        <td class ="t_alteritem">                            
                            <asp:TextBox ID="distributionAETextBox" runat="server" 
                        Text='<%# Bind("distributionAE") %>' CssClass="item_text2"  
                                TextMode="MultiLine"   />                               
                        </td>
                    </tr>                   
                </table>
                                
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="更新" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="取消" />
            </EditItemTemplate>
            <InsertItemTemplate>
		        <table id="table2" class="t_table">                    
                    <tr>
                        <td class ="t_title">
                            本區分佈 - 中文</td>
                        <td class ="t_item">                            
                            <asp:TextBox ID="distributionACTextBox" runat="server" 
                        Text='<%# Bind("distributionAC") %>'  CssClass="item_text2"  
                                TextMode="MultiLine"  />                              
                        </td>
                    </tr>
                    <tr>
                        <td class ="t_title">
                            本區分佈 - 英文</td>
                        <td class ="t_alteritem">                            
                            <asp:TextBox ID="distributionAETextBox" runat="server" 
                        Text='<%# Bind("distributionAE") %>'  CssClass="item_text2"  
                                TextMode="MultiLine"  />                               
                        </td>
                    </tr>                   
                </table>            
                
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="插入" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="取消" />
            </InsertItemTemplate>
            <ItemTemplate>
                <table id="table2" class="t_table">                    
                    <tr>
                        <td class ="t_title">
                            本區分佈 - 中文</td>
                        <td class ="t_item">                            
                            <asp:Label ID="distributionACLabel" runat="server" 
                        Text='<%# Bind("distributionAC") %>' />                            
                        </td>
                    </tr>
                    <tr>
                        <td class ="t_title">
                            本區分佈 - 英文</td>
                        <td class ="t_alteritem">                            
                            <asp:Label ID="distributionAELabel" runat="server" 
                        Text='<%# Bind("distributionAE") %>' />                             
                        </td>
                    </tr>                   
                </table>             
                
                
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                    CommandName="Edit" Text="編輯" />
            </ItemTemplate>
        </asp:FormView>
    </p>
    <p>
        <asp:SqlDataSource ID="SDSSpecies" runat="server" 
            ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>" 
            SelectCommand="SELECT [classE], [classC], [familyExpr], [genusExpr], [speciesID], [speciesE], [speciesC], [speciesExpr] FROM [vwSpeciesList] WHERE ([speciesID] = @speciesID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="speciesID" QueryStringField="speciesID" 
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SDSDescription" runat="server" 
            ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>" 
            DeleteCommand="DELETE FROM [speciesDescriptions] WHERE [speciesID] = @speciesID" 
            InsertCommand="INSERT INTO [speciesDescriptions] ([speciesID], [characteristicC], [characteristicE], [distributionWC], [distributionWE], [distributionTC], [distributionTE]) VALUES (@speciesID, @characteristicC, @characteristicE, @distributionWC, @distributionWE, @distributionTC, @distributionTE)" 
            SelectCommand="SELECT [speciesID], [characterID], [characteristicC], [characteristicE], [distributionWC], [distributionWE], [distributionTC], [distributionTE] FROM [speciesDescriptions] WHERE ([speciesID] = @speciesID)" 
            UpdateCommand="UPDATE [speciesDescriptions] SET [characteristicC] = @characteristicC, [characteristicE] = @characteristicE, [distributionWC] = @distributionWC, [distributionWE] = @distributionWE, [distributionTC] = @distributionTC, [distributionTE] = @distributionTE WHERE [speciesID] = @speciesID">
            <SelectParameters>
                <asp:QueryStringParameter Name="speciesID" 
                    QueryStringField="speciesID"  Type="Int32" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="speciesID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>                 
                <asp:Parameter Name="characteristicC" Type="String" />
                <asp:Parameter Name="characteristicE" Type="String" />
                <asp:Parameter Name="distributionWC" Type="String" />
                <asp:Parameter Name="distributionWE" Type="String" />
                <asp:Parameter Name="distributionTC" Type="String" />
                <asp:Parameter Name="distributionTE" Type="String" />
                <asp:Parameter Name="speciesID" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="speciesID" Type="Int32" />
                <asp:Parameter Name="characteristicC" Type="String" />
                <asp:Parameter Name="characteristicE" Type="String" />
                <asp:Parameter Name="distributionWC" Type="String" />
                <asp:Parameter Name="distributionWE" Type="String" />
                <asp:Parameter Name="distributionTC" Type="String" />
                <asp:Parameter Name="distributionTE" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SDSDistributionArea" runat="server" 
            ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>" 
            DeleteCommand="DELETE FROM [speciesDistributionArea] WHERE [speciesID] = @speciesID AND [areaID] = @areaID" 
            InsertCommand="INSERT INTO [speciesDistributionArea] ([speciesID], [areaID], [distributionAC], [distributionAE]) VALUES (@speciesID, @areaID, @distributionAC, @distributionAE)" 
            SelectCommand="SELECT [speciesID], [areaID], [distributionAC], [distributionAE] FROM [speciesDistributionArea] WHERE (([speciesID] = @speciesID) AND ([areaID] = @areaID))" 
            UpdateCommand="UPDATE [speciesDistributionArea] SET [distributionAC] = @distributionAC, [distributionAE] = @distributionAE WHERE [speciesID] = @speciesID AND [areaID] = @areaID">
            <SelectParameters>
                <asp:QueryStringParameter Name="speciesID" QueryStringField="speciesID" 
                    Type="Int32" />
                <asp:QueryStringParameter Name="areaID" QueryStringField="areaID" 
                    Type="Int32" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="speciesID" Type="Int32" />
                <asp:Parameter Name="areaID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="distributionAC" Type="String" />
                <asp:Parameter Name="distributionAE" Type="String" />
                <asp:Parameter Name="speciesID" Type="Int32" />
                <asp:Parameter Name="areaID" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="speciesID" Type="Int32" />
                <asp:Parameter Name="areaID" Type="Int32" />
                <asp:Parameter Name="distributionAC" Type="String" />
                <asp:Parameter Name="distributionAE" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SDSArea" runat="server" 
            ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>" 
            SelectCommand="SELECT [areaID], [nLocalityC], [nLocalityE] FROM [vwAreaList] WHERE ([areaID] = @areaID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="areaID" QueryStringField="areaID" 
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
</asp:Content>

