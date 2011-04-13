<?xml version="1.0"?>
<!--	davidpriest.ca -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:d="http://docbook.org/ns/docbook" id="pub_to_dcatalog" version="2.0">
  <xsl:template match="/*">
    <pub>
      <xsl:for-each select="@arch|@audience|@conformance|@os|@revision|@revisionflag|@security|@status|@userlevel|@vendor|@xml:lang">
        <xsl:attribute name="{name()}">
          <xsl:value-of select="."/>
        </xsl:attribute>
      </xsl:for-each>
      <xsl:attribute name="root">
        <xsl:value-of select="local-name()"/>
      </xsl:attribute>
      <xsl:attribute name="path">
        <xsl:value-of select="base-uri(.)"/>
      </xsl:attribute>
      <xsl:attribute name="id">
        <xsl:value-of select="@xml:id"/>
      </xsl:attribute>
      <xsl:if test="/*/*:info//*:filename[@role='style']">
        <xsl:attribute name="style">
          <xsl:value-of select="/*/*:info//*:filename[@role='style']"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:attribute name="destfile">
        <xsl:value-of select="/*/*:info//*:filename[@role='filename']"/>
      </xsl:attribute>
      <xsl:value-of select="/*/*:info/*:title"/>
    </pub>
  </xsl:template>
</xsl:stylesheet>
