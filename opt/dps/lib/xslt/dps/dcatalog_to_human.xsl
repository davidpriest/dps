<?xml version="1.0"?>
<!--	davidpriest.ca -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" id="dcatalog_to_human" version="1.0">
  <xsl:template match="//library">
    <xsl:apply-templates select="//pub">
      <xsl:sort select="@root"/>
      <xsl:sort select="@id"/>
    </xsl:apply-templates>
  </xsl:template>
  <xsl:template match="pub">
    <!-- XML:ID or absolute path -->
    <xsl:choose>
      <xsl:when test="@id">
        <xsl:value-of select="@id"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="@path"/>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text> : </xsl:text>
    <!-- Root element indicator -->
    <xsl:value-of select="@root"/>
    <xsl:text> : </xsl:text>
    <!-- TITLE -->
    <xsl:choose>
      <xsl:when test="text()">
        <xsl:value-of select="normalize-space(text())"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="@path"/>
      </xsl:otherwise>
    </xsl:choose>
    <!-- DESTINATION -->
    <xsl:text> [ </xsl:text>
    <xsl:choose>
      <xsl:when test="@destfile">
        <xsl:value-of select="@destfile"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="'ERROR: NO FILE NAME'"/>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text> ] </xsl:text>
    <!-- linefeed -->
    <xsl:text>
</xsl:text>
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
</xsl:stylesheet>
