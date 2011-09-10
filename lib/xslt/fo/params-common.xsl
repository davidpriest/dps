<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:db="http://docbook.org/ns/docbook"
xmlns:f="http://docbook.org/xslt/ns/extension" version="2.0"
id="xslt.fo.params.common">
  <!-- TODO: A number of these can be moved to ../dbxslt2-params-common -->
  <xsl:param name="admonition.graphics.path" select="$media.dir"/>
  <xsl:param name="draft.watermark.image"><xsl:value-of select="concat($media.dir,'/draft.png')"/></xsl:param>
  <xsl:param name="img.src.path"/>
  <xsl:param name="variablelist.as.blocks" select="1"/>
  <xsl:attribute-set name="draft.block.properties">
    <xsl:attribute name="background-color">lightyellow</xsl:attribute>
    <xsl:attribute name="border">0.5pt solid grey</xsl:attribute>
    <xsl:attribute name="margin">6pt 0pt</xsl:attribute>
    <xsl:attribute name="padding">6pt</xsl:attribute>
    <xsl:attribute name="font-weight">normal</xsl:attribute>
    <xsl:attribute name="font-size">smaller</xsl:attribute>
  </xsl:attribute-set>
</xsl:stylesheet>
