<?xml version="1.0"?>
<!-- davidpriest.ca dps -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:html="http://www.w3.org/1999/xhtml" xmlns:fo="http://www.w3.org/1999/XSL/Format"
xmlns:d="http://docbook.org/ns/docbook" xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0"
xmlns:svg="http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd" id="wh_common_params" version="1.0">
  <xsl:param name="admon.graphics" select="1"/>
  <xsl:param name="admon.graphics.extension">.svg</xsl:param>
  <xsl:param name="admon.graphics.path">../common/images/</xsl:param>
  <xsl:param name="bibliography.style">iso690</xsl:param>
  <xsl:param name="keep.relative.image.uris" select="0"/>
  <xsl:param name="olink.doctitle">yes</xsl:param>
  <xsl:param name="prefer.internal.olink" select="1"/>
  <xsl:param name="section.label.includes.component.label" select="0"/>
  <xsl:param name="segmentedlist.as.table" select="1"/>
  <xsl:param name="segmentedlist.table.row.spacing">0.5em</xsl:param>
  <xsl:param name="shade.verbatim" select="1"/>
  <xsl:param name="tablecolumns.extension" select="1"/>
  <xsl:param name="use.extensions" select="1"/>
  <xsl:param name="variablelist.as.blocks" select="1"/>
  <xsl:param name="variablelist.term.break.after" select="1"/>
  <!-- webhelp specific -->
  <xsl:param name="webhelp.include.search.tab" select="'true'"/>
  <xsl:param name="webhelp.indexer.language">
    <xsl:choose>
      <xsl:when test="/*[@xml:lang]">
        <xsl:value-of select="/*/@xml:lang"/>
      </xsl:when>
      <xsl:otherwise>en</xsl:otherwise>
    </xsl:choose>
  </xsl:param>
</xsl:stylesheet>
