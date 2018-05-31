<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="LoanDetailM.aspx.vb" Inherits="Mgm_secure_LoanDetailM" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        body {
            font-size:small;
            
        }
        .mgmDetail {

            width: 960px;
            border:1px;
            border-color:aqua;
            border-style:solid;
            padding:10px;
            margin:10px;
        }

        .mgmDetail tr {
            border:1px;
            border-color:aqua;
            border-style:solid;
            padding:5px;
            margin:5px;
            font-size:small;
        }

        .mgmTitle  {
            border-color:aliceblue;
            border:2px;
            border-style:solid;
            width:120px;
            background-color:aqua;
            }

        
        .mgmContent {

        }
        .textBoxDetail, .multiLineText, .ddlDetail {
            width:350px;           
            font-size:small;
        }

        .ddlDetail {
            width:600px;
        }

         .multiLineText {
             height:60px;
             width: 600px;
         }
               

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="invoiceID" DataSourceID="SqlDSInvoice" Font-Size="Small">
        <EditItemTemplate>
            <br />
            <table class="mgmDetail">
                <tr>
                    <td class="mgmTitle">單號</td>
                    <td>
                        <asp:Label ID="invoiceIDLabel1" CssClass="textBoxDetail" runat="server" Text='<%# Eval("invoiceID") %>' />                        
                    </td>
                    <td class="mgmTitle">&nbsp;</td>
                    <td>
                        <asp:CheckBox ID="isNativeCheckBox" runat="server" Checked='<%# Bind("isNative") %>' CssClass="textBoxDetail" Text="國內" />
                        &nbsp;
                        <asp:CheckBox ID="checkInCheckBox" runat="server" Checked='<%# Bind("checkIn") %>' CssClass="textBoxDetail" Text="已歸還" />
                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td class="mgmTitle">Shipping Date</td>
                    <td>
                        <asp:TextBox ID="shippingDateTextBox" CssClass="textBoxDetail" runat="server" Text='<%# Bind("shippingDate", "{0:d}")%>' />
                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">&nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td class="mgmTitle">Via</td>
                    <td>
                        <asp:TextBox ID="viaTextBox" CssClass="textBoxDetail" runat="server" Text='<%# Bind("via") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">Applicant (En)</td>
                    <td>
                        <asp:TextBox ID="applicantETextBox" CssClass="textBoxDetail" runat="server" Text='<%# Bind("applicantE") %>' />
                    </td>
                    <td class="mgmTitle">Number of package</td>
                    <td>
                        <asp:TextBox ID="numberOfPackageTextBox" CssClass="textBoxDetail" runat="server" Text='<%# Bind("numberOfPackage") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">Applicant (Zh-tw)</td>
                    <td>
                        <asp:TextBox ID="applicantCTextBox" CssClass="textBoxDetail" runat="server" Text='<%# Bind("applicantC") %>' />
                    </td>
                    <td class="mgmTitle">Herbarium Curator</td>
                    <td>
                        <asp:TextBox ID="approvedByTextBox" CssClass="textBoxDetail" runat="server" Text='<%# Bind("approvedBy") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">Application Date</td>
                    <td>
                        <asp:TextBox ID="requestDateTextBox" CssClass="textBoxDetail" runat="server" Text='<%# Bind("requestDate", "{0:d}")%>' />
                    </td>
                    <td class="mgmTitle">Registar</td>
                    <td>
                        <asp:TextBox ID="adminTextBox" CssClass="textBoxDetail" runat="server" Text='<%# Bind("admin") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">&nbsp;</td>
                    <td>
                        <asp:Label ID="tempDepartmentLabel" runat="server" Text='<%# Eval("tempDepartment")%>' /></td>
                    <td class="mgmTitle">Approval Date</td>
                    <td>
                        <asp:TextBox ID="signingDateTextBox" CssClass="textBoxDetail" runat="server" Text='<%# Bind("signingDate", "{0:d}")%>' />
                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">Institution</td>
                    <td colspan="3">
                        <asp:DropDownList ID="DDLInstitution" runat="server" AppendDataBoundItems="True" CssClass="ddlDetail" DataSourceID="SqlDSInstitution"
                             DataTextField="institutionExpr" DataValueField="institutionID" SelectedValue='<%# Bind("institutionID")%>' AutoPostBack="True">
                            <asp:ListItem Selected="True" Value="">(none)</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">Address</td>
                    <td colspan="3">
                        <asp:DropDownList ID="DDLAddress" runat="server" AppendDataBoundItems="True" CssClass="ddlDetail" DataSourceID="SqlDsAddress" DataTextField="addressExpr" DataValueField="addressID" SelectedValue='<%#DataBinder.Eval(Container.DataItem, "addressID")%>'>
                            <asp:ListItem Selected="True" Value="">(none)</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">Shipping as</td>
                    <td>
                        <asp:DropDownList ID="DDLPurpose" runat="server" AppendDataBoundItems="True"  DataSourceID="SqlDsPurpose"
                             DataTextField="PurposeE" DataValueField="purposeID" SelectedValue='<%# Bind("purposeID")%>' AutoPostBack="True">
                            <asp:ListItem Selected="True" Value="">(none)</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="mgmTitle">Loan number</td>
                    <td>
                        <asp:TextBox ID="loanNumberTextBox" CssClass="textBoxDetail" runat="server" Text='<%# Bind("loanNumber") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">Number of sheets</td>
                    <td>
                        <asp:TextBox ID="amountTextBox" CssClass="textBoxDetail" runat="server" Text='<%# Bind("amount") %>' />
                    </td>
                    <td class="mgmTitle">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="mgmTitle">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td class="mgmTitle">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="mgmTitle">Return Date</td>
                    <td>
                        <asp:TextBox ID="returnDateTextBox" CssClass="textBoxDetail" runat="server" Text='<%# Bind("returnDate", "{0:d}")%>' />
                    </td>
                    <td class="mgmTitle">&nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="mgmTitle">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td class="mgmTitle">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            &nbsp;&nbsp;&nbsp; 備註
            <asp:TextBox ID="TextBoxNote" CssClass="multiLineText" runat="server" Text='<%# Bind("note")%>' TextMode="MultiLine" />
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;
            <asp:CheckBox ID="tempCheckCheckBox" CssClass="textBoxDetail" runat="server" Checked='<%# Bind("tempCheck") %>' Text="資料審訂" />
            <br />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="儲存" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />

             <br />
            <br />

             <asp:SqlDataSource ID="SqlDsAddress" runat="server" ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>"
                  SelectCommand="SELECT [AddressID], [AddressLine1], [AddressLine2], [City], [StateProvince], [PostalCode],
                  [country2Code], [linkTable], [ownerID], 
                  ISNULL([AddressLine2], '') + ', ' + ISNULL([City], '') + ', ' +  ISNULL([StateProvince], '')
                  + ', ' +  ISNULL([PostalCode], '') + ', ' + ISNULL([country2Code], '') AS addressExpr
                  FROM [Address] WHERE (([linkTable] = @linkTable) AND ([ownerID] = @ownerID))">
                <SelectParameters>
                    <asp:Parameter DefaultValue="institution" Name="linkTable" Type="String" />
                    <asp:ControlParameter ControlID="DDLInstitution" Name="ownerID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
                       
           
            
            
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table class="mgmDetail">
                <tr>
                    <td class="mgmTitle">單號</td>
                    <td>&nbsp;</td>
                    <td class="mgmTitle">&nbsp;</td>
                    <td>&nbsp;&nbsp;&nbsp;</td>
                </tr>
                <tr>
                    <td class="mgmTitle">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td class="mgmTitle">Shipping Date</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="mgmTitle">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td class="mgmTitle">Via</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="mgmTitle">Applicant (En)</td>
                    <td>&nbsp;</td>
                    <td class="mgmTitle">Number of package</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="mgmTitle">Applicant (Zh-tw)</td>
                    <td>&nbsp;</td>
                    <td class="mgmTitle">Herbarium Curator</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="mgmTitle">Application Date</td>
                    <td>&nbsp;</td>
                    <td class="mgmTitle">Registar</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="mgmTitle">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td class="mgmTitle">Approval Date</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="mgmTitle">Institution</td>
                    <td colspan="3">&nbsp;</td>
                </tr>
                <tr>
                    <td class="mgmTitle">Address</td>
                    <td colspan="3">&nbsp;</td>
                </tr>
                <tr>
                    <td class="mgmTitle">Shipping as</td>
                    <td>&nbsp;</td>
                    <td class="mgmTitle">Loan number</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="mgmTitle">Number of sheets</td>
                    <td>&nbsp;</td>
                    <td class="mgmTitle">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="mgmTitle">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td class="mgmTitle">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="mgmTitle">Return Date</td>
                    <td>&nbsp;</td>
                    <td class="mgmTitle">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="mgmTitle">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td class="mgmTitle">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <br />
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="新增" />
        </EmptyDataTemplate>
        <InsertItemTemplate>
            
            <br />
            <table class="mgmDetail">
                <tr>
                    <td class="mgmTitle">單號</td>
                    <td>
                        &nbsp;
                    </td>
                    <td class="mgmTitle">&nbsp;</td>
                    <td>
                        <asp:CheckBox ID="isNativeCheckBox" runat="server" Checked='<%# Bind("isNative") %>' CssClass="textBoxDetail" Text="國內" />
                        &nbsp;
                        <asp:CheckBox ID="checkInCheckBox" runat="server" Checked='<%# Bind("checkIn") %>' CssClass="textBoxDetail" Text="已歸還" />
                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td class="mgmTitle">Shipping Date</td>
                    <td>
                        <asp:TextBox ID="shippingDateTextBox" CssClass="textBoxDetail" runat="server" Text='<%# Bind("shippingDate", "{0:d}")%>' />
                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">&nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td class="mgmTitle">Via</td>
                    <td>
                        <asp:TextBox ID="viaTextBox" CssClass="textBoxDetail" runat="server" Text='<%# Bind("via") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">Applicant (En)</td>
                    <td>
                        <asp:TextBox ID="applicantETextBox" CssClass="textBoxDetail" runat="server" Text='<%# Bind("applicantE") %>' />
                    </td>
                    <td class="mgmTitle">Number of package</td>
                    <td>
                        <asp:TextBox ID="numberOfPackageTextBox" CssClass="textBoxDetail" runat="server" Text='<%# Bind("numberOfPackage") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">Applicant (Zh-tw)</td>
                    <td>
                        <asp:TextBox ID="applicantCTextBox" CssClass="textBoxDetail" runat="server" Text='<%# Bind("applicantC") %>' />
                    </td>
                    <td class="mgmTitle">Herbarium Curator</td>
                    <td>
                        <asp:TextBox ID="approvedByTextBox" CssClass="textBoxDetail" runat="server" Text='<%# Bind("approvedBy") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">Application Date</td>
                    <td>
                        <asp:TextBox ID="requestDateTextBox" CssClass="textBoxDetail" runat="server" Text='<%# Bind("requestDate", "{0:d}")%>' />
                    </td>
                    <td class="mgmTitle">Registar</td>
                    <td>
                        <asp:TextBox ID="adminTextBox" CssClass="textBoxDetail" runat="server" Text='<%# Bind("admin") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">&nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td class="mgmTitle">Approval Date</td>
                    <td>
                        <asp:TextBox ID="signingDateTextBox" CssClass="textBoxDetail" runat="server" Text='<%# Bind("signingDate", "{0:d}")%>' />
                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">Institution</td>
                    <td colspan="3">
                        <asp:DropDownList ID="DDLInstitution" runat="server" AppendDataBoundItems="True" CssClass="ddlDetail" DataSourceID="SqlDSInstitution"
                             DataTextField="institutionExpr" DataValueField="institutionID" SelectedValue='<%# Bind("institutionID")%>' AutoPostBack="True">
                            <asp:ListItem Selected="True" Value="">(none)</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">Address</td>
                    <td colspan="3">
                        <asp:DropDownList ID="DDLAddress" runat="server" AppendDataBoundItems="True" CssClass="ddlDetail" DataSourceID="SqlDsAddress" DataTextField="addressExpr" DataValueField="addressID" SelectedValue='<%#DataBinder.Eval(Container.DataItem, "addressID")%>'>
                            <asp:ListItem Selected="True" Value="">(none)</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">Shipping as</td>
                    <td>                        
                        <asp:DropDownList ID="DDLPurpose" runat="server" AppendDataBoundItems="True"  DataSourceID="SqlDsPurpose"
                             DataTextField="PurposeE" DataValueField="purposeID" SelectedValue='<%# Bind("purposeID")%>' AutoPostBack="True">
                            <asp:ListItem Selected="True" Value="">(none)</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="mgmTitle">Loan number</td>
                    <td>
                        <asp:TextBox ID="loanNumberTextBox" CssClass="textBoxDetail" runat="server" Text='<%# Bind("loanNumber") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">Number of sheets</td>
                    <td>
                        <asp:TextBox ID="amountTextBox" CssClass="textBoxDetail" runat="server" Text='<%# Bind("amount") %>' />
                    </td>
                    <td class="mgmTitle">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="mgmTitle">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td class="mgmTitle">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="mgmTitle">Return Date</td>
                    <td>
                        <asp:TextBox ID="returnDateTextBox" CssClass="textBoxDetail" runat="server" Text='<%# Bind("returnDate", "{0:d}")%>' />
                    </td>
                    <td class="mgmTitle">&nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="mgmTitle">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td class="mgmTitle">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            &nbsp;&nbsp;&nbsp; 備註
            <asp:TextBox ID="TextBoxNote" CssClass="multiLineText" runat="server" Text='<%# Bind("note")%>' TextMode="MultiLine" />
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;
            <asp:CheckBox ID="tempCheckCheckBox" CssClass="textBoxDetail" runat="server" Checked='<%# Bind("tempCheck") %>' Text="資料審訂" />
            <br />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="儲存" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />

             <br />
            <br />

             <asp:SqlDataSource ID="SqlDsAddress" runat="server" ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>"
                  SelectCommand="SELECT [AddressID], [AddressLine1], [AddressLine2], [City], [StateProvince], [PostalCode],
                  [country2Code], [linkTable], [ownerID], 
                  ISNULL([AddressLine2], '') + ', ' + ISNULL([City], '') + ', ' +  ISNULL([StateProvince], '')
                  + ', ' +  ISNULL([PostalCode], '') + ', ' + ISNULL([country2Code], '') AS addressExpr
                  FROM [Address] WHERE (([linkTable] = @linkTable) AND ([ownerID] = @ownerID))">
                <SelectParameters>
                    <asp:Parameter DefaultValue="institution" Name="linkTable" Type="String" />
                    <asp:ControlParameter ControlID="DDLInstitution" Name="ownerID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </InsertItemTemplate>
        <ItemTemplate>
            <br />
            <table class="mgmDetail">
                <tr>
                    <td class="mgmTitle">單號</td>
                    <td>
                        <asp:Label ID="invoiceIDLabel" CssClass="textBoxDetail" runat="server" Text='<%# Eval("invoiceID") %>' />                        
                    </td>
                    <td class="mgmTitle">&nbsp;</td>
                    <td>
                        &nbsp;<asp:CheckBox ID="isNativeCheckBox" runat="server" Checked='<%# Bind("isNative") %>' Enabled="false" Text="國內" />
                        &nbsp;
                        <asp:CheckBox ID="checkInCheckBox" runat="server" Checked='<%# Bind("checkIn") %>' Enabled="false" Text="已歸還" />
                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td class="mgmTitle">Shipping Date</td>
                    <td>
                        <asp:Label ID="shippingDateLabel" runat="server" CssClass="textBoxDetail" Text='<%# Bind("shippingDate", "{0:d}")%>' />
                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">&nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td class="mgmTitle">Via</td>
                    <td>
                        <asp:Label ID="viaLabel" runat="server" CssClass="textBoxDetail" Text='<%# Bind("via") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">Applicant (En)</td>
                    <td>
                        <asp:Label ID="applicantELabel" runat="server" CssClass="textBoxDetail" Text='<%# Bind("applicantE") %>' />
                    </td>
                    <td class="mgmTitle">Number of package</td>
                    <td>
                        <asp:Label ID="numberOfPackageLabel" runat="server" CssClass="textBoxDetail" Text='<%# Bind("numberOfPackage") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">Applicant (Zh-tw)</td>
                    <td>
                        <asp:Label ID="applicantCLabel" runat="server" CssClass="textBoxDetail" Text='<%# Bind("applicantC") %>' />
                    </td>
                    <td class="mgmTitle">Herbarium Curator</td>
                    <td>
                        <asp:Label ID="approvedByLabel" runat="server" CssClass="textBoxDetail" Text='<%# Bind("approvedBy") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">Application Date</td>
                    <td>
                        <asp:Label ID="requestDateLabel" runat="server" CssClass="textBoxDetail" Text='<%# Bind("requestDate", "{0:d}")%>' />
                    </td>
                    <td class="mgmTitle">Registar</td>
                    <td>
                        <asp:Label ID="adminLabel" runat="server" CssClass="textBoxDetail" Text='<%# Bind("admin") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">&nbsp;</td>
                    <td>
                        <asp:Label ID="tempDepartmentLabel" runat="server" Text='<%# Bind("tempDepartment") %>' CssClass="textBoxDetail" /></td>
                    <td class="mgmTitle">Approval Date</td>
                    <td>
                        <asp:Label ID="signingDateLabel" runat="server" CssClass="textBoxDetail" Text='<%# Bind("signingDate", "{0:d}")%>' />
                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">Institution</td>
                    <td colspan="3">
                        <asp:DropDownList ID="DDLInstitution" runat="server" AppendDataBoundItems="True" CssClass="ddlDetail" DataSourceID="SqlDSInstitution"
                             DataTextField="institutionExpr" DataValueField="institutionID" SelectedValue='<%# Bind("institutionID")%>' AutoPostBack="True" Enabled="False">
                            <asp:ListItem Selected="True" Value="">(none)</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">Address</td>
                    <td colspan="3">
                        <asp:DropDownList ID="DDLAddress" runat="server" AppendDataBoundItems="True" CssClass="ddlDetail" DataSourceID="SqlDsAddress" DataTextField="addressExpr" DataValueField="addressID" SelectedValue='<%#DataBinder.Eval(Container.DataItem, "addressID")%>' Enabled="False">
                            <asp:ListItem Selected="True" Value="">(none)</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">Shipping as</td>
                    <td>
                        <asp:DropDownList ID="DDLPurpose" runat="server" AppendDataBoundItems="True"  DataSourceID="SqlDsPurpose"
                             DataTextField="PurposeE" DataValueField="purposeID" SelectedValue='<%# Bind("purposeID")%>' AutoPostBack="True" Enabled="False">
                            <asp:ListItem Selected="True" Value="">(none)</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="mgmTitle">Loan number</td>
                    <td>
                        <asp:Label ID="loanNumberLabel" runat="server" CssClass="textBoxDetail" Text='<%# Bind("loanNumber") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="mgmTitle">Number of sheets</td>
                    <td>
                        <asp:Label ID="amountLabel" runat="server" CssClass="textBoxDetail" Text='<%# Bind("amount") %>' />
                    </td>
                    <td class="mgmTitle">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="mgmTitle">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td class="mgmTitle">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="mgmTitle">Return Date</td>
                    <td>
                        <asp:Label ID="returnDateLabel" runat="server" CssClass="textBoxDetail" Text='<%# Bind("returnDate", "{0:d}")%>' />
                    </td>
                    <td class="mgmTitle">&nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="mgmTitle">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td class="mgmTitle">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            &nbsp;&nbsp;&nbsp; 備註
            <asp:Label ID="noteLabel" runat="server" Text='<%# Eval("note")%>' />
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;
            <asp:CheckBox ID="tempCheckCheckBox" runat="server" Checked='<%# Bind("tempCheck") %>' Enabled="false" Text="資料審訂" />
            <br />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯" />
            &nbsp;&nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="新增" OnClick="NewButton_Click" />

             <br />
            <br />
            <asp:SqlDataSource ID="SqlDsAddress" runat="server" ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>"
                  SelectCommand="SELECT [AddressID], [AddressLine1], [AddressLine2], [City], [StateProvince], [PostalCode],
                  [country2Code], [linkTable], [ownerID], 
                  ISNULL([AddressLine2], '') + ', ' + ISNULL([City], '') + ', ' +  ISNULL([StateProvince], '')
                  + ', ' +  ISNULL([PostalCode], '') + ', ' + ISNULL([country2Code], '') AS addressExpr
                  FROM [Address] WHERE (([linkTable] = @linkTable) AND ([ownerID] = @ownerID))">
                <SelectParameters>
                    <asp:Parameter DefaultValue="addressID" Name="linkTable" Type="String" />
                    <asp:ControlParameter ControlID="DDLInstitution" Name="ownerID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

            
        </ItemTemplate>
    </asp:FormView>
    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="LoanM.aspx">&nbsp;&nbsp;回 標本借出總覽</asp:HyperLink>
    <br />
  

    <hr />
    <div style="background-color: lightgray ">
        &nbsp;&nbsp;編輯單位資料前，先儲存目前修改<br />
        &nbsp;&nbsp;編輯單位資料（含新增地址）後，回到[借出清單]後再回來修改[借出詳細資料]<br />
    &nbsp;&nbsp;&nbsp;<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="institutionM.aspx">單位管理</asp:HyperLink>
    &nbsp;&nbsp;&nbsp;<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="institutionDetailM.aspx">新增單位</asp:HyperLink>
    </div>
    <br />
    
    <hr />

    <br />
    <p> 新增標本資料</p>
    <p> （舊資料無館號先填採集者採集號，資料庫篩選可能符合的館號後再修改）</p>
    <asp:DetailsView ID="DetailsViewList" runat="server" Height="50px" Width="250px" AutoGenerateRows="False" CellPadding="4" DataSourceID="SqlDSLoanList" DefaultMode="Insert" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
        <EditRowStyle BackColor="#999999" />
        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="specimenOrderNum" HeaderText="館號" >
            <HeaderStyle Width="80px" />
            </asp:BoundField>
            <asp:TemplateField></asp:TemplateField>
            <asp:BoundField DataField="collector" HeaderText="採集者" />
            <asp:BoundField DataField="collectNum" HeaderText="採集號" />
            <asp:CommandField ShowInsertButton="True" />
        </Fields>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:DetailsView>
    <br />
    <hr />
    <br />
    <table class="auto-style1">
        <tr>
            <td style="width:600px;">借出清單 （個別歸還時才填歸還日期；尚未歸還者，歸還日期填 2100/12/31）</td>
            <td>館號建議值（只比對採集號一，採集者自行判斷，其他上網個別找 ）</td>
        </tr>
        <tr style="vertical-align:top;">
            <td>
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White"
         BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="loanListID"
         DataSourceID="SqlDSLoanList" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowEditButton="True" />            
            <asp:BoundField DataField="loanListID" HeaderText="List ID" InsertVisible="False" ReadOnly="True" SortExpression="loanListID" />           
            <asp:BoundField DataField="specimenOrderNum" HeaderText="館號" SortExpression="specimenOrderNum" />
            <asp:BoundField HeaderText=" - - - " />
            <asp:BoundField DataField="collector" HeaderText="採集者" SortExpression="collector" />
            <asp:BoundField DataField="collectNum" HeaderText="採集號" SortExpression="collectNum" />
            
            <asp:BoundField DataField="returnDate" HeaderText="歸還日期" SortExpression="returnDate" DataFormatString="{0:d}" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
    </asp:GridView>
    
            </td>
            <td>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDSCheck">
                    <Columns>
                        <asp:BoundField DataField="collectorNum" HeaderText="採集號" ReadOnly="True" SortExpression="collectorNum" />
                        <asp:BoundField DataField="specimenOrderNum" HeaderText="館號" SortExpression="specimenOrderNum" />
                        <asp:BoundField DataField="familyE" HeaderText="科名" SortExpression="familyE" />
                        <asp:BoundField DataField="speciesExpr" HeaderText="學名" ReadOnly="True" SortExpression="speciesExpr" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
    <br />
    
    <br />


    <asp:SqlDataSource ID="SqlDSInvoice" runat="server" ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>"         
         InsertCommand="INSERT INTO [invoice] ( [via], [numberOfPackage], [approvedBy], [loanNumber], [applicantE], [institutionID], [applicantC], [addressID], [purposeID], [amount], [isNative], [checkIn], [requestDate], [signingDate], [shippingDate], [returnDate], [admin], [tempDepartment], [tempCheck], note) VALUES ( @via, @numberOfPackage, @approvedBy, @loanNumber, @applicantE, @institutionID, @applicantC, @addressID, @purposeID, @amount, @isNative, @checkIn, @requestDate, @signingDate, @shippingDate, @returnDate, @admin, @tempDepartment, @tempCheck, @note)"
         SelectCommand="SELECT [invoiceID], [via], [numberOfPackage], [approvedBy], [loanNumber], [applicantE], [institutionID], [applicantC], [addressID], [purposeID], [amount], [isNative], [checkIn], [requestDate], [signingDate], [shippingDate], [returnDate], [admin], [tempDepartment], [tempCheck], note FROM [invoice] WHERE ([invoiceID] = @invoiceID)"
         UpdateCommand="UPDATE [invoice]
         SET [via] = @via, [numberOfPackage] = @numberOfPackage, [approvedBy] = @approvedBy,
         [loanNumber] = @loanNumber, [applicantE] = @applicantE, [institutionID] = @institutionID,
         [applicantC] = @applicantC, [addressID] = @addressID, [purposeID] = @purposeID,
         [amount] = @amount, [isNative] = @isNative, [checkIn] = @checkIn, [requestDate] = @requestDate,
         [signingDate] = @signingDate, [shippingDate] = @shippingDate, [returnDate] = @returnDate,
         [admin] = @admin, [tempDepartment] = @tempDepartment, [tempCheck] = @tempCheck, note = @note
         WHERE [invoiceID] = @invoiceID"
         DeleteCommand="DELETE FROM [invoice] WHERE [invoiceID] = @invoiceID">
        
        <DeleteParameters>
            <asp:Parameter Name="invoiceID" Type="Int32" />
        </DeleteParameters>
        
        <InsertParameters>
            
            <asp:Parameter Name="invoiceID" Type="Int32" />
            <asp:Parameter Name="via" Type="String" />
            
            <asp:Parameter Name="numberOfPackage" Type="Byte" />
            <asp:Parameter Name="approvedBy" Type="String" />
            <asp:Parameter Name="loanNumber" Type="Int32" />
            <asp:Parameter Name="applicantE" Type="String" />
            <asp:Parameter Name="institutionID" Type="Int16" />
            <asp:Parameter Name="applicantC" Type="String" />
            <asp:Parameter Name="addressID" Type="Int32" />
            <asp:Parameter Name="purposeID" Type="Byte" />
            <asp:Parameter Name="amount" Type="Int32" />
            <asp:Parameter Name="isNative" Type="Boolean" />
            <asp:Parameter Name="checkIn" Type="Boolean" />
            <asp:Parameter DbType="Date" Name="requestDate" />
            <asp:Parameter DbType="Date" Name="signingDate" />
            <asp:Parameter DbType="Date" Name="shippingDate" />
            <asp:Parameter DbType="Date" Name="returnDate" />
            <asp:Parameter Name="admin" Type="String" />
            <asp:Parameter Name="tempDepartment" Type="String" />
            <asp:Parameter Name="tempCheck" Type="Boolean" />
            <asp:Parameter Name="note" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="invoiceID" QueryStringField="invoiceID" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="via" Type="String" />
            <asp:Parameter Name="numberOfPackage" Type="Byte" />
            <asp:Parameter Name="approvedBy" Type="String" />
            <asp:Parameter Name="loanNumber" Type="Int32" />
            <asp:Parameter Name="applicantE" Type="String" />
            <asp:Parameter Name="institutionID" Type="Int16" />
            <asp:Parameter Name="applicantC" Type="String" />
            <asp:Parameter Name="addressID" Type="Int32" />
            <asp:Parameter Name="purposeID" Type="Byte" />
            <asp:Parameter Name="amount" Type="Int32" />
            <asp:Parameter Name="isNative" Type="Boolean" />
            <asp:Parameter Name="checkIn" Type="Boolean" />
            <asp:Parameter DbType="Date" Name="requestDate" />
            <asp:Parameter DbType="Date" Name="signingDate" />
            <asp:Parameter DbType="Date" Name="shippingDate" />
            <asp:Parameter DbType="Date" Name="returnDate" />
            <asp:Parameter Name="admin" Type="String" />
            <asp:Parameter Name="tempDepartment" Type="String" />
            <asp:Parameter Name="tempCheck" Type="Boolean" />
            <asp:Parameter Name="invoiceID" Type="Int32" />
            <asp:Parameter Name="note" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDSLoanList" runat="server" ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>"
         DeleteCommand="DELETE FROM [loanList] WHERE [loanListID] = @loanListID"
         InsertCommand="INSERT INTO [loanList] ([invoiceID], [collectorID], [collector], [collectNum], [specimenOrderNum], [returnDate]) VALUES (@invoiceID, @collectorID, @collector, @collectNum, @specimenOrderNum, @returnDate)"
         SelectCommand="SELECT [invoiceID], [loanListID], [collectorID], [collector], [collectNum], [specimenOrderNum], [returnDate] FROM [loanList] WHERE ([invoiceID] = @invoiceID)"
         UpdateCommand="UPDATE [loanList] SET [collectorID] = @collectorID, [collector] = @collector, [collectNum] = @collectNum, [specimenOrderNum] = @specimenOrderNum, [returnDate] = @returnDate WHERE [loanListID] = @loanListID">
        <DeleteParameters>
            <asp:Parameter Name="loanListID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            
            <asp:Parameter Name="collectorID" Type="Int32" />
            <asp:Parameter Name="collector" Type="String" />
            <asp:Parameter Name="collectNum" Type="String" />
            <asp:Parameter Name="specimenOrderNum" Type="Int32" />
            <asp:Parameter DbType="Date" Name="returnDate" />
            <asp:QueryStringParameter Name="invoiceID" QueryStringField="invoiceID" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="invoiceID" QueryStringField="invoiceID" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="invoiceID" Type="Int32" />
            <asp:Parameter Name="collectorID" Type="Int32" />
            <asp:Parameter Name="collector" Type="String" />
            <asp:Parameter Name="collectNum" Type="String" />
            <asp:Parameter Name="specimenOrderNum" Type="Int32" />
            <asp:Parameter DbType="Date" Name="returnDate" />
            <asp:Parameter Name="loanListID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDSCheck" runat="server" ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>" SelectCommand="SELECT [specimenOrderNum], [familyE], [speciesExpr], [invoiceID], [collectorNum]
         FROM [vwCheckLoanList] WHERE ([invoiceID] = @invoiceID) ORDER BY collectorNum">
        <SelectParameters>
            <asp:QueryStringParameter Name="invoiceID" QueryStringField="invoiceID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDsPurpose" runat="server" ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>" SelectCommand="SELECT [purposeID], [purposeE], [purposeC] FROM [invoicePurpose]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDSInstitution" runat="server" ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>"
         SelectCommand="SELECT [institutionID], [institutionAbbr], [institutionE], [institutionC],
         [institutionAbbr] +'  | ' + [institutionE] + ' ' + ISNULL([institutionC],'') AS institutionExpr
         FROM [institution] ORDER BY [institutionAbbr], [institutionE]"></asp:SqlDataSource>
   
    <br />

</asp:Content>

