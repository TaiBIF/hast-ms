<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="LoanM.aspx.vb" Inherits="Mgm_secure_LoanM" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DropDownList ID="DDLNative" runat="server" AutoPostBack="True">
        <asp:ListItem Value=" "></asp:ListItem>
        <asp:ListItem Value="1">國內</asp:ListItem>
        <asp:ListItem Value="0">國外</asp:ListItem>
        
    </asp:DropDownList>
    <br />
    <br />
    <asp:DropDownList ID="DDLPurpose" runat="server" AutoPostBack="True">
        <asp:ListItem Value="5">借（出）</asp:ListItem>
    </asp:DropDownList>
     <br />
    <br />
    <asp:DropDownList ID="DDLCheckIn" runat="server" AutoPostBack="True">
        <asp:ListItem Value=" "></asp:ListItem>
        <asp:ListItem Value="0">未還</asp:ListItem>
        <asp:ListItem Value="1">已還</asp:ListItem>
    </asp:DropDownList>
     <br />
    <br />
    <asp:GridView ID="GridView1" runat="server"  AutoGenerateColumns="False" DataSourceID="SqlDSLoanTo" >
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="invoiceID" DataNavigateUrlFormatString="LoanDetailM.aspx?invoiceID={0}" DataTextField="invoiceID" HeaderText="單號" />
            <asp:CheckBoxField DataField="tempCheck" HeaderText="已校驗" />
            <asp:CheckBoxField DataField="isNative" HeaderText="國內" />
            <asp:CheckBoxField DataField="checkIn" HeaderText="歸還" />
            <asp:BoundField DataField="loanNumber" HeaderText="Loan Number" SortExpression="loanNumber" />
            <asp:TemplateField HeaderText="借閱人員">
                <ItemTemplate>
                    <asp:Label Text='<%#Eval("applicantE") + " " + Eval("applicantC")%> ' runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>                    
            <asp:BoundField DataField="institutionAbbr" HeaderText="單位縮寫" SortExpression="institutionAbbr" />
            <asp:TemplateField HeaderText="單位名稱">
                <ItemTemplate>
                    <asp:Label Text='<%#Eval("institutionE") + " " + Eval("institutionC")%> ' runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="tempDepartment" HeaderText="單位(暫用)" SortExpression="tempDepartment" />  
            <asp:BoundField DataField="shippingDate" HeaderText="簽核日期" SortExpression="shippingDate" DataFormatString="{0:d}" />
            <asp:BoundField DataField="returnDate" HeaderText="歸還日期" SortExpression="returnDate"  DataFormatString="{0:d}" />
            <asp:BoundField DataField="amount" HeaderText="數量" SortExpression="amount" /> 
            
            
            
                      
        </Columns>
    </asp:GridView>
    
    
    <asp:SqlDataSource ID="SqlDSLoanTo" runat="server" >        
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HASTDBConnectionString %>" 
        SelectCommand="SELECT [invoiceID], [loanNumber], [applicantE], [applicantC], [institutionID], [institutionAbbr],
         [institutionE], [institutionC], [signingDate], [isNative], [checkIn], [returnDate], [amount], [purposeID],
         [purposeE], [purposeC], [tempDepartment], [tempCheck]
         FROM [vwInvoice]
         WHERE (([purposeC] = @purposeC) AND ([isNative] = @isNative) AND ([checkIn] = @checkIn))">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLPurpose" Name="purposeC" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="DDLNative" Name="isNative" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="DDLCheckIn" Name="checkIn" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>

