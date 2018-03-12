<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="FloraAreaSpeciesUpdateC.aspx.vb" Inherits="Mgm_Project_FloraAreaSpeciesUpdateC" title="未命名頁面" %>

<%@ Register src="../../Ascx/DDListScientificName.ascx" tagname="DDListScientificName" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
    
        <br />
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="speciesID" 
            DataSourceID="SDSSpecies">
            <EditItemTemplate>
                familyID:
                <asp:TextBox ID="familyIDTextBox" runat="server" 
                    Text='<%# Bind("familyID") %>' />
                <br />
                genusID:
                <asp:TextBox ID="genusIDTextBox" runat="server" Text='<%# Bind("genusID") %>' />
                <br />
                speciesID:
                <asp:Label ID="speciesIDLabel1" runat="server" 
                    Text='<%# Eval("speciesID") %>' />
                <br />
                nLocalityC:
                <asp:TextBox ID="nLocalityCTextBox" runat="server" 
                    Text='<%# Bind("nLocalityC") %>' />
                <br />
                nLocalityE:
                <asp:TextBox ID="nLocalityETextBox" runat="server" 
                    Text='<%# Bind("nLocalityE") %>' />
                <br />
                areaID:
                <asp:Label ID="areaIDLabel1" runat="server" Text='<%# Eval("areaID") %>' />
                <br />
                listID:
                <asp:Label ID="listIDLabel1" runat="server" Text='<%# Eval("listID") %>' />
                <br />
                familyE:
                <asp:TextBox ID="familyETextBox" runat="server" Text='<%# Bind("familyE") %>' />
                <br />
                familyC:
                <asp:TextBox ID="familyCTextBox" runat="server" Text='<%# Bind("familyC") %>' />
                <br />
                genusE:
                <asp:TextBox ID="genusETextBox" runat="server" Text='<%# Bind("genusE") %>' />
                <br />
                genusC:
                <asp:TextBox ID="genusCTextBox" runat="server" Text='<%# Bind("genusC") %>' />
                <br />
                speciesE:
                <asp:TextBox ID="speciesETextBox" runat="server" 
                    Text='<%# Bind("speciesE") %>' />
                <br />
                speciesC:
                <asp:TextBox ID="speciesCTextBox" runat="server" 
                    Text='<%# Bind("speciesC") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="更新" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="取消" />
            </EditItemTemplate>
            <InsertItemTemplate>
                familyID:
                <asp:TextBox ID="familyIDTextBox" runat="server" 
                    Text='<%# Bind("familyID") %>' />
                <br />
                genusID:
                <asp:TextBox ID="genusIDTextBox" runat="server" Text='<%# Bind("genusID") %>' />
                <br />
                speciesID:
                <asp:TextBox ID="speciesIDTextBox" runat="server" 
                    Text='<%# Bind("speciesID") %>' />
                <br />
                nLocalityC:
                <asp:TextBox ID="nLocalityCTextBox" runat="server" 
                    Text='<%# Bind("nLocalityC") %>' />
                <br />
                nLocalityE:
                <asp:TextBox ID="nLocalityETextBox" runat="server" 
                    Text='<%# Bind("nLocalityE") %>' />
                <br />
                familyE:
                <asp:TextBox ID="familyETextBox" runat="server" Text='<%# Bind("familyE") %>' />
                <br />
                familyC:
                <asp:TextBox ID="familyCTextBox" runat="server" Text='<%# Bind("familyC") %>' />
                <br />
                genusE:
                <asp:TextBox ID="genusETextBox" runat="server" Text='<%# Bind("genusE") %>' />
                <br />
                genusC:
                <asp:TextBox ID="genusCTextBox" runat="server" Text='<%# Bind("genusC") %>' />
                <br />
                speciesE:
                <asp:TextBox ID="speciesETextBox" runat="server" 
                    Text='<%# Bind("speciesE") %>' />
                <br />
                speciesC:
                <asp:TextBox ID="speciesCTextBox" runat="server" 
                    Text='<%# Bind("speciesC") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="插入" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="取消" />
            </InsertItemTemplate>
            <ItemTemplate>
                <table class="style1" width="600px">
                    <tr>
                        <td width="40px">
                            地點</td>
                        <td>
                            <asp:Label ID="nLocalityCLabel" runat="server" 
                                Text='<%# Bind("nLocalityC") %>' />
                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:Label ID="nLocalityELabel" runat="server" 
                                Text='<%# Bind("nLocalityE") %>' /></td>
                    </tr>
                    <tr>
                        <td>
                           科名</td>
                        <td>
                            <asp:Label ID="familyELabel" runat="server" Text='<%# Bind("familyE") %>' />                            
                        </td>                        
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                           <asp:Label ID="familyCLabel" runat="server" Text='<%# Bind("familyC") %>' />
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
                            &nbsp;</td>
                        <td>
                            <asp:Label ID="speciesCLabel" runat="server" Text='<%# Bind("speciesC") %>' />
                        </td>
                    </tr>                    
                </table>
                <asp:Label ID="listIDLabel" runat="server" Text='<%# Eval("listID") %>'></asp:Label>
                <asp:Label ID="areaIDLabel" runat="server" Text='<%# Eval("areaID") %>'></asp:Label>
                <br />
            </ItemTemplate>
        </asp:FormView>
        <br />
        <uc1:DDListScientificName ID="DDListScientificName1" runat="server" />
    
        <br />
        <asp:Button ID="BtnUpdate" runat="server" />
        <br />
        <br />
        <a href='javascript:history.go(-1)' >取消/回前頁</a>
    
    &nbsp;
        
    
    </div>
    <asp:SqlDataSource ID="SDSAreaSpecies" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>" 
        DeleteCommand="DELETE FROM [areaSpeciesList] WHERE [areaID] = @areaID AND [speciesID] = @speciesID" 
        InsertCommand="INSERT INTO [areaSpeciesList] ([areaID], [speciesID], [projectID]) VALUES (@areaID, @speciesID, @projectID)" 
        SelectCommand="SELECT [listID], [areaID], [speciesID], [projectID] FROM [areaSpeciesList]" 
        UpdateCommand="UPDATE [areaSpeciesList] SET [listID] = @listID, [projectID] = @projectID WHERE [areaID] = @areaID AND [speciesID] = @speciesID">
        <DeleteParameters>
            <asp:Parameter Name="areaID" Type="Int32" />
            <asp:Parameter Name="speciesID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="listID" Type="Int32" />
            <asp:Parameter Name="projectID" Type="Int32" />
            <asp:Parameter Name="areaID" Type="Int32" />
            <asp:Parameter Name="speciesID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="areaID" Type="Int32" />
            <asp:Parameter Name="speciesID" Type="Int32" />
            <asp:Parameter Name="projectID" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDSSpecies" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>" 
        
        SelectCommand="SELECT [familyID], [genusID], [speciesID], [nLocalityC], [nLocalityE], [areaID], [listID], [familyE], [familyC], [genusE], [genusC], [speciesE], [speciesC] FROM [vwAreaSpeciesList] WHERE ([listID] = @listID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="listID" QueryStringField="listID" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

