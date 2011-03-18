<?xml version="1.0"?>
<!-- davidpriest.ca -->
<!-- 
      con is printed IFF $debug.mode="true"
      rem is output IFF $debug.mode="true" AND $draft.mode="yes"
      example:
        <xsl:call-template name="debug">
            <xsl:with-param name="con">Message as Console output.</xsl:with-param>
            <xsl:with-param name="rem">Message as Docbook remark element.</xsl:with-param>
        </xsl:call-template>
            
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:d="http://docbook.org/ns/docbook" version="1.0" id="dds-debug">
   <xsl:template name="debug">
      <xsl:param name="con" select="''"/>
      <xsl:param name="rem" select="''"/>
      <xsl:if test="$debug.mode='true'">
         <xsl:if test="$con">
            <xsl:message><xsl:copy-of select="$con"/><xsl:text> [ </xsl:text><xsl:value-of select="name(.)"/><xsl:for-each select="@*"><xsl:text> </xsl:text>@<xsl:value-of select="name(.)"/>="<xsl:value-of select="."/>" </xsl:for-each>]</xsl:message>
         </xsl:if>
         <xsl:if test="$draft.mode='yes'">
            <d:remark role="debug"><xsl:copy-of select="$rem"/><xsl:text> [ </xsl:text><xsl:value-of select="name(.)"/><xsl:for-each select="@*"><xsl:text> </xsl:text>@<xsl:value-of select="name(.)"/>="<xsl:value-of select="."/>" </xsl:for-each>]</d:remark>
         </xsl:if>
      </xsl:if>
   </xsl:template>
</xsl:stylesheet>
