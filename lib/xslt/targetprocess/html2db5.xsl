<?xml version="1.0"?>
<!-- davidpriest.ca -->
<xsl:stylesheet xmlns="http://docbook.org/ns/docbook" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xi="http://www.w3.org/2001/XInclude" xmlns:svg="http://www.w3.org/2000/svg" xmlns:tp="http://dev.targetprocess.com/" xmlns:html="http://www.w3.org/1999/xhtml" xmlns:db="http://docbook.org/ns/docbook" xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0" id="html2db5" version="1.0">
  <!-- 
copy all db: content -->
  <xsl:import href="../identity.xsl"/>
  <!--
empty sections get an alternative message -->
  <xsl:template match="db:itemizedlist">
    <xsl:variable name="text">
      <xsl:call-template name="stripflags">
        <xsl:with-param name="text" select="."/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="string($text)">
        <db:itemizedlist>
          <xsl:apply-templates/>
        </db:itemizedlist>
      </xsl:when>
      <xsl:otherwise>
        <db:para>None noted for this release.</db:para>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <!-- 
strip out list wrappers -->
  <xsl:template match="tp:items">
    <xsl:apply-templates/>
  </xsl:template>
  <!--
replace <br> with linebreak -->
  <xsl:template match="tp:br">
    <xsl:processing-instruction name="linebreak"/>
  </xsl:template>
  <!--
each TP Description is a new bulletpoint -->
  <xsl:template match="tp:Description">
    <db:listitem>
      <xsl:apply-templates/>
    </db:listitem>
  </xsl:template>
  <!--
TP divs are paragraphs; if it's an empty paragraph after stripping flags, don't output -->
  <xsl:template match="tp:div">
    <xsl:variable name="text">
      <xsl:call-template name="stripflags">
        <xsl:with-param name="text" select="."/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:if test="string($text)">
      <db:para>
        <xsl:apply-templates/>
        <xsl:if test=".[last()]">
          <db:phrase role="rally.id">
            <xsl:text> [TP</xsl:text>
            <xsl:value-of select="ancestor::tp:Description/@Id"/>
            <xsl:text>]</xsl:text>
          </db:phrase>
        </xsl:if>
      </db:para>
    </xsl:if>
  </xsl:template>
  <!--
process TP comment text -->
  <xsl:template match="text()[ancestor::tp:*]">
    <xsl:variable name="text">
      <xsl:call-template name="stripflags">
        <xsl:with-param name="text" select="."/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:call-template name="break">
      <xsl:with-param name="text" select="$text"/>
    </xsl:call-template>
  </xsl:template>
  <!-- 
strip CRLF, place db linebreak -->
  <xsl:template name="break">
    <xsl:param name="text" select="."/>
    <xsl:choose>
      <xsl:when test="not(normalize-space($text))"/>
      <xsl:when test="contains($text,'&#xAC;&#x2020;')">
        <!-- don't emit whitespace -->
        <xsl:if test="normalize-space(substring-before($text,'&#xAC;&#x2020;'))">
          <xsl:value-of select="normalize-space(substring-before($text,'&#xAC;&#x2020;'))"/>
          <xsl:if test="normalize-space(substring-after($text,'&#xAC;&#x2020;'))">
            <xsl:processing-instruction name="linebreak"/>
            <xsl:call-template name="break">
              <xsl:with-param name="text" select="normalize-space(substring-after($text,'&#xAC;&#x2020;'))"/>
            </xsl:call-template>
          </xsl:if>
        </xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$text"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <!--
strip flagging -->
  <xsl:template name="stripflags">
    <xsl:param name="text" select="."/>
    <xsl:choose>
      <xsl:when test="contains($text,'[ReleaseNote]')">
        <xsl:value-of select="normalize-space(concat(substring-before($text,'[ReleaseNote]'),substring-after($text,'[ReleaseNote]')))"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="normalize-space($text)"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
