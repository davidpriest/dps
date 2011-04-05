<?xml version="1.0"?>
<!-- davidpriest.ca -->
<!-- find all profiling information in a document -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" id="lspf">
  <xsl:template match="/">
    <xsl:variable name="pfs">
      <xsl:apply-templates select="//*[@*]" mode="build"/>
    </xsl:variable>
    <!-- filter duplicates #TODO: group and sort -->
    <xsl:copy-of select="$pfs//profile[not(text()=preceding-sibling::profile/text())]"/>
  </xsl:template>
  <xsl:template match="*" mode="build">
    <xsl:apply-templates select="@arch|@audience|@conformance|@os|@revision|@revisionflag|@security|@status|@userlevel|@vendor|@xml:lang" mode="build"/>
  </xsl:template>
  <xsl:template match="@*" mode="build">
      <profile name="{name()}">
        <xsl:value-of select="."/>
      </profile>
  </xsl:template>
</xsl:stylesheet>
