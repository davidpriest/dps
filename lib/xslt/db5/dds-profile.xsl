<?xml version="1.0"?>
<!-- davidpriest.ca -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:d="http://docbook.org/ns/docbook"
xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0" id="dds_profile" version="1.0">
  <xsl:import href="../identity.xsl"/>
  <xsl:import href="../debug.xsl"/>
  <xsl:param name="draft.mode"/>
  <xsl:param name="debug.mode"/>
  <!-- if @condition contains "inc: parentname", include it appropriately -->
  <xsl:template match="*[starts-with(normalize-space(@condition), 'inc:')]">
    <xsl:variable name="targetid">
      <xsl:value-of select="normalize-space(substring-after(normalize-space(@condition), 'inc:'))"/>
    </xsl:variable>
    <!-- include only if an ancestor matches the condition -->
    <xsl:choose>
      <xsl:when test="ancestor::*[contains($targetid, @xml:id)]/@xml:id">
        <xsl:copy>
          <xsl:copy-of select="@*|node()"/>
          <xsl:call-template name="debug">
            <xsl:with-param name="con">profiling: inclusion</xsl:with-param>
            <xsl:with-param name="rem">profiling: inclusion</xsl:with-param>
          </xsl:call-template>
        </xsl:copy>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="debug">
          <xsl:with-param name="con">profiling: exclusion</xsl:with-param>
          <xsl:with-param name="rem">profiling: exclusion</xsl:with-param>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <!-- if @condition contains "exc: parentname", exclude it appropriately -->
  <xsl:template match="*[starts-with(normalize-space(@condition), 'exc:')]">
    <xsl:variable name="targetid">
      <xsl:value-of select="normalize-space(substring-after(normalize-space(@condition), 'exc:'))"/>
    </xsl:variable>
    <!-- exclude only if an ancestor matches the condition -->
    <xsl:choose>
      <xsl:when test="ancestor::*[contains($targetid, @xml:id)]/@xml:id">
        <xsl:call-template name="debug">
          <xsl:with-param name="con">profiling: exclusion</xsl:with-param>
          <xsl:with-param name="rem">profiling: exclusion</xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:copy>
          <xsl:copy-of select="@*|node()"/>
          <xsl:call-template name="debug">
            <xsl:with-param name="con">profiling: inclusion</xsl:with-param>
            <xsl:with-param name="rem">profiling: inclusion</xsl:with-param>
          </xsl:call-template>
        </xsl:copy>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <!-- if @condition is "draft" and we're in draft mode (draft.mode), copy it through, otherwise eliminate it -->
  <xsl:template match="*[@condition='draft']">
    <xsl:if test="$draft.mode='yes'">
      <xsl:copy>
        <xsl:copy-of select="@*|node()"/>
        <xsl:call-template name="debug">
          <xsl:with-param name="con">profiling: draft</xsl:with-param>
          <xsl:with-param name="rem">profiling: draft</xsl:with-param>
        </xsl:call-template>
      </xsl:copy>
    </xsl:if>
  </xsl:template>
  <!-- always eliminate no-publish elements -->
  <xsl:template match="*[@condition='nopub']">
    <xsl:call-template name="debug">
      <xsl:with-param name="con">profiling: nopub</xsl:with-param>
      <xsl:with-param name="rem">@condition nopub</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
</xsl:stylesheet>
