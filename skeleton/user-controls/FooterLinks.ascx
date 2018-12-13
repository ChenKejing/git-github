<%@ Control Language="VB" ClassName="FooterLinks" %>

<script runat="server">

    
    
    
</script>

<asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/Web.sitemap" TransformFile="~/user-controls/FooterLinksTransform.xsl">
</asp:XmlDataSource>
<div style="width: 266px; height: 192px; font-size: 0.8em; padding-top: 5px; text-align: center;">
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="XmlDataSource1">
    <ItemTemplate>
        <a href='<%#XPath("@url")%>'
           title='<%#XPath("@description")%>'><%#XPath("@title")%></a>
    </ItemTemplate>
    <SeparatorTemplate> | </SeparatorTemplate>    
    </asp:Repeater>
</div>
<div style="width: 264px; height: 100px; font-size: 0.8em; padding-top: 5px; text-align: center;">
    <asp:HyperLink ID="HyperLink1" runat="server" Text="Webmaster@yoursite.com" ToolTip="Email The Webmaster" NavigateUrl="../ShowMenu.aspx">HyperLink</asp:HyperLink></div>
