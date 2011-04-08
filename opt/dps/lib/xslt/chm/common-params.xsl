<?xml version="1.0"?>
<!-- davidpriest.ca dps -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:html="http://www.w3.org/1999/xhtml" xmlns:fo="http://www.w3.org/1999/XSL/Format"
xmlns:d="http://docbook.org/ns/docbook" xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0"
xmlns:svg="http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd" id="chm_common_params" version="1.0">
  <xsl:param name="generate.toc">
      /appendix  toc,title
      book         nop
      /chapter    toc,title
      /preface    toc,title
      /section     toc,title
   </xsl:param>
  <xsl:param name="chunk.first.sections" select="0"/>
  <xsl:param name="chunk.section.depth" select="5"/>
  <xsl:param name="graphic.default.extension">png</xsl:param>
  <xsl:param name="html.stylesheet" select="htmlhelp.css"/>
  <xsl:param name="htmlhelp.encoding">windows-1252</xsl:param>
  <xsl:param name="htmlhelp.hhc.show.root" select="0"/>
  <xsl:param name="htmlhelp.remember.window.position" select="1"/>
  <xsl:param name="htmlhelp.show.favorites" select="1"/>
  <xsl:param name="insert.olink.page.number">no</xsl:param>
  <xsl:param name="insert.olink.pdf.frag" select="0"/>
  <xsl:param name="insert.xref.page.number">no</xsl:param>
  <xsl:param name="manifest.in.base.dir" select="1"/>
  <xsl:param name="prefer.internal.olink" select="1"/>
  <xsl:param name="preferred.mediaobject.role">chm</xsl:param>
  <xsl:param name="use.extensions" select="1"/>
  <xsl:param name="use.id.as.filename" select="0"/>
  <xsl:param name="use.role.for.mediaobject" select="1"/>
  <xsl:param name="use.svg" select="0"/>
  </xsl:stylesheet>
