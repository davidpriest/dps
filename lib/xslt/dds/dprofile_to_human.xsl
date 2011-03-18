<?xml version="1.0"?>
<!--	davidpriest.ca -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" id="dprofile_to_human" version="1.0">
  <xsl:template match="/*">
    <xsl:text>Profile information for </xsl:text>
    <xsl:value-of select="@id"/>
    <xsl:text>:
</xsl:text>
    <xsl:apply-templates select="//pub">
      <xsl:sort select="@id"/>
    </xsl:apply-templates>
  </xsl:template>
  <xsl:template match="pub">
    <xsl:choose>
      <xsl:when test="@root">
        <xsl:value-of select="@root"/>
        <xsl:text> : </xsl:text>
      </xsl:when>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@id">
        <xsl:value-of select="@id"/>
      </xsl:when>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@path">
        <xsl:value-of select="@path"/>
      </xsl:when>
    </xsl:choose>
    <xsl:text>
</xsl:text>
    <xsl:apply-templates select="profile">
      <xsl:sort select="@name"/>
    </xsl:apply-templates>
  </xsl:template>
  <xsl:template match="file">
    <xsl:value-of select="@title"/>
    <xsl:text> : </xsl:text>
    <xsl:value-of select="@id"/>
    <xsl:text> : </xsl:text>
    <xsl:value-of select="@desc"/>
    <xsl:text>
</xsl:text>
  </xsl:template>
  <xsl:template match="profile">
    <xsl:value-of select="@name"/>
    <xsl:text> : </xsl:text>
    <xsl:value-of select="text()"/>
    <xsl:text>
</xsl:text>
  </xsl:template>
</xsl:stylesheet>
