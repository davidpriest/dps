<?xml version="1.0"?>
<!-- davidpriest.ca -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:fo="http://www.w3.org/1999/XSL/Format"
xmlns:d="http://docbook.org/ns/docbook"
xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0" version="1.0">
  <xsl:attribute-set name="draft.info.properties">
    <xsl:attribute name="background-color">lightyellow</xsl:attribute>
    <xsl:attribute name="border">0.5pt solid grey</xsl:attribute>
    <xsl:attribute name="margin">0.1in 0in .1in 0in</xsl:attribute>
    <xsl:attribute name="padding">1em</xsl:attribute>
    <xsl:attribute name="font-weight">normal</xsl:attribute>
    <xsl:attribute name="font-size">smaller</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="legalese.properties">
    <!-- not sure if keep-together will override kt.within-page -->
    <xsl:attribute name="keep-together">auto</xsl:attribute>
    <xsl:attribute name="keep-together.within-column">auto</xsl:attribute>
    <xsl:attribute name="font-size">7.25pt</xsl:attribute>
    <xsl:attribute name="line-height">1.0</xsl:attribute>
  </xsl:attribute-set>
  <!--
  Article sections do not show release info -->
  <xsl:template match="d:releaseinfo[ancestor::d:article]" mode="titlepage.mode"/>
  <!-- 
  Revision history is shown only when in draft mode -->
  <xsl:template match="d:revhistory" mode="titlepage.mode">
    <xsl:if test="$draft.mode='yes'">
      <fo:block xsl:use-attribute-sets="draft.info.properties">
        <fo:table table-layout="fixed" xsl:use-attribute-sets="revhistory.table.properties">
          <xsl:call-template name="anchor"/>
          <fo:table-column column-number="1" column-width="proportional-column-width(1)"/>
          <fo:table-column column-number="2" column-width="proportional-column-width(1)"/>
          <fo:table-column column-number="3" column-width="proportional-column-width(1)"/>
          <fo:table-column column-number="4" column-width="proportional-column-width(3)"/>
          <fo:table-body start-indent="0pt" end-indent="0pt">
            <fo:table-row>
              <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="revhistory.table.cell.properties">
                <fo:block xsl:use-attribute-sets="revhistory.title.properties">
                  <xsl:call-template name="gentext">
                    <xsl:with-param name="key" select="'RevHistory'"/>
                  </xsl:call-template>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <xsl:apply-templates/>
          </fo:table-body>
        </fo:table>
      </fo:block>
    </xsl:if>
  </xsl:template>
  <xsl:template match="d:revhistory/d:revision">
    <xsl:variable name="revnumber" select="d:revnumber"/>
    <xsl:variable name="revdate" select="d:date"/>
    <xsl:variable name="revauthor" select="d:authorinitials|d:author"/>
    <xsl:variable name="revremark" select="d:revremark|d:revdescription"/>
    <fo:table-row>
      <fo:table-cell xsl:use-attribute-sets="revhistory.table.cell.properties">
        <fo:block>
          <xsl:apply-templates select="$revdate[1]"/>
        </fo:block>
      </fo:table-cell>
      <fo:table-cell xsl:use-attribute-sets="revhistory.table.cell.properties">
        <fo:block>
          <xsl:for-each select="$revauthor">
            <xsl:apply-templates select="."/>
            <xsl:if test="position() != last()">
              <xsl:text>, </xsl:text>
            </xsl:if>
          </xsl:for-each>
        </fo:block>
      </fo:table-cell>
      <fo:table-cell xsl:use-attribute-sets="revhistory.table.cell.properties">
        <fo:block>
          <xsl:call-template name="anchor"/>
          <xsl:if test="$revnumber">
            <xsl:call-template name="gentext">
              <xsl:with-param name="key" select="'Revision'"/>
            </xsl:call-template>
            <xsl:call-template name="gentext.space"/>
            <xsl:apply-templates select="$revnumber[1]"/>
          </xsl:if>
        </fo:block>
      </fo:table-cell>
      <xsl:if test="$revremark">
        <fo:table-cell xsl:use-attribute-sets="revhistory.table.cell.properties">
          <fo:block>
            <xsl:apply-templates select="$revremark[1]"/>
          </fo:block>
        </fo:table-cell>
      </xsl:if>
    </fo:table-row>
  </xsl:template>
  <xsl:template name="book.titlepage.recto">
    <fo:block>
      <fo:table inline-progression-dimension="100%" table-layout="fixed">
        <fo:table-column column-width="50%"/>
        <fo:table-column column-width="50%"/>
        <fo:table-body>
          <fo:table-row>
            <fo:table-cell number-columns-spanned="2">
              <fo:block text-align="center">
                <xsl:choose>
                  <xsl:when test="d:info/d:title">
                    <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:title"/>
                  </xsl:when>
                  <xsl:when test="d:title">
                    <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:title"/>
                  </xsl:when>
                  <xsl:when test="d:info/d:subtitle">
                    <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:subtitle"/>
                  </xsl:when>
                </xsl:choose>
              </fo:block>
            </fo:table-cell>
          </fo:table-row>
          <!-- in draft mode, there may be a "cover" element containing known bugs &c -->
          <xsl:if test="$draft.mode='yes'">
            <fo:table-row>
              <fo:table-cell number-columns-spanned="2">
                <fo:block xsl:use-attribute-sets="draft.info.properties legalese.properties">
                  <xsl:apply-templates mode="book.titlepage.recto.mode" select="d:info/d:cover/*"/>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
          </xsl:if>
        </fo:table-body>
      </fo:table>
    </fo:block>
  </xsl:template>
</xsl:stylesheet>
