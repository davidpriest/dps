<?xml version="1.0"?>
<!-- davidpriest.ca dps -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:html="http://www.w3.org/1999/xhtml" xmlns:fo="http://www.w3.org/1999/XSL/Format"
xmlns:d="http://docbook.org/ns/docbook" xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0"
xmlns:svg="http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd" id="wh_book" version="1.0">
  <xsl:import href="../../../../opt/docbook-xsl-ns-1.76.1/webhelp/xsl/webhelp.xsl"/>
  <xsl:import href="../db5/common-params.xsl"/>
  <!-- includes override imports -->
  <xsl:include href="common-params.xsl"/>
  <!-- common above, root element-specific below -->
  <!-- passed parameters -->
  <xsl:param name="db5.path">..//opt//docbook-xsl-ns-1.76.1</xsl:param>
  <xsl:param name="draft.mode"/>
  <xsl:param name="debug.mode"/>
</xsl:stylesheet>
