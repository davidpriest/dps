<?xml version="1.0"?>
<!-- davidpriest.ca dps -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:html="http://www.w3.org/1999/xhtml" xmlns:fo="http://www.w3.org/1999/XSL/Format"
xmlns:d="http://docbook.org/ns/docbook" xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0"
xmlns:svg="http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd" id="xslt.fo.book" version="2.0">
  <!-- import: "Importing a stylesheet module is the same as including it
  except that template rules and other declarations in the importing module
  take precedence over template rules and declarations in the imported module"
  -->
  <xsl:import href="../dbxslt2-pointer.xsl"/>
  <xsl:import href="../dbxslt2-params-common.xsl"/>
  <xsl:import href="./params-common.xsl"/>
  <xsl:import href="./params-article.xsl"/>
  <!-- include: "The order of declarations within a stylesheet level is the
  same as the document order that would result if each stylesheet module were
  inserted textually in place of the xsl:include element that references it.""
  -->
  <!-- passed parameters: overrule params set by includes & imports -->
  <xsl:param name="draft.mode"/>
  <xsl:param name="debug.mode"/>
  <xsl:param name="output.dir"/> <!-- used by common.xsl "f:mediaobject-href" @ line 970 -->
</xsl:stylesheet>
