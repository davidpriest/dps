<?xml version="1.0"?>
<!-- davidpriest.ca dps -->
<xsl:stylesheet xmlns:t="http://docbook.org/xslt/ns/template" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:html="http://www.w3.org/1999/xhtml" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:d="http://docbook.org/ns/docbook" xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0" xmlns:svg="http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd" id="fo.purple" version="2.0">
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
  <xsl:attribute-set name="purple.wrap.properties">
    <xsl:attribute name="margin-bottom">2pt</xsl:attribute>
    <xsl:attribute name="clear">both</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="purple.sidebar.properties">
    <xsl:attribute name="color">#660099</xsl:attribute>
    <xsl:attribute name="font-family">monospace</xsl:attribute>
    <xsl:attribute name="font-size">xx-small</xsl:attribute>
    <xsl:attribute name="text-align">right</xsl:attribute>
    <xsl:attribute name="width">10pt</xsl:attribute>
    <xsl:attribute name="height">inherit</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="purple.block.properties">
    <xsl:attribute name="float">left</xsl:attribute>
    <xsl:attribute name="clear">left</xsl:attribute>
    <xsl:attribute name="border-right">thin solid #660099</xsl:attribute>
    <xsl:attribute name="margin-right">10pt</xsl:attribute>
    <xsl:attribute name="padding-right">4pt</xsl:attribute>
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
  <xsl:template match="d:para|d:mediaobject|d:seg[position()=last()]">
    <xsl:choose>
      <xsl:when test="$draft.mode='yes'">
        <fo:block xsl:use-attribute-sets="purple.wrap.properties">
          <xsl:if test="not(ancestor-or-self::d:footnote|ancestor-or-self::d:info|ancestor-or-self::d:sidebar)">
            <xsl:variable name="elementnum">
              <xsl:number count="d:*" level="any"/>
            </xsl:variable>
            <!-- inject sidebar before contents -->
            <fo:float float="right" clear="right">
              <fo:block-container xsl:use-attribute-sets="purple.sidebar.properties">
                <fo:block>
                  <xsl:value-of select="$elementnum"/>
                </fo:block>
                <xsl:if test="ancestor-or-self::*[@conformance]">
                  <fo:block>CON:<xsl:value-of select="ancestor-or-self::*[@conformance]/@conformance"/></fo:block>
                </xsl:if>
                <xsl:if test="ancestor-or-self::*[@revision]">
                  <fo:block>REV:<xsl:value-of select="ancestor-or-self::*[@revision]/@revision"/></fo:block>
                </xsl:if>
                <xsl:if test="ancestor-or-self::*[@vendor]">
                  <fo:block>VND:<xsl:value-of select="ancestor-or-self::*[@vendor]/@vendor"/></fo:block>
                </xsl:if>
                <xsl:if test="ancestor-or-self::*[@audience]">
                  <fo:block>AUD:<xsl:value-of select="ancestor-or-self::*[@audience]/@audience"/></fo:block>
                </xsl:if>
              </fo:block-container>
            </fo:float>
          </xsl:if>
          <!-- inject contents -->
          <fo:float>
            <fo:block-container xsl:use-attribute-sets="purple.block.properties">
              <xsl:apply-imports/>
            </fo:block-container>
          </fo:float>
        </fo:block>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-imports/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
