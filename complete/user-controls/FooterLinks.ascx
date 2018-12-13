<%@ Control Language="VB" AutoEventWireup="false" CodeFile="FooterLinks.ascx.vb" Inherits="user_controls_FooterLinks" %>

<asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/Web.sitemap" TransformFile="~/user-controls/FooterLinksTransform.xsl">
</asp:XmlDataSource>

<div style="font-size: 0.8em; padding-top: 5px; text-align: center;">
	<asp:Repeater ID="Repeater1" runat="server" DataSourceID="XmlDataSource1">
    <ItemTemplate>
      <a href='<%#XPath("@url")%>' title='<%#XPath("@description")%>'><%#XPath("@title")%></a>
    </ItemTemplate>
    <SeparatorTemplate> | </SeparatorTemplate>
	</asp:Repeater>
</div>

<div style="font-size: 0.8em; padding-top: 5px; text-align: center;">
	<asp:HyperLink ID="HyperLink1" runat="server" 
	     Text="webmaster@yoursite.com" ToolTip="Email the Webmaster" 
	     NavigateUrl="mailto:webmaster@yoursite.com"></asp:HyperLink>
</div>
