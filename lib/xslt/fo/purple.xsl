<?xml version="1.0"?>
<!-- davidpriest.ca dds -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:html="http://www.w3.org/1999/xhtml" xmlns:fo="http://www.w3.org/1999/XSL/Format"
xmlns:d="http://docbook.org/ns/docbook" xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0"
xmlns:svg="http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd" id="fo_common_purple" version="1.0">
  <xsl:param name="sidebar.float.type">right</xsl:param>
  <xsl:param name="purple.sidebar.float.width">1.1in</xsl:param>
  <!-- stolen from deltaxml-fo -->
  <!-- added text styling params -->
  <xsl:param name="added.color">black</xsl:param>
  <xsl:param name="added.background">#FDFFE6</xsl:param>
  <xsl:param name="added.decoration">underline</xsl:param>
  <xsl:param name="added.style">italic</xsl:param>
  <!-- deleted text styling params -->
  <xsl:param name="deleted.color">black</xsl:param>
  <xsl:param name="deleted.background">#EEE4E8</xsl:param>
  <xsl:param name="deleted.decoration">line-through</xsl:param>
  <xsl:param name="deleted.style">normal</xsl:param>
  <!-- changed text styling params -->
  <xsl:param name="changed.color">black</xsl:param>
  <xsl:param name="changed.background">#E7FAFE</xsl:param>
  <xsl:param name="changed.decoration">none</xsl:param>
  <xsl:param name="changed.style">normal</xsl:param>
  <!-- -->
  <xsl:attribute-set name="purple.sidebar.properties">
    <xsl:attribute name="color">#660099</xsl:attribute>
    <xsl:attribute name="font-family">monospace</xsl:attribute>
    <xsl:attribute name="font-size">xx-small</xsl:attribute>
    <xsl:attribute name="text-align">right</xsl:attribute>
    <xsl:attribute name="background-color">
      <xsl:choose>
        <xsl:when test="not(parent::d:seg) and ancestor-or-self::*[@revisionflag='added']">
          <xsl:value-of select="$added.background"/>
        </xsl:when>
        <xsl:when test="parent::d:seg[@revisionflag='added'] or parent::d:seg/preceding-sibling::d:seg[@revisionflag='added'] or parent::d:seg/parent::d:seglistitem[@revisionflag='added']">
          <xsl:value-of select="$added.background"/>
        </xsl:when>
        <xsl:when test="not(parent::d:seg) and ancestor-or-self::*[@revisionflag='deleted']">
          <xsl:value-of select="$deleted.background"/>
        </xsl:when>
        <xsl:when test="parent::d:seg[@revisionflag='deleted'] or parent::d:seg/preceding-sibling::d:seg[@revisionflag='deleted'] or parent::d:seg/parent::d:seglistitem[@revisionflag='deleted']">
          <xsl:value-of select="$deleted.background"/>
        </xsl:when>
        <xsl:when test="not(parent::d:seg) and ancestor-or-self::*[@revisionflag='changed']">
          <xsl:value-of select="$changed.background"/>
        </xsl:when>
        <xsl:when test="parent::d:seg[@revisionflag='changed'] or parent::d:seg/preceding-sibling::d:seg[@revisionflag='changed'] or parent::d:seg/parent::d:seglistitem[@revisionflag='changed']">
          <xsl:value-of select="$changed.background"/>
        </xsl:when>
        <xsl:otherwise>transparent</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
    <xsl:attribute name="text-decoration">
      <xsl:choose>
        <xsl:when test="not(parent::d:seg) and ancestor-or-self::*[@revisionflag='added']">
          <xsl:value-of select="$added.decoration"/>
        </xsl:when>
        <xsl:when test="parent::d:seg[@revisionflag='added'] or parent::d:seg/preceding-sibling::d:seg[@revisionflag='added'] or parent::d:seg/parent::d:seglistitem[@revisionflag='added']">
          <xsl:value-of select="$added.decoration"/>
        </xsl:when>
        <xsl:when test="not(parent::d:seg) and ancestor-or-self::*[@revisionflag='deleted']">
          <xsl:value-of select="$deleted.decoration"/>
        </xsl:when>
        <xsl:when test="parent::d:seg[@revisionflag='deleted'] or parent::d:seg/preceding-sibling::d:seg[@revisionflag='deleted'] or parent::d:seg/parent::d:seglistitem[@revisionflag='deleted']">
          <xsl:value-of select="$deleted.decoration"/>
        </xsl:when>
        <xsl:when test="not(parent::d:seg) and ancestor-or-self::*[@revisionflag='changed']">
          <xsl:value-of select="$changed.decoration"/>
        </xsl:when>
        <xsl:when test="parent::d:seg[@revisionflag='changed'] or parent::d:seg/preceding-sibling::d:seg[@revisionflag='changed'] or parent::d:seg/parent::d:seglistitem[@revisionflag='changed']">
          <xsl:value-of select="$changed.decoration"/>
        </xsl:when>
        <xsl:otherwise>inherit</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
    <xsl:attribute name="font-style">
      <xsl:choose>
        <xsl:when test="not(parent::d:seg) and ancestor-or-self::*[@revisionflag='added']">
          <xsl:value-of select="$added.style"/>
        </xsl:when>
        <xsl:when test="parent::d:seg[@revisionflag='added'] or parent::d:seg/preceding-sibling::d:seg[@revisionflag='added'] or parent::d:seg/parent::d:seglistitem[@revisionflag='added']">
          <xsl:value-of select="$added.style"/>
        </xsl:when>
        <xsl:when test="not(parent::d:seg) and ancestor-or-self::*[@revisionflag='deleted']">
          <xsl:value-of select="$deleted.style"/>
        </xsl:when>
        <xsl:when test="parent::d:seg[@revisionflag='deleted'] or parent::d:seg/preceding-sibling::d:seg[@revisionflag='deleted'] or parent::d:seg/parent::d:seglistitem[@revisionflag='deleted']">
          <xsl:value-of select="$deleted.style"/>
        </xsl:when>
        <xsl:when test="not(parent::d:seg) and ancestor-or-self::*[@revisionflag='changed']">
          <xsl:value-of select="$changed.style"/>
        </xsl:when>
        <xsl:when test="parent::d:seg[@revisionflag='changed'] or parent::d:seg/preceding-sibling::d:seg[@revisionflag='changed'] or parent::d:seg/parent::d:seglistitem[@revisionflag='changed']">
          <xsl:value-of select="$changed.style"/>
        </xsl:when>
        <xsl:otherwise>inherit</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
  </xsl:attribute-set>
  <!-- tiny purple numbers -->
  <xsl:template match="d:sidebar[@role='purple']" name="sidebar">
    <!-- Also does margin notes -->
    <xsl:variable name="pi-type">
      <xsl:call-template name="pi.dbfo_float-type"/>
    </xsl:variable>
    <xsl:variable name="id">
      <xsl:call-template name="object.id"/>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$pi-type = 'margin.note'">
        <xsl:call-template name="margin.note"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="content">
          <fo:block xsl:use-attribute-sets="purple.sidebar.properties" id="{$id}">
            <xsl:call-template name="sidebar.titlepage"/>
            <xsl:apply-templates select="node()[not(self::title) and not(self::info) and not(self::sidebarinfo)]"/>
          </fo:block>
        </xsl:variable>
        <xsl:variable name="pi-width">
          <xsl:call-template name="pi.dbfo_sidebar-width"/>
        </xsl:variable>
        <xsl:variable name="position">
          <xsl:choose>
            <xsl:when test="$pi-type != ''">
              <xsl:value-of select="$pi-type"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$sidebar.float.type"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <xsl:call-template name="floater">
          <xsl:with-param name="content" select="$content"/>
          <xsl:with-param name="position" select="$position"/>
          <xsl:with-param name="width">
            <xsl:choose>
              <xsl:when test="$pi-width != ''">
                <xsl:value-of select="$pi-width"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="$purple.sidebar.float.width"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:with-param>
          <xsl:with-param name="start.indent">
            <xsl:choose>
              <xsl:when test="$position = 'start' or $position = 'left'">0pt</xsl:when>
              <xsl:when test="$position = 'end' or $position = 'right'">0.5em</xsl:when>
              <xsl:otherwise>0pt</xsl:otherwise>
            </xsl:choose>
          </xsl:with-param>
          <xsl:with-param name="end.indent">
            <xsl:choose>
              <xsl:when test="$position = 'start' or $position = 'left'">0.5em</xsl:when>
              <xsl:when test="$position = 'end' or $position = 'right'">0pt</xsl:when>
              <xsl:otherwise>0pt</xsl:otherwise>
            </xsl:choose>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
