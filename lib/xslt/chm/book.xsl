<?xml version="1.0"?>
<!-- davidpriest.ca dds -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:html="http://www.w3.org/1999/xhtml" xmlns:fo="http://www.w3.org/1999/XSL/Format"
xmlns:d="http://docbook.org/ns/docbook" xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0"
xmlns:svg="http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd" id="chm_book" version="1.0">
  <xsl:import href="../../../opt/docbook-xsl-ns-1.76.1/htmlhelp/htmlhelp.xsl"/>
  <xsl:import href="../debug.xsl"/>
  <xsl:import href="../db5/common-params.xsl"/>
  <!-- includes override imports -->
  <xsl:include href="common-params.xsl"/>
  <!-- common above, root element-specific below -->
  <!-- <xsl:include href="book-params.xsl"/> -->
  <!-- passed parameters -->
  <xsl:param name="db5.path">..//opt//docbook-xsl-ns-1.76.1</xsl:param>
  <xsl:param name="draft.mode"/>
  <xsl:param name="debug.mode"/>
  <xsl:param name="img.src.path">dummy/</xsl:param>
</xsl:stylesheet>
