<%@ Page Language="VB" MasterPageFile="~/PPQMasterPage.master" AutoEventWireup="false" CodeFile="ShowCart.aspx.vb" Inherits="top_level_ShowCart" title="Untitled Page" %>

<%@ Register Src="../user-controls/Cart.ascx" TagName="Cart" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:Cart ID="Cart1" runat="server" />
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Checkout.aspx">Proceed to the checkout</asp:HyperLink>
</asp:Content>

