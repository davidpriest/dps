<?xml version="1.0"?>
<!--	davidpriest.ca -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:o="urn:oasis:names:tc:entity:xmlns:xml:catalog" id="dcatalog_to_oasis" version="1.0">
  <xsl:template match="*:catalog">
    <o:catalog>
      <xsl:apply-templates select="*:library">
        <xsl:sort select="@type"/>
      </xsl:apply-templates>
    </o:catalog>
  </xsl:template>
  <xsl:template match="library[@type='pub']//pub">
    <o:uri>
      <xsl:attribute name="id" select="@id"/>
      <xsl:attribute name="uri" select="@path"/>
    </o:uri>
  </xsl:template>
  <xsl:template match="library[@type='xsl']//file">
    <o:uri>
      <xsl:attribute name="id" select="@id"/>
      <xsl:attribute name="uri" select="concat(parent::*[@root],@path)"/>
    </o:uri>
  </xsl:template>
</xsl:stylesheet>
