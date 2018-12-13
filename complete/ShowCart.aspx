<%@ Page Language="VB" MasterPageFile="~/PPQ.master" AutoEventWireup="false" CodeFile="ShowCart.aspx.vb" Inherits="ShowCart" title="Untitled Page" %>

<%@ Register Src="Cart.ascx" TagName="Cart" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    &nbsp;<uc1:Cart ID="Cart1" runat="server" />
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Checkout.aspx">Proceed to the checkout</asp:HyperLink><br />
</asp:Content>

