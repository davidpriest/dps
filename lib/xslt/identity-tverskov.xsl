This document had no style information.
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * THE BETTER IDENTITY TEMPLATE FOR XSLT 2.0 Author: Jesper Tverskov www.xmlplease.com/identity-template Version 2.2, 2010-10-15 Version 1.0, 2007-12-15 See end of stylesheet for details about versions and testing. Using saxon:parse() and saxon:serialize() Available in e.g: Saxon-EE, Saxon-PE, Saxon-9.1/9.0 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:saxon="http://saxon.sf.net/" exclude-result-prefixes="#all" id="identity-tverskov">
<!-- Default-encoding parameter should only be changed if the correct encoding can not be detected in the XML declaration. -->
<xsl:param name="default-encoding" select="'utf-8'"/>
<!-- "'utf-8'" is default but is overruled by encoding in XML declaration. -->
<!-- The default for the "protect-character-entities-test" is "'yes'". Any other value means "'no'". -->
<xsl:param name="protect-character-entities-test" select="'yes'"/>
<!-- The solution makes use of 14 restricted "words". You get a warning if one of the restricted words are used in the input document or if the protected words are not unique. You can change the restricted words below or pass them in as parameters when needed. Note that words must be double quoted or they are interpreted as XPath expressions. Use only a-z to play it safe. -->
<!-- protect-character-entities: If you use &#160; in input you also get it like that in output. Only an option, see above. -->
<xsl:param name="protect-character-entities" select="'qplvfvnhbmngfd'"/>
<!-- protect-entities: This is necessary because we hide the DTD where entities could have been declared. -->
<xsl:param name="protect-entities" select="'ahflasdkffstyor'"/>
<!-- cdata-start: Used when replacing CDATA sections with PI to protect them. -->
<xsl:param name="cdata-start" select="'bvzmntrewrbmn'"/>
<!-- cdata-end: Used when replacing CDATA sections with PI to protect them. -->
<xsl:param name="cdata-end" select="'urqpwoehreregfyuio'"/>
<!-- protect-whitespace: Used to protect leading whitespace in PIs in prolog -->
<xsl:param name="protect-whitespace" select="'rmergfgfhhghgh'"/>
<!-- hide-false-topelements: Before we can locate the start tag of the top-element we must hide what looks like top-elements in the prolog. -->
<xsl:param name="hide-false-topelements" select="'jfsagkytybrtttf'"/>
<!-- hide-xmldecl-as-pi: Necessary to prevent identity template from ignoring it. -->
<xsl:param name="hide-xmldecl-as-pi" select="'potyuitdsgfkadjsbmnl'"/>
<!-- hide-dtddecl-as-pi: Necessary to prevent identity template from ignoring dtd. -->
<xsl:param name="hide-dtddecl-as-pi" select="'mnmnmjjhjhghgh'"/>
<!-- gt-in-dtd: In order to find the last gt in a DTD, that is the end of the DTD, I find all the gt in the DTD first and mark them up as such. -->
<xsl:param name="gt-in-dtd" select="'lapqalqpapqlamalzmalza'"/>
<!-- end-of-dtd: When we have located the end of the DTD after a lot of hard work, we replace it with this parameter value so it is easier to find again. -->
<xsl:param name="end-of-dtd" select="'wquiiiiiiiivbvbbm'"/>
<!-- pi-as-comment: we need it when replacing PIs inside internal subsets of DTD hidden as PI. A PI cannot contain PI. -->
<xsl:param name="pi-as-comment" select="'wqibibibibuxuxxuym'"/>
<!-- questionmark in DTD: DTD is replaced with PI. A PI can not contain "?>". We must replace the questionmark in ENTITY declarations, etc.. -->
<xsl:param name="questionmark-in-dtd" select="'poiipirwzxxzxz'"/>
<!-- end-of-topelement: When we have located the end tag of the top-element, we add a restricted word to it so it is easier to find again. -->
<xsl:param name="end-of-topelement" select="'abtrtrttretewrtertwertwetc'"/>
<!-- questionmark-in-cdata: When replacing CDATA section with PI, it is also a good idea to replace "?" inside CDATA sections because a PI can not contain "?>". -->
<xsl:param name="questionmark-in-cdata" select="'ayrqoeuwiryoewiuqygabc'"/>
<!-- Name of the top-element -->
<xsl:variable name="top-element" select="name(document(document-uri(.))/*)"/>
<!-- To get encoding right in last xsl:result-document. -->
<xsl:variable name="test_encoding" select="unparsed-text(document-uri(.))"/>
<xsl:variable name="xmldeclaration" select="if (starts-with($test_encoding, '<?xml')) then substring-before($test_encoding, '?>') else ''"/>
<xsl:variable name="encoding-test">
<xsl:analyze-string select="replace($xmldeclaration, '\s', '')" regex="encoding=("|').*?("|')">
<xsl:matching-substring>
<xsl:analyze-string select="." regex="encoding=("|')|("|')">
<xsl:non-matching-substring>
<xsl:value-of select="."/>
</xsl:non-matching-substring>
</xsl:analyze-string>
</xsl:matching-substring>
</xsl:analyze-string>
</xsl:variable>
<xsl:variable name="encoding" select="if ($encoding-test ne '') then $encoding-test else $default-encoding"/>
<!-- Load the input XML document as unparsed-text -->
<xsl:variable name="unparsed" select="unparsed-text(document-uri(.))"/>
<!-- test if top-element is empty. We remove everything in the prolog that could look like the top-element to make it easier to locate the top-element. -->
<xsl:variable name="top-tag">
<xsl:analyze-string select="$unparsed" regex="<\?.*?\?>|<!--.*?-->" flags="s">
<xsl:non-matching-substring>
<xsl:analyze-string select="." regex="<!ELEMENT.*?>" flags="s">
<xsl:non-matching-substring>
<xsl:analyze-string select="." regex="<!ATTLIST.*?>" flags="s">
<xsl:non-matching-substring>
<xsl:analyze-string select="." regex="<!NOTATION.*?>" flags="s">
<xsl:non-matching-substring>
<xsl:analyze-string select="." regex="<!ENTITY.*?["|']\s*>" flags="s">
<xsl:non-matching-substring>
<xsl:analyze-string select="." regex="<!DOCTYPE.*?>" flags="s">
<xsl:non-matching-substring>
<xsl:value-of select="."/>
</xsl:non-matching-substring>
</xsl:analyze-string>
</xsl:non-matching-substring>
</xsl:analyze-string>
</xsl:non-matching-substring>
</xsl:analyze-string>
</xsl:non-matching-substring>
</xsl:analyze-string>
</xsl:non-matching-substring>
</xsl:analyze-string>
</xsl:non-matching-substring>
</xsl:analyze-string>
</xsl:variable>
<xsl:variable name="top-tag-2" select="concat('<',$top-element, substring-before(substring-after($top-tag, concat('<',$top-element)), '>'), '>')"/>
<xsl:variable name="is-top-tag-empty" select="if (contains($top-tag-2, '/>')) then 'yes' else 'no'"/>
<!-- We test if the protected words for replacements exist is input document. Will also work for supplied parameter values. We make use of this variable in the first template. -->
<xsl:variable name="restricted-word-test">
<xsl:choose>
<xsl:when test="contains($unparsed, $protect-whitespace)">
<xsl:message terminate="yes">
The protected word, 
<xsl:value-of select="$protect-whitespace"/>
, for the "protect-whitespace" parameter was found in the input document. Change the parameter.
</xsl:message>
</xsl:when>
<xsl:when test="contains($unparsed, $cdata-start)">
<xsl:message terminate="yes">
The protected word, 
<xsl:value-of select="$cdata-start"/>
, for the "cdata-start" parameter was found in the input document. Change the parameter.
</xsl:message>
</xsl:when>
<xsl:when test="contains($unparsed, $cdata-end)">
<xsl:message terminate="yes">
The protected word, 
<xsl:value-of select="$cdata-end"/>
, for the "cdata-end" parameter was found in the input document. Change the parameter.
</xsl:message>
</xsl:when>
<xsl:when test="contains($unparsed, $protect-entities)">
<xsl:message terminate="yes">
The protected word, 
<xsl:value-of select="$protect-entities"/>
, for the "protect-entities" parameter was found in the input document. Change the parameter.
</xsl:message>
</xsl:when>
<xsl:when test="contains($unparsed, $protect-character-entities)">
<xsl:message terminate="yes">
The protected word, 
<xsl:value-of select="$protect-character-entities"/>
, for the "protect-character-entities" parameter was found in the input document. Change the parameter.
</xsl:message>
</xsl:when>
<xsl:when test="contains($unparsed, $hide-false-topelements)">
<xsl:message terminate="yes">
The protected word, 
<xsl:value-of select="hide-false-topelements"/>
, for the "hide-false-topelements" parameter was found in the input document. Change the parameter.
</xsl:message>
</xsl:when>
<xsl:when test="contains($unparsed, $hide-xmldecl-as-pi)">
<xsl:message terminate="yes">
The protected word, 
<xsl:value-of select="$hide-xmldecl-as-pi"/>
, for the "hide-xmldecl-as-pi" parameter was found in the input document. Change the parameter.
</xsl:message>
</xsl:when>
<xsl:when test="contains($unparsed, $hide-dtddecl-as-pi)">
<xsl:message terminate="yes">
The protected word, 
<xsl:value-of select="$hide-dtddecl-as-pi"/>
, for the "hide-dtddecl-as-pi" parameter was found in the input document. Change the parameter.
</xsl:message>
</xsl:when>
<xsl:when test="contains($unparsed, $questionmark-in-dtd)">
<xsl:message terminate="yes">
The protected word, 
<xsl:value-of select="$questionmark-in-dtd"/>
, for the "questionmark-in-dtd" parameter was found in the input document. Change the parameter.
</xsl:message>
</xsl:when>
<xsl:when test="contains($unparsed, $gt-in-dtd)">
<xsl:message terminate="yes">
The protected word, 
<xsl:value-of select="$gt-in-dtd"/>
, for the "gt-in-dtd" parameter was found in the input document. Change the parameter.
</xsl:message>
</xsl:when>
<xsl:when test="contains($unparsed, $pi-as-comment)">
<xsl:message terminate="yes">
The protected word, 
<xsl:value-of select="$pi-as-comment"/>
, for the "pi-as-comment" parameter was found in the input document. Change the parameter.
</xsl:message>
</xsl:when>
<xsl:when test="contains($unparsed, $end-of-dtd)">
<xsl:message terminate="yes">
The protected word, 
<xsl:value-of select="$end-of-dtd"/>
, for the "end-of-dtd" parameter was found in the input document. Change the parameter.
</xsl:message>
</xsl:when>
<xsl:when test="contains($unparsed, $end-of-topelement)">
<xsl:message terminate="yes">
The protected word, 
<xsl:value-of select="$end-of-topelement"/>
, for the "end-of-topelement" parameter was found in the input document. Change the parameter.
</xsl:message>
</xsl:when>
<xsl:when test="contains($unparsed, $questionmark-in-cdata)">
<xsl:message terminate="yes">
The protected word, 
<xsl:value-of select="$questionmark-in-cdata"/>
, for the "questionmark-in-cdata" parameter was found in the input document. Change the parameter.
</xsl:message>
</xsl:when>
<!-- Here we test if the 14 restricted words used for replacements are unique. -->
<xsl:when test="count(distinct-values(($protect-entities, $cdata-start, $cdata-end, $protect-whitespace, $protect-character-entities, $hide-false-topelements, $hide-xmldecl-as-pi, $hide-dtddecl-as-pi, $gt-in-dtd, $end-of-dtd, $pi-as-comment, $questionmark-in-dtd, $questionmark-in-cdata, $end-of-topelement))) ne 14">
<xsl:message terminate="yes">
Two or more of the protected words used for replacements are the same. They must be unique. 
</xsl:message>
</xsl:when>
</xsl:choose>
</xsl:variable>
<!-- We replace everything in the prolog that looks like the top-element. -->
<xsl:variable name="unparsed-clean">
<xsl:analyze-string select="$unparsed" regex="<\?.*?\?>|<!--.*?-->" flags="s">
<xsl:matching-substring>
<xsl:value-of select="replace(replace(., concat('<', $top-element), concat('<', $hide-false-topelements)), concat('</', $top-element), concat('</', $hide-false-topelements))"/>
</xsl:matching-substring>
<xsl:non-matching-substring>
<!-- Probably not necessary but we don't want to take chances -->
<xsl:analyze-string select="." regex="<!ELEMENT.*?>" flags="s">
<xsl:matching-substring>
<xsl:value-of select="replace(replace(., concat('<', $top-element), concat('<', $hide-false-topelements)), concat('</', $top-element), concat('</', $hide-false-topelements))"/>
</xsl:matching-substring>
<xsl:non-matching-substring>
<!-- Probably not necessary but we don't want to take chances -->
<xsl:analyze-string select="." regex="<!ATTLIST.*?>" flags="s">
<xsl:matching-substring>
<xsl:value-of select="replace(replace(., concat('<', $top-element), concat('<', $hide-false-topelements)), concat('</', $top-element), concat('</', $hide-false-topelements))"/>
</xsl:matching-substring>
<xsl:non-matching-substring>
<!-- Probably not necessary but we don't want to take chances -->
<xsl:analyze-string select="." regex="<!NOTATION.*?" flags="s">
<xsl:matching-substring>
<xsl:value-of select="replace(replace(., concat('<', $top-element), concat('<', $hide-false-topelements)), concat('</', $top-element), concat('</', $hide-false-topelements))"/>
</xsl:matching-substring>
<xsl:non-matching-substring>
<!-- Here we can have all sorts of markup fragments -->
<xsl:analyze-string select="." regex="<!ENTITY.*?["|'].*["|']\s*>">
<xsl:matching-substring>
<xsl:value-of select="replace(replace(., concat('<', $top-element), concat('<', $hide-false-topelements)), concat('</', $top-element), concat('</', $hide-false-topelements))"/>
</xsl:matching-substring>
<xsl:non-matching-substring>
<xsl:analyze-string select="." regex="<!DOCTYPE.*?>" flags="s">
<xsl:matching-substring>
<xsl:value-of select="replace(replace(., concat('<', $top-element), concat('<', $hide-false-topelements)), concat('</', $top-element), concat('</', $hide-false-topelements))"/>
</xsl:matching-substring>
<xsl:non-matching-substring>
<xsl:value-of select="."/>
</xsl:non-matching-substring>
</xsl:analyze-string>
</xsl:non-matching-substring>
</xsl:analyze-string>
</xsl:non-matching-substring>
</xsl:analyze-string>
</xsl:non-matching-substring>
</xsl:analyze-string>
</xsl:non-matching-substring>
</xsl:analyze-string>
</xsl:non-matching-substring>
</xsl:analyze-string>
</xsl:variable>
<!-- Prolog before top-element -->
<xsl:variable name="unparsed-before" select="substring-before($unparsed-clean, concat('<', $top-element))"/>
<!-- Top-element including the part of the prolog under the top-element -->
<xsl:variable name="unparsed-after" select="concat(concat('<', $top-element), substring-after($unparsed-clean, concat('<', $top-element)))"/>
<xsl:variable name="unparsed-after-2">
<!-- We protect CDATA sections replacing them with PI -->
<xsl:analyze-string select="$unparsed-after" regex="<!\[CDATA\[.*?\]\]>" flags="s">
<xsl:matching-substring>
<xsl:analyze-string select="." regex="<!\[CDATA\[">
<xsl:matching-substring>
<xsl:value-of select="concat('<?', $cdata-start, $protect-whitespace)"/>
</xsl:matching-substring>
<xsl:non-matching-substring>
<xsl:analyze-string select="." regex="\]\]>">
<xsl:matching-substring>
<xsl:value-of select="concat($cdata-end, '?>')"/>
</xsl:matching-substring>
<xsl:non-matching-substring>
<!-- We protect "?" by replacing them with a restricted word. -->
<xsl:value-of select="replace(., '\?', $questionmark-in-cdata)"/>
</xsl:non-matching-substring>
</xsl:analyze-string>
</xsl:non-matching-substring>
</xsl:analyze-string>
</xsl:matching-substring>
<xsl:non-matching-substring>
<xsl:value-of select="."/>
</xsl:non-matching-substring>
</xsl:analyze-string>
</xsl:variable>
<!-- Here we find the end of the top-element and add a word to make it easier to find it again. -->
<xsl:variable name="unparsed2seq" select="tokenize($unparsed-after-2, concat('</', $top-element))"/>
<xsl:variable name="seq2unparsed-except-last">
<xsl:for-each select="$unparsed2seq[position() ne last()]">
<xsl:choose>
<xsl:when test="position() eq last()">
<xsl:value-of select="concat(., concat($end-of-topelement, '</', $top-element))"/>
</xsl:when>
<xsl:otherwise>
<xsl:value-of select="concat(., concat('</', $top-element))"/>
</xsl:otherwise>
</xsl:choose>
</xsl:for-each>
</xsl:variable>
<xsl:variable name="seq2unparsed" select="concat($seq2unparsed-except-last, $unparsed2seq[position() eq last()])"/>
<!-- Prolog under the top-element -->
<xsl:variable name="unparsed-last">
<xsl:choose>
<!-- This is necessary for the very rare case of the top-element looking e.g. like this <x ... /> -->
<xsl:when test="$is-top-tag-empty eq 'yes'">
<xsl:value-of select="concat('<prolog-after>', substring-after($unparsed-after, '/>'), '</prolog-after>')"/>
</xsl:when>
<xsl:otherwise>
<!-- The regex is to make sure that things get right if top-elements end-tag looks like this </x >. We don't care if insignificant whitespace is deleted. -->
<xsl:analyze-string select="$seq2unparsed" regex="(^(.*{$end-of-topelement}</{$top-element}\s*>))" flags="s">
<xsl:non-matching-substring>
<xsl:value-of select="concat('<prolog-after>', ., '</prolog-after>')"/>
</xsl:non-matching-substring>
</xsl:analyze-string>
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<!-- The top-element only -->
<xsl:variable name="unparsed-between">
<xsl:choose>
<!-- This is necessary if the top-element lloks like this <x ... /> -->
<xsl:when test="$is-top-tag-empty eq 'yes'">
<xsl:value-of select="$top-tag-2"/>
</xsl:when>
<xsl:otherwise>
<xsl:value-of select="concat(substring-before($seq2unparsed, $end-of-topelement), concat('</', $top-element, '>'))"/>
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<!-- replace XML declaration with PI -->
<xsl:variable name="xml2pi" select="if (starts-with($unparsed-before, '<?xml')) then concat(replace(substring-before($unparsed-before, '?>'), '<\?xml', concat('<?', $hide-xmldecl-as-pi)), '?>', substring-after($unparsed-before, '?>'))else $unparsed-before"/>
<!-- Replace PI inside DOCTYPE with comment and replace DOCTYPE declaration with PI -->
<xsl:variable name="doctype2pi">
<!-- The regex finds all PIs in prolog before top-element. Non-matching substring finds the rest that is comments, DTD and whitespace between declarations comments and PIs. -->
<xsl:analyze-string select="$xml2pi" regex="<\?{$hide-xmldecl-as-pi}.*?\?>" flags="s">
<xsl:matching-substring>
<xsl:value-of select="."/>
</xsl:matching-substring>
<xsl:non-matching-substring>
<!-- Finds any comment and PI in prolog and change PI to comments we can find again using a restricted word. -->
<xsl:analyze-string select="." regex="<\?.*?\?>|<!--.*?-->" flags="s">
<xsl:matching-substring>
<!-- "\i\c*" is probably overkill, we know already that the input document is well-formed. -->
<xsl:analyze-string select="." regex="<\?\i\c*">
<xsl:matching-substring>
<xsl:value-of select="concat(replace(., '<\?', concat('<!--', $pi-as-comment)), ' ', $protect-whitespace)"/>
</xsl:matching-substring>
<xsl:non-matching-substring>
<xsl:value-of select="replace(., '\?>', concat($pi-as-comment, '-->'))"/>
</xsl:non-matching-substring>
</xsl:analyze-string>
</xsl:matching-substring>
<xsl:non-matching-substring>
<!-- We find false DOCTYPE inside ENTITY declarations -->
<xsl:analyze-string select="." regex="['|"].*<!DOCTYPE" flags="s">
<xsl:matching-substring>
<xsl:value-of select="."/>
</xsl:matching-substring>
<xsl:non-matching-substring>
<!-- We find the beginning of a real DOCTYPE declaration -->
<xsl:analyze-string select="." regex="<!DOCTYPE">
<xsl:matching-substring>
<!-- We change DOCTYPE declaration to a PI. We don't care about the end of the declaration here. -->
<xsl:value-of select="concat('<?', $hide-dtddecl-as-pi)"/>
</xsl:matching-substring>
<xsl:non-matching-substring>
<!-- We replace ? with a restricted word to prevent trouble. The DOCTYPE disguised as a PI must not contain "?>". We also replace all ">" inside the DOCTYPE declaration with a restricted word. -->
<xsl:analyze-string select="." regex="\?|>" flags="s">
<xsl:matching-substring>
<xsl:value-of select="replace(replace(., '\?', $questionmark-in-dtd), '>', $gt-in-dtd)"/>
</xsl:matching-substring>
<xsl:non-matching-substring>
<xsl:value-of select="."/>
</xsl:non-matching-substring>
</xsl:analyze-string>
</xsl:non-matching-substring>
</xsl:analyze-string>
</xsl:non-matching-substring>
</xsl:analyze-string>
</xsl:non-matching-substring>
</xsl:analyze-string>
</xsl:non-matching-substring>
</xsl:analyze-string>
</xsl:variable>
<!--Create prolog-before element -->
<xsl:variable name="prolog-before">
<xsl:value-of select="concat('<prolog-before>', $doctype2pi, '</prolog-before>')"/>
</xsl:variable>
<!-- Concat the substrings back to full document. -->
<xsl:variable name="new-unparsed" select="concat($prolog-before, $unparsed-between, $unparsed-last)"/>
<xsl:variable name="new-unparsed-2">
<!-- $protect-whitespace is inserted before leading whitespace in all PIs to make things easy. In Saxon we only need to do it in prolog. -->
<xsl:analyze-string select="$new-unparsed" regex="<\?.*?\?>" flags="s">
<xsl:matching-substring>
<!-- "\i\c*" is probably overkill, we know already that the input document is well-formed. \w is enough. -->
<xsl:analyze-string select="." regex="<\?\i\c*">
<xsl:matching-substring>
<xsl:value-of select="concat(., ' ', $protect-whitespace)"/>
</xsl:matching-substring>
<xsl:non-matching-substring>
<xsl:value-of select="."/>
</xsl:non-matching-substring>
</xsl:analyze-string>
</xsl:matching-substring>
<xsl:non-matching-substring>
<xsl:value-of select="."/>
</xsl:non-matching-substring>
</xsl:analyze-string>
</xsl:variable>
<!-- create new top-element: document -->
<xsl:variable name="doc-text">
<!-- Here we find all named entities -->
<xsl:analyze-string select="$new-unparsed-2" regex="&[^#]">
<xsl:matching-substring>
<!-- We protect entities declared in a DTD -->
<xsl:value-of select="replace(., '&', $protect-entities)"/>
</xsl:matching-substring>
<xsl:non-matching-substring>
<!-- here we deal with character entities. It is optional if they should be protected. -->
<xsl:value-of select="if ($protect-character-entities-test eq 'yes') then replace(., '&#', $protect-character-entities) else ."/>
</xsl:non-matching-substring>
</xsl:analyze-string>
</xsl:variable>
<xsl:variable name="doc-text-2" select="concat('<document>', $doc-text, '</document>')"/>
<!-- When the loaded unparsed-text is serialized at the very end the character-map turns it back into XML -->
<xsl:character-map name="a">
<xsl:output-character character=">" string=">"/>
<xsl:output-character character="<" string="<"/>
<xsl:output-character character="&" string="&"/>
<xsl:output-character character=""" string="""/>
<xsl:output-character character="&" string="&"/>
<!-- I not sure that this one is really needed. -->
</xsl:character-map>
<xsl:output method="xml" omit-xml-declaration="yes" use-character-maps="a"/>
<!-- This the first template is mostly used to prepare for the identity template below. -->
<xsl:template match="/">
<!-- Test: Is saxon:parse and saxon:serialize supported by XSLT processor? -->
<xsl:variable name="test-for-saxon-extensions" select="concat(function-available('saxon:parse'), function-available('saxon:serialize'))"/>
<xsl:if test="$test-for-saxon-extensions ne 'truetrue'">
<xsl:message terminate="yes" select="'XSLT processor does not support the saxon extensions used in stylesheet: use e.g.: Saxon-EE | Saxon-PE | Saxon-9.1/9.0'"/>
</xsl:if>
<!-- If true the xsl:message inside the variable terminates the transformation. -->
<xsl:if test="$restricted-word-test ne ''">
<xsl:value-of select="$doctype2pi"/>
</xsl:if>
<!-- In order to find the end of the DTD we have earlier replaced all &gt; with $gt-in-dtd. We know the the last one is the right one. I have chosen to split the document using $gt-in-dtd as splitter. I then assemble the sequences again and replace &gt-in-dtd with &gt; excet for the last one where I add a restricted word so it is easy to locate the end of the DTD later. -->
<xsl:variable name="doc2seq" select="tokenize($doc-text-2, $gt-in-dtd)"/>
<xsl:variable name="seq2doc-except-last">
<xsl:for-each select="$doc2seq[position() ne last()]">
<xsl:choose>
<xsl:when test="position() eq last()">
<xsl:value-of select="concat(., $end-of-dtd, '?>')"/>
</xsl:when>
<xsl:otherwise>
<xsl:value-of select="concat(., '>')"/>
</xsl:otherwise>
</xsl:choose>
</xsl:for-each>
</xsl:variable>
<xsl:variable name="seq2doc" select="concat($seq2doc-except-last, $doc2seq[position() eq last()])"/>
<xsl:variable name="that-is-it">
<xsl:analyze-string select="$seq2doc" regex="<\?{$hide-dtddecl-as-pi}.*?{$end-of-dtd}\?>" flags="s">
<xsl:matching-substring>
<!-- This is necessary or we get an extra space at the beginning of content in PIs in DTD! -->
<xsl:analyze-string select="." regex="<!--{$pi-as-comment}\w+\s">
<xsl:matching-substring>
<xsl:value-of select="replace(., '\s', '')"/>
</xsl:matching-substring>
<xsl:non-matching-substring>
<xsl:value-of select="replace(., $end-of-dtd, '')"/>
</xsl:non-matching-substring>
</xsl:analyze-string>
</xsl:matching-substring>
<xsl:non-matching-substring>
<xsl:value-of select="replace(replace(replace(., $end-of-topelement, ''), concat('<!--', $pi-as-comment), '<?'), concat($pi-as-comment, '-->'), '?>')"/>
</xsl:non-matching-substring>
</xsl:analyze-string>
</xsl:variable>
<!-- The transformation starts here and is stored in the variable "parsed". -->
<xsl:variable name="parsed" use-when="function-available('saxon:parse')">
<xsl:apply-templates mode="identity" select="saxon:parse(replace($that-is-it, $hide-false-topelements, $top-element))"/>
</xsl:variable>
<!-- This result document can be used for testing content of variables, etc. -->
<xsl:result-document href="identity-template-test.xml" use-when="false()">
<xsl:value-of select="$that-is-it"/>
</xsl:result-document>
<!-- Finally the result of the transformation contained in the variable "parsed" is serialised using a lot of replaces but also xsl:character-map. Note that the xsl:result-document is only used to get encoding right. -->
<xsl:result-document encoding="{$encoding}">
<!-- 1. Questionmarks in dtd are replaced back. 2. PI disguised as comment start is replaced back. 3. PI disguised as comment end is replaced back. 4. Questionmarks in cdata are replaced back. 5. ]]&gt; disguised as word is replaced back. 6. &lt;![CDATA[ disguised as word is replaced back. 7. &amp; disguised as word is replaced back. 8. &amp;# disguised as word is replaced back. 9. $protect-whitespace in PI is deleted. -->
<xsl:value-of select="replace(replace(replace(replace(replace(replace(replace(replace(replace(saxon:serialize($parsed, ''), concat('\s?', $protect-whitespace), ''), concat('<\?', $cdata-start), '<![CDATA['), concat($cdata-end, '\s?\?>'), ']]>'), $protect-character-entities, '&#'), $protect-entities, '&'), concat('<!--', $pi-as-comment), '<?'), concat($pi-as-comment, '-->'), '?>'), $questionmark-in-cdata, '?'), $questionmark-in-dtd, '?')" use-when="function-available('saxon:serialize')"/>
</xsl:result-document>
</xsl:template>
<!-- Traditional identity template -->
<xsl:template match="@*|node()" mode="identity">
<xsl:copy>
<xsl:apply-templates select="@*|node()" mode="identity"/>
</xsl:copy>
</xsl:template>
<!-- XML declaration -->
<xsl:template match="processing-instruction()[name() eq $hide-xmldecl-as-pi]" mode="identity">
<xsl:text>
<?xml
</xsl:text>
<!-- Add code to manipulate xml declaration -->
<xsl:value-of select="."/>
<xsl:text>
?>
</xsl:text>
</xsl:template>
<!-- DOCTYPE declaration -->
<xsl:template match="processing-instruction()[name() eq $hide-dtddecl-as-pi]" mode="identity">
<xsl:text>
<!DOCTYPE 
</xsl:text>
<!-- Add code to manipulate DOCTYPE -->
<xsl:value-of select="."/>
<xsl:text>
>
</xsl:text>
</xsl:template>
<!-- We can add all the templates we want to overrule identity copying for a specific node. Remember to use mode="last". You must use the proper replacement "words", see above, if you want to get to things like entities in the additional templates. -->
<!-- Delete temporary document element except content -->
<xsl:template match="/document" mode="identity">
<xsl:apply-templates mode="identity"/>
</xsl:template>
<!-- Delete temporary prolog-before element except content -->
<xsl:template match="/document/prolog-before" mode="identity">
<xsl:apply-templates mode="identity"/>
</xsl:template>
<!-- Delete temporary prolog-after element except content -->
<xsl:template match="/document/prolog-after" mode="identity">
<xsl:apply-templates mode="identity"/>
</xsl:template>
</xsl:stylesheet>
<!-- ABOUT VERSIONS Version 2.2, 2010-10-15 The stylesheet know tests if saxon:serialize() and saxon:parse() are available in XSLT processor. Version 2.1, 2008-01-19 The stylesheet now also handles my http://www.xmlplease.com/killer-test.xml, a far out mess of CDATA sections, PIs, Comments and DTD declarations with internal subsets nested into one another. In version 2.0 one regular expression used at three different places did not work as expected but this problem is now also history. Version 2.0, 2008-01-14 Changed a few details making it possible to delete one template making the solution more simple. A few corrections of misspelled words in comments. All templates except the first have now mode="identity". All earlier versions used mode="last". Version 1.3, 2008-01-12 Fixed a bug about CDATA sections declared as entity in internal subset of DTD. Version 1.2, 2008-01-12 Has been tested with all valid and invalid test files in the XML Conformance Test Suites (2 files were excluded for not being well-formed in XERCES). All files are transformed. This does not say that the result of the transformations are as we want them to be. Input and output files have been compared with "Compare directories" tool in XMLSpy showing that the files are exactly the same except for whitespace normalization of attribute values (a handful of files). In other tests the only additional differences found have been in non significant whitespace and in the order of attributes in some situations. Version 1.1, 2007-12-19 Could probably do a good job more than 99% of the time, but it had grave problems with extreme DTD subsets containing PIs, etc., and a bug made handling of CDATA sections not working. Version 1.0, 2007-12-15 Could probably do a good job more than 99% of the time for must users but entities declared in DTD was not handled. -->