<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [
<!ENTITY nbsp "&#160;">
]>
<!-- davidpriest.ca -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:d="http://docbook.org/ns/docbook" version="1.0">
  <!--
  Convert Rally "Object" lists to Docbook 5 lists.
  Note: Stories are not associated with packages; all others are.
  -->
  <xsl:key name="key_bypkg" match="Package" use="."/>
  <xsl:template match="/Results">
    <d:section version="5.0">
      <d:info>
        <d:title>
          <xsl:value-of select="@name"/>
        </d:title>
        <d:releaseinfo>
          <d:phrase xml:id="releasenoterelease">
            <xsl:value-of select="Object/ReleaseNoteRelease"/>
          </d:phrase>
        </d:releaseinfo>
      </d:info>
      <xsl:choose>
        <xsl:when test="//Object[@type='HierarchicalRequirement']">
          <d:itemizedlist>
            <xsl:apply-templates select="//Object">
              <xsl:sort select="CreationDate"/>
            </xsl:apply-templates>
          </d:itemizedlist>
        </xsl:when>
        <xsl:when test="//Object[@type='Defect']">
          <d:variablelist>
            <xsl:for-each select="//Package[generate-id(.)=generate-id(key('key_bypkg',.)[1])]">
              <xsl:sort select="."/>
              <xsl:variable name="pkgname" select="."/>
              <xsl:if test="//Object[child::Package/text() = $pkgname]/Notes/text()">
                <d:varlistentry>
                  <d:term role="Rally.Package">
                    <xsl:value-of select="$pkgname"/>
                  </d:term>
                  <d:listitem>
                    <d:itemizedlist>
                      <xsl:apply-templates select="//Object[child::Package/text() = $pkgname]">
                        <xsl:sort select="CreationDate"/>
                      </xsl:apply-templates>
                    </d:itemizedlist>
                  </d:listitem>
                </d:varlistentry>
              </xsl:if>
            </xsl:for-each>
          </d:variablelist>
        </xsl:when>
        <xsl:otherwise>
          <d:para>None noted for this release.</d:para>
        </xsl:otherwise>
      </xsl:choose>
    </d:section>
  </xsl:template>
  <!--
  Each note is an Object -->
  <xsl:template match="Object">
    <xsl:if test="Notes/text()">
      <d:listitem>
        <d:para>
          <xsl:if test="State/text() = 'Closed'">
            <xsl:text>Fixed: </xsl:text>
          </xsl:if>
          <xsl:call-template name="stripHtml">
            <xsl:with-param name="text" select="Notes/text()"/>
          </xsl:call-template>
          <xsl:if test="@type!='HierarchicalRequirement'">
            <d:phrase role="rally.id"> [<xsl:value-of select="FormattedID"/>]</d:phrase>
          </xsl:if>
        </d:para>
      </d:listitem>
    </xsl:if>
  </xsl:template>
  <!--
    remove embedded html -->
  <xsl:template name="stripHtml">
    <xsl:param name="text"/>
    <xsl:call-template name="stripUnknownHtml">
      <!-- replace non-breaking spaces &c -->
      <xsl:with-param name="text" select="replace($text,'&amp;nbsp;',' ')"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template name="stripUnknownHtml">
    <xsl:param name="text"/>
    <xsl:choose>
      <xsl:when test="contains($text,'&lt;')">
        <xsl:value-of select="substring-before($text, '&lt;')"/>
        <xsl:call-template name="stripHtml">
          <xsl:with-param name="text" select="substring-before($text, '&gt;')"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$text"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <!--
  Ignore everything else -->
  <xsl:template match="*"/>
</xsl:stylesheet>
