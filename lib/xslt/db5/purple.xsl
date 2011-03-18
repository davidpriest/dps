<?xml version="1.0"?>
<!-- davidpriest.ca -->
<xsl:stylesheet xmlns="http://docbook.org/ns/docbook" xmlns:xlink="http://docbook.org/xlink/role/olink" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:d="http://docbook.org/ns/docbook" xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0" id="db5_purple" version="1.0">
  <xsl:import href="../identity.xsl"/>
  <xsl:import href="../debug.xsl"/>
  <xsl:param name="draft.mode"/>
  <xsl:param name="debug.mode"/>
  <xsl:param name="repo.id"/>
  <!-- inject purple numbers (repo revision plus element number) -->
  <xsl:template match="/*/d:info/d:abstract/*[position()=last()]">
    <xsl:apply-templates select="*"/>
    <xsl:copy-of select="document('purple.xml')//*[@xml:id='draftnote']"/>
  </xsl:template>
  <xsl:template match="d:para|d:mediaobject|d:seg[position()=last()]">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:if test="not(ancestor-or-self::d:footnote|ancestor-or-self::d:info|ancestor-or-self::d:sidebar)">
        <xsl:attribute name="role">purpled <xsl:value-of select="@role"/></xsl:attribute>
        <xsl:variable name="elementnum">
          <xsl:number count="d:*" level="any"/>
        </xsl:variable>
        <!-- inject sidebar before contents -->
        <sidebar role="purple">
          <simplelist type="vert" role="purple">
            <member><xsl:value-of select="$repo.id"/>@<xsl:value-of select="$elementnum"/></member>
            <xsl:if test="ancestor-or-self::*[@conformance]">
              <member>CON:<xsl:value-of select="ancestor-or-self::*[@conformance]/@conformance"/></member>
            </xsl:if>
            <xsl:if test="ancestor-or-self::*[@revision]">
              <member>REV:<xsl:value-of select="ancestor-or-self::*[@revision]/@revision"/></member>
            </xsl:if>
            <xsl:if test="ancestor-or-self::*[@vendor]">
              <member>VND:<xsl:value-of select="ancestor-or-self::*[@vendor]/@vendor"/></member>
            </xsl:if>
            <xsl:if test="ancestor-or-self::*[@audience]">
              <member>AUD:<xsl:value-of select="ancestor-or-self::*[@audience]/@audience"/></member>
            </xsl:if>
          </simplelist>
        </sidebar>
      </xsl:if>
      <!-- inject contents -->
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>
