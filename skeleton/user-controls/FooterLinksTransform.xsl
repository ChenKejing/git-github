<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:wsm="http://schemas.microsoft.com/AspNet/SiteMap-File-1.0">

  <xsl:template match="/">
    <footerLinks>
      <xsl:apply-templates select="//wsm:siteMap" />
    </footerLinks>
  </xsl:template>

  <xsl:template match="wsm:siteMap">
    <xsl:apply-templates select="./wsm:siteMapNode" />
    <xsl:apply-templates select="./wsm:siteMapNode/wsm:siteMapNode" />
  </xsl:template>

  <xsl:template match="wsm:siteMapNode">
    <xsl:copy-of select="." />
  </xsl:template>  

</xsl:stylesheet> 

