<?xml version="1.0"?>
<!-- davidpriest.ca dps -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:html="http://www.w3.org/1999/xhtml" xmlns:fo="http://www.w3.org/1999/XSL/Format"
xmlns:d="http://docbook.org/ns/docbook" xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0"
xmlns:svg="http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd" id="fo_book" version="1.0">
  <xsl:import href="../../../opt/docbook-xslt2-2.0.0/xslt/base/fo/docbook.xsl"/>
  <xsl:import href="common-params.xsl"/>
  <xsl:import href="book-params.xsl"/>
  <!-- passed parameters -->
  <xsl:param name="db5.path"/>
  <xsl:param name="draft.mode"/>
  <xsl:param name="debug.mode"/>
  <xsl:param name="output.dir"/>
  <xsl:param name="passivetex.extensions"/>
</xsl:stylesheet>
