<?xml version="1.0" encoding="UTF-8"?><!-- Tangle Files from Docbook-->
<xsl:stylesheet xmlns="http://www.w3.org/1999/XSL/Transform" xmlns:d="http://docbook.org/ns/docbook" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" id="dps-tangle">

  <xsl:template match="/">
    <xsl:apply-templates select="//d:section[@role='literatexml']" mode="tangleroot"/>
  </xsl:template>

  <xsl:template match="d:section" mode="tangleroot">
  <xsl:variable name="filename" select="d:title/d:filename/@path"/>
  <xsl:variable name="type" select="d:title/d:filename/@conformance"/>
  <xsl:result-document href="{$filename}" method="{$type}">
    <xsl:choose>
      <xsl:when test="$type='xml'">
        <xsl:comment>
          <xsl:text> </xsl:text>
          <xsl:value-of select="normalize-space(d:title)"/>
        </xsl:comment>
        <xsl:text>
</xsl:text>
      </xsl:when>
      <xsl:when test="$type='text'">
        <xsl:text>#</xsl:text>
        <xsl:value-of select="normalize-space(d:title)"/>
        <xsl:text> 
</xsl:text>
      </xsl:when>
    </xsl:choose>
    <xsl:apply-templates select="//d:programlisting" mode="tangle"/>
    <xsl:text>
</xsl:text>
  </xsl:result-document>
</xsl:template>

  <xsl:template match="d:programlisting" mode="tangle">
  <xsl:apply-templates select="node()" mode="tangle"/>
</xsl:template>
  
  <xsl:template match="d:section" mode="tangle">
  <xsl:text>#section mode:tangle
</xsl:text>
  <xsl:variable name="type" select="d:title/d:filename/@conformance"/>
  <xsl:choose>
    <xsl:when test="$type='xml'">
      <xsl:comment>
        <xsl:text> </xsl:text>
        <xsl:value-of select="normalize-space(d:title)"/>
        <xsl:text> 
</xsl:text>
      </xsl:comment>
      <xsl:text>
</xsl:text>
    </xsl:when>
    <xsl:when test="$type='text'">
      <xsl:text>#section?? mode:tangle</xsl:text>
      <xsl:text>#z</xsl:text>
      <xsl:value-of select="normalize-space(d:title)"/>
      <xsl:text> 
</xsl:text>
    </xsl:when>
  </xsl:choose>
  <xsl:apply-templates select="//d:programlisting" mode="tangle"/>
</xsl:template>
<xsl:template match="d:link" mode="tangle">
  <xsl:variable name="ref" select="@linkend"/>
  <xsl:apply-templates select="//d:*[@xml:id=$ref]" mode="tangle"/>
</xsl:template>
<xsl:template match="*" mode="tangle">
  <xsl:message>Unrecognized element: <xsl:value-of select="name()"/></xsl:message>
</xsl:template>
<xsl:template match="text()" mode="tangle">
  <xsl:value-of disable-output-escaping="yes">
    <xsl:analyze-string select="." regex="&lt;(.*?)&gt;">
      <xsl:matching-substring><![CDATA[<]]><xsl:value-of select="regex-group(1)"/><![CDATA[>]]></xsl:matching-substring>
      <xsl:non-matching-substring>
        <xsl:value-of select="."/>
      </xsl:non-matching-substring>
    </xsl:analyze-string>
  </xsl:value-of>
</xsl:template>
</xsl:stylesheet><xsl:template match="d:section" mode="tangleroot">
  <xsl:variable name="filename" select="d:title/d:filename/@path"/>
  <xsl:variable name="type" select="d:title/d:filename/@conformance"/>
  <xsl:result-document href="{$filename}" method="{$type}">
    <xsl:choose>
      <xsl:when test="$type='xml'">
        <xsl:comment>
          <xsl:text> </xsl:text>
          <xsl:value-of select="normalize-space(d:title)"/>
        </xsl:comment>
        <xsl:text>
</xsl:text>
      </xsl:when>
      <xsl:when test="$type='text'">
        <xsl:text>#</xsl:text>
        <xsl:value-of select="normalize-space(d:title)"/>
        <xsl:text> 
</xsl:text>
      </xsl:when>
    </xsl:choose>
    <xsl:apply-templates select="//d:programlisting" mode="tangle"/>
    <xsl:text>
</xsl:text>
  </xsl:result-document>
</xsl:template>
<xsl:template match="d:programlisting" mode="tangle">
  <xsl:apply-templates select="node()" mode="tangle"/>
</xsl:template>
<xsl:template match="d:section" mode="tangle">
  <xsl:text>#section mode:tangle
</xsl:text>
  <xsl:variable name="type" select="d:title/d:filename/@conformance"/>
  <xsl:choose>
    <xsl:when test="$type='xml'">
      <xsl:comment>
        <xsl:text> </xsl:text>
        <xsl:value-of select="normalize-space(d:title)"/>
        <xsl:text> 
</xsl:text>
      </xsl:comment>
      <xsl:text>
</xsl:text>
    </xsl:when>
    <xsl:when test="$type='text'">
      <xsl:text>#section?? mode:tangle</xsl:text>
      <xsl:text>#z</xsl:text>
      <xsl:value-of select="normalize-space(d:title)"/>
      <xsl:text> 
</xsl:text>
    </xsl:when>
  </xsl:choose>
  <xsl:apply-templates select="//d:programlisting" mode="tangle"/>
</xsl:template>
<xsl:template match="d:link" mode="tangle">
  <xsl:variable name="ref" select="@linkend"/>
  <xsl:apply-templates select="//d:*[@xml:id=$ref]" mode="tangle"/>
</xsl:template>
<xsl:template match="*" mode="tangle">
  <xsl:message>Unrecognized element: <xsl:value-of select="name()"/></xsl:message>
</xsl:template>
<xsl:template match="text()" mode="tangle">
  <xsl:value-of disable-output-escaping="yes">
    <xsl:analyze-string select="." regex="&lt;(.*?)&gt;">
      <xsl:matching-substring><![CDATA[<]]><xsl:value-of select="regex-group(1)"/><![CDATA[>]]></xsl:matching-substring>
      <xsl:non-matching-substring>
        <xsl:value-of select="."/>
      </xsl:non-matching-substring>
    </xsl:analyze-string>
  </xsl:value-of>
</xsl:template><!-- Tangle Files from Docbook -->
<xsl:stylesheet xmlns="http://www.w3.org/1999/XSL/Transform" xmlns:d="http://docbook.org/ns/docbook" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/">
    <xsl:apply-templates select="//d:section[@role='literatexml']" mode="tangleroot"/>
  </xsl:template>
  <!-- Tangle Literate Sections as Files -->
<xsl:template match="d:section" mode="tangleroot">
  <xsl:variable name="filename" select="d:title/d:filename/@path"/>
  <xsl:variable name="type" select="d:title/d:filename/@conformance"/>
  <xsl:result-document href="{$filename}" method="{$type}">
    <xsl:choose>
      <xsl:when test="$type='xml'">
        <xsl:comment>
          <xsl:text> </xsl:text>
          <xsl:value-of select="normalize-space(d:title)"/>
        </xsl:comment>
        <xsl:text>
</xsl:text>
      </xsl:when>
      <xsl:when test="$type='text'">
        <xsl:text>#</xsl:text>
        <xsl:value-of select="normalize-space(d:title)"/>
        <xsl:text> 
</xsl:text>
      </xsl:when>
    </xsl:choose>
    <xsl:apply-templates select="//d:programlisting" mode="tangle"/>
    <xsl:text>
</xsl:text>
  </xsl:result-document>
</xsl:template>
  <!-- Tangle the program listing -->
  <xsl:template match="d:programlisting" mode="tangle">
    <xsl:apply-templates select="node()" mode="tangle"/>
  </xsl:template>
  <!-- Tangle Source fragments -->
<xsl:template match="d:section" mode="tangle">
  <xsl:text>#section mode:tangle
</xsl:text>
  <xsl:variable name="type" select="d:title/d:filename/@conformance"/>
  <xsl:choose>
    <xsl:when test="$type='xml'">
      <xsl:comment>
        <xsl:text> </xsl:text>
        <xsl:value-of select="normalize-space(d:title)"/>
        <xsl:text> 
</xsl:text>
      </xsl:comment>
      <xsl:text>
</xsl:text>
    </xsl:when>
    <xsl:when test="$type='text'">
      <xsl:text>#section?? mode:tangle</xsl:text>
      <xsl:text>#z</xsl:text>
      <xsl:value-of select="normalize-space(d:title)"/>
      <xsl:text> 
</xsl:text>
    </xsl:when>
  </xsl:choose>
  <xsl:apply-templates select="//d:programlisting" mode="tangle"/>
</xsl:template>
  <xsl:template match="d:link" mode="tangle">
    <xsl:variable name="ref" select="@linkend"/>
    <xsl:apply-templates select="//d:*[@xml:id=$ref]" mode="tangle"/>
  </xsl:template>
  <xsl:template match="*" mode="tangle">
    <xsl:message>Unrecognized element: <xsl:value-of select="name()"/></xsl:message>
  </xsl:template>
  <xsl:template match="text()" mode="tangle">
    <xsl:value-of disable-output-escaping="yes">
      <xsl:analyze-string select="." regex="&lt;(.*?)&gt;">
        <xsl:matching-substring><![CDATA[<]]><xsl:value-of select="regex-group(1)"/><![CDATA[>]]></xsl:matching-substring>
        <xsl:non-matching-substring>
          <xsl:value-of select="."/>
        </xsl:non-matching-substring>
      </xsl:analyze-string>
    </xsl:value-of>
  </xsl:template>
</xsl:stylesheet>

