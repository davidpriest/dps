<?xml version="1.0"?>
<!--	davidpriest.ca -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" id="uniqueids">
  <xsl:import href="identity.xsl"/>
  <xsl:import href="debug.xsl"/>
  <xsl:param name="draft.mode"/>
  <xsl:param name="debug.mode"/>
  <!-- identity transform performed by import -->
  <!-- make ids unique -->
  <xsl:template match="*[@xml:id]">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:attribute name="xml:id">
        <xsl:call-template name="object.xid"/>
      </xsl:attribute>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="*[@id]">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:attribute name="id">
        <xsl:call-template name="object.id"/>
      </xsl:attribute>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
  <!-- for object ids that are repeated, create unique IDs -->
  <xsl:template name="object.xid">
    <xsl:param name="object" select="."/>
    <xsl:variable name="xid" select="@xml:id"/>
    <xsl:variable name="preceding.xid" select="count(preceding::*[@xml:id = $xid])"/>
    <xsl:choose>
      <xsl:when test="$object/@xml:id and $preceding.xid != 0">
        <xsl:value-of select="concat($object/@xml:id, $preceding.xid)"/>
        <xsl:call-template name="debug">
          <xsl:with-param name="con">Repeated @xml:id changed to <xsl:value-of select="concat($object/@xml:id, $preceding.xid)"/></xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$object/@xml:id">
        <xsl:value-of select="$object/@xml:id"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="generate-id($object)"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template name="object.id">
    <xsl:param name="object" select="."/>
    <xsl:variable name="id" select="@id"/>
    <xsl:variable name="preceding.id" select="count(preceding::*[@id = $id])"/>
    <xsl:choose>
      <xsl:when test="$object/@id and $preceding.id != 0">
        <xsl:value-of select="concat($object/@id, $preceding.id)"/>
        <xsl:call-template name="debug">
          <xsl:with-param name="con">Repeated @id changed to <xsl:value-of select="concat($object/@id, $preceding.id)"/></xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$object/@id">
        <xsl:value-of select="$object/@id"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="generate-id($object)"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
