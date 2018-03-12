<%@ Page Language="VB" MasterPageFile="~/MasterPageBegonia.master" AutoEventWireup="false" CodeFile="GreenhouseDetail.aspx.vb" Inherits="Mgm_greenhouse_GreenhouseDetail" title="未命名頁面" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <br />
        <asp:FormView ID="FormView1" runat="server" DataSourceID="SDSGreenhouse" >           
            <ItemTemplate>                 
                Record of Greenhouse
                <table class="details">
                    <tr>
                        <td class="fieldHeader">
                            Pot ID</td>
                        <td>
                            <asp:Label ID="potIDLabel" runat="server" Text='<%# Eval("potID") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldHeader">
                            Greenhouse</td>
                        <td>
                            <asp:Label ID="greenhouseAreaLabel" runat="server" 
                                Text='<%# Eval("greenhouseArea") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldHeader">
                            Elimination</td>
                        <td>
                            <asp:Label ID="removedLabel" runat="server" Text='<%# Eval("removed") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldHeader">
                            Importing country</td>
                        <td>
                            <asp:Label ID="countryLabel" runat="server" Text='<%# Eval("country") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldHeader">
                            Provider</td>
                        <td>
                            <asp:Label ID="sourceLabel" runat="server" Text='<%# Eval("source") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldHeader">
                            DNA</td>
                        <td>
                            <asp:Label ID="DNAexpLabel" runat="server" Text='<%# Eval("DNAexp") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldHeader">
                            Note</td>
                        <td>
                            <asp:Label ID="noteLabel" runat="server" Text='<%# Eval("note") %>' />
                        </td>
                    </tr>
                </table>
                <br />
                Collection Data
                <table class="details">
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td bgcolor="#CCFFFF" width="395px" >                           
                            Species&nbsp; A (♂)</td>
                        <td align="center">
                            ×</td>
                        <td bgcolor="#CCFFCC" width="395px" >
                            Species B (♀)</td>
                    </tr>
                    <tr>
                        <td class="fieldHeader">
                            Family name</td>
                        <td>
                            <asp:Label ID="verFamilyEALabel" runat="server" 
                                Text='<%# Eval("verFamilyEA") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:Label ID="verFamilyEBLabel" runat="server" 
                                Text='<%# Eval("verFamilyEB") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldHeader">
                            Genus name</td>
                        <td>
                            <asp:Label ID="verGenusEALabel" runat="server" 
                                Text='<%# Eval("verGenusEA") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:Label ID="verGenusEBLabel" runat="server" 
                                Text='<%# Eval("verGenusEB") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldHeader">
                            Scientific name</td>
                        <td>
                            <asp:Label ID="verSpeciesEALabel" runat="server" 
                                Text='<%# Eval("verSpeciesEA") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:Label ID="verSpeciesEBLabel" runat="server" 
                                Text='<%# Eval("verSpeciesEB") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldHeader">
                            Collection No.</td>
                        <td>
                            <asp:Label ID="collectionNumALabel" runat="server" 
                                Text='<%# Eval("collectionNumA") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:Label ID="collectionNumBLabel" runat="server" 
                                Text='<%# Eval("collectionNumB") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldHeader">
                            Collection Date</td>
                        <td>
                            <asp:Label ID="CDateALabel" runat="server" 
                                Text='<%# Eval("CDateA", "{0:d}") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:Label ID="CDateBLabel" runat="server" 
                                Text='<%# Eval("CDateB", "{0:d}") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldHeader">
                            Country</td>
                        <td>
                            <asp:Label ID="countryALabel" runat="server" Text='<%# Eval("countryA") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:Label ID="countryBLabel" runat="server" Text='<%# Eval("countryB") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldHeader">
                            Province / State</td>
                        <td>
                            <asp:Label ID="provinceEALabel" runat="server" 
                                Text='<%# Eval("provinceEA") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:Label ID="provinceEBLabel" runat="server" 
                                Text='<%# Eval("provinceEB") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldHeader">
                            County / City</td>
                        <td>
                            <asp:Label ID="hsienCityEALabel" runat="server" 
                                Text='<%# Eval("hsienCityEA") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:Label ID="hsienCityEBLabel" runat="server" 
                                Text='<%# Eval("hsienCityEB") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldHeader">
                            Township</td>
                        <td>
                            <asp:Label ID="hsiangTownEALabel" runat="server" 
                                Text='<%# Eval("hsiangTownEA") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:Label ID="hsiangTownEBLabel" runat="server" 
                                Text='<%# Eval("hsiangTownEB") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldHeader">
                            National park</td>
                        <td>
                            <asp:Label ID="parkEALabel" runat="server" Text='<%# Eval("parkEA") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:Label ID="parkEBLabel" runat="server" Text='<%# Eval("parkEB") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldHeader">
                            Locality</td>
                        <td>
                            <asp:Label ID="additionalDescALabel" runat="server" 
                                Text='<%# Eval("additionalDescA") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:Label ID="additionalDescBLabel" runat="server" 
                                Text='<%# Eval("additionalDescB") %>' />
                        </td>
                    </tr>
                </table>                
                <br />                
            </ItemTemplate>
        </asp:FormView>
    
    
        <asp:SqlDataSource ID="SDSGreenhouse" runat="server" 
            ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>" 
            
            SelectCommand="SELECT * FROM [vwGreenhouseDetail] WHERE ([potID] = @potID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="potID" QueryStringField="potID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        
</asp:Content>

