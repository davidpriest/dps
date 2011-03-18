<?xml version="1.0"?>
<!-- davidpriest.ca
NOTE: If tidied, restructure fo:char blocks to remove whitespace 
-->
<!-- FROM docbook-ns-xsl Entity used in html/inline.xsl and fo/inline.xsl (needed for remarks, below) -->
<!DOCTYPE xsl:stylesheet [
<!ENTITY comment.block.parents "parent::d:answer|parent::d:appendix|parent::d:article|parent::d:bibliodiv|
                                parent::d:bibliography|parent::d:blockquote|parent::d:caution|parent::d:chapter|
                                parent::d:glossary|parent::d:glossdiv|parent::d:important|parent::d:index|
                                parent::d:indexdiv|parent::d:listitem|parent::d:note|parent::d:orderedlist|
                                parent::d:partintro|parent::d:preface|parent::d:procedure|parent::d:qandadiv|
                                parent::d:qandaset|parent::d:question|parent::d:refentry|parent::d:refnamediv|
                                parent::d:refsect1|parent::d:refsect2|parent::d:refsect3|parent::d:refsection|
                                parent::d:refsynopsisdiv|parent::d:sect1|parent::d:sect2|parent::d:sect3|parent::d:sect4|
                                parent::d:sect5|parent::d:section|parent::d:setindex|parent::d:sidebar|
                                parent::d:simplesect|parent::d:taskprerequisites|parent::d:taskrelated|
                                parent::d:tasksummary|parent::d:warning">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:d="http://docbook.org/ns/docbook" xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0" version="1.0">
  <xsl:attribute-set name="comment.properties">
    <xsl:attribute name="background-color">yellow</xsl:attribute>
    <xsl:attribute name="font-family">sans-serif</xsl:attribute>
    <xsl:attribute name="font-weight">normal</xsl:attribute>
    <xsl:attribute name="font-size">x-small</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="draft.application.properties">
    <xsl:attribute name="border-bottom">thin dotted grey</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="publish.productname.properties">
    <xsl:attribute name="font-style">normal</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="draft.productname.properties">
    <xsl:attribute name="border-bottom">thin dotted grey</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="draft.orgname.properties">
    <xsl:attribute name="border-bottom">thin dotted grey</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="draft.personname.properties">
    <xsl:attribute name="border-bottom">thin dotted grey</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="draft.glossterm.properties">
    <xsl:attribute name="border-bottom">thin dotted grey</xsl:attribute>
  </xsl:attribute-set>
<<<<<<< local


=======
>>>>>>> other
  <!-- COMMENTS/REMARKS: colourize -->
  <xsl:template match="d:comment[&comment.block.parents;]|d:remark[&comment.block.parents;]">
    <xsl:if test="$draft.mode='yes'">
      <fo:block xsl:use-attribute-sets="comment.properties">
        <xsl:apply-templates/>
      </fo:block>
    </xsl:if>
  </xsl:template>
  <xsl:template match="d:comment|d:remark">
    <xsl:if test="$draft.mode='yes'">
      <fo:inline xsl:use-attribute-sets="comment.properties">
        <xsl:apply-templates/>
      </fo:inline>
    </xsl:if>
  </xsl:template>
  <!-- MENUS: italicize  -->
  <xsl:template match="d:guimenu|d:guimenuitem|d:guisubmenu">
    <fo:inline xsl:use-attribute-sets="gui.font">
      <xsl:call-template name="inline.charseq"/>
    </fo:inline>
  </xsl:template>
  <!-- APPLICATIONS: special treatment in draft mode -->
  <xsl:template match="d:application">
    <xsl:choose>
      <xsl:when test="$draft.mode='yes'">
        <fo:inline xsl:use-attribute-sets="draft.application.properties">
          <xsl:call-template name="inline.charseq"/>
        </fo:inline>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="inline.charseq"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <!-- PRODUCTNAME: special treatment in draft mode -->
  <xsl:template match="d:productname">
    <xsl:choose>
      <xsl:when test="$draft.mode='yes'">
        <fo:inline xsl:use-attribute-sets="draft.productname.properties">
          <xsl:call-template name="inline.charseq"/>
        </fo:inline>
      </xsl:when>
      <xsl:otherwise>
        <fo:inline xsl:use-attribute-sets="publish.productname.properties">
          <xsl:call-template name="inline.charseq"/>
        </fo:inline>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <!-- ORGNAME: special treatment in draft mode -->
  <xsl:template match="d:orgname">
    <xsl:choose>
      <xsl:when test="$draft.mode='yes'">
        <fo:inline xsl:use-attribute-sets="draft.orgname.properties">
          <xsl:call-template name="inline.charseq"/>
        </fo:inline>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="inline.charseq"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <!-- ACRONYM: special treatment in draft mode -->
  <xsl:template match="d:acronym|d:glossterm">
    <xsl:choose>
      <xsl:when test="$draft.mode='yes'">
        <fo:inline xsl:use-attribute-sets="draft.glossterm.properties">
          <xsl:call-template name="inline.charseq"/>
        </fo:inline>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="inline.charseq"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <!-- PERSONNAME: special treatment in draft mode -->
  <xsl:template match="d:personname">
    <xsl:choose>
      <xsl:when test="$draft.mode='yes'">
        <fo:inline xsl:use-attribute-sets="draft.personname.properties">
          <xsl:call-template name="inline.charseq"/>
        </fo:inline>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="inline.charseq"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <!-- GUILABEL: double French quote-marks in draft mode -->
  <xsl:template match="d:guilabel">
    <xsl:choose>
      <xsl:when test="$draft.mode='yes'">
        <fo:inline>
          <fo:character character="&#xAB;" padding-right="1.5pt"/><xsl:call-template name="inline.charseq"/><fo:character character="&#xBB;" padding-left="1.5pt"/>
        </fo:inline>
      </xsl:when>
      <xsl:otherwise>
        <fo:inline font-weight="bold">
          <xsl:call-template name="inline.charseq"/>
        </fo:inline>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <!-- GUIBUTTON: in draft mode, box it like a button -->
  <xsl:template match="d:guibutton">
    <xsl:choose>
      <xsl:when test="$draft.mode='yes'">
        <fo:inline border="thin outset grey" padding="1.5pt" padding-bottom="0pt"><xsl:call-template name="inline.charseq"/></fo:inline>
      </xsl:when>
      <xsl:otherwise>
        <fo:inline font-weight="bold"><xsl:call-template name="inline.charseq"/></fo:inline>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <!-- TAG: surround with < > -->
  <xsl:template match="d:tag">
    <fo:inline><fo:character character="&lt;" padding-right="0.1em"/><xsl:call-template name="inline.charseq"/><fo:character character="&gt;" padding-left="0.1em"/></fo:inline>
  </xsl:template>
  <!-- REPLACEABLE: surround with [ ] -->
  <xsl:template match="d:replaceable">
    <fo:inline font-style="italic"><fo:character character="[" padding-right="0.1em"/><xsl:call-template name="inline.charseq"/><fo:character character="]" padding-left="0.1em"/></fo:inline>
  </xsl:template>
  <!-- FILENAME: no line breaks in a file name -->
  <xsl:template match="d:filename">
    <fo:inline keep-together.within-line="always"><xsl:call-template name="inline.monoseq"/></fo:inline>
  </xsl:template>
  <!-- FUNCTION: no special treatment when used in a title -->
  <xsl:template match="d:section/d:title/d:function">
    <xsl:apply-templates/>
  </xsl:template>
</xsl:stylesheet>
