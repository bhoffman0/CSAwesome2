<?xml version='1.0'?> <!-- As XML file -->

<!--********************************************************************
Copyright 2013 Robert A. Beezer

This file is part of MathBook XML.

MathBook XML is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 2 or version 3 of the
License (at your option).

MathBook XML is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with MathBook XML.  If not, see <http://www.gnu.org/licenses/>.
*********************************************************************-->

<!-- http://pimpmyxslt.com/articles/entity-tricks-part2/ -->
<!DOCTYPE xsl:stylesheet [
    <!ENTITY % entities SYSTEM "entities.ent">
    %entities;
]>

<!-- Identify as a stylesheet -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:xml="http://www.w3.org/XML/1998/namespace"
    xmlns:pi="http://pretextbook.org/2020/pretext/internal"
    xmlns:date="http://exslt.org/dates-and-times"
    xmlns:exsl="http://exslt.org/common"
    xmlns:str="http://exslt.org/strings"
    extension-element-prefixes="pi exsl date str"
    xmlns:mb="https://pretextbook.org/"
    exclude-result-prefixes="mb"
>

<xsl:import href="./core/pretext-html.xsl"/>

<xsl:template match="time">
  <xsl:message>Time element processed!!!</xsl:message>
  <div class="time">
    <svg xmlns="http://www.w3.org/2000/svg"
         width="16"
         height="16"
         fill="currentColor"
         class="bi bi-clock"
         viewBox="0 0 16 16">
      <path d="M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71V3.5z"/>
      <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0z"/>
    </svg>
    <span> <xsl:value-of select="@minutes"/> minutes</span>
  </div>
</xsl:template>

<!-- Generate items that are hidden on the page -->
<xsl:template match="hidden">
  <!-- <xsl:message>=========================hidden========================</xsl:message> -->
  <div class="hidden">
    <xsl:apply-templates select="*" />
  </div>
</xsl:template>


<xsl:variable name="b-has-baseurl" select="not($baseurl = '')"/>

<xsl:template name="brand-logo">
    <a id="logo-link" class="logo-link" target="_blank" >
        <xsl:attribute name="href">
            <xsl:choose>
                <xsl:when test="$docinfo/brandlogo/@url != ''"><xsl:value-of select="$docinfo/brandlogo/@url"/></xsl:when>
                <xsl:when test="$b-has-baseurl"><xsl:value-of select="$baseurl"/></xsl:when>
                <xsl:otherwise></xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:if test="$docinfo/brandlogo/@source">
            <xsl:variable name="location">
                <!-- empty when not using managed directories -->
                <xsl:value-of select="$external-directory"/>
                <xsl:value-of select="$docinfo/brandlogo/@source"/>
            </xsl:variable>
            <img src="{$location}" alt="Logo image"/>
        </xsl:if>
    </a>
</xsl:template>

<xsl:template match="setup/var/condition/feedback" mode="serialize-feedback">
    <xsl:variable name="feedback-rtf">
        <xsl:apply-templates select="."/>
    </xsl:variable>
    <xsl:value-of select="$feedback-rtf"/>
</xsl:template>


<xsl:template match="*" mode="xref-link">
    <xsl:param name="target" select="/.." />
    <xsl:param name="origin" select="''" />
    <xsl:param name="content" select="'MISSING LINK CONTENT'"/>
    <xsl:variable name="knowl">
        <xsl:text>false</xsl:text>
    </xsl:variable>
    <xsl:choose>
        <!-- 1st exceptional case, xref in a webwork, or in    -->
        <!-- some sort of title.  Then just parrot the content -->
        <xsl:when test="ancestor::webwork-reps|ancestor::title|ancestor::shorttitle|ancestor::subtitle">
            <xsl:copy-of select="$content"/>
        </xsl:when>
        <!-- 2nd exceptional case, xref in mrow of display math  -->
        <!--   with Javascript (pure HTML) we can make knowls    -->
        <!--   without Javascript (EPUB) we use plain text       -->
        <xsl:when test="parent::mrow or parent::me or parent::men">
            <xsl:apply-templates select="." mode="xref-link-display-math">
                <xsl:with-param name="target" select="$target"/>
                <xsl:with-param name="origin" select="'xref'"/>
                <xsl:with-param name="content" select="$content"/>
            </xsl:apply-templates>
        </xsl:when>
        <!-- usual case, always an "a" element (anchor) -->
        <xsl:otherwise>
            <xsl:element name="a">
                <!-- knowl/hyperlink variability here -->
                <xsl:choose>
                    <!-- build a modern knowl -->
                    <xsl:when test="$knowl='true'">
                        <!-- empty, but presence needed for accessibility -->
                        <!-- An HTML "a" without an href attribute does   -->
                        <!-- not default to role "link" and does not read -->
                        <!-- as clickable by a screen reader.             -->
                        <xsl:attribute name="href">
                            <xsl:apply-templates select="$target" mode="url" />
                        </xsl:attribute>
                        <!-- mark as duplicated content via an xref -->
                        <xsl:attribute name="class">
                            <xsl:text>xref</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="data-knowl">
                            <xsl:apply-templates select="$target" mode="knowl-filename">
                                <xsl:with-param name="origin" select="$origin"/>
                            </xsl:apply-templates>
                        </xsl:attribute>
                    </xsl:when>
                    <!-- build traditional hyperlink -->
                    <xsl:otherwise>
                        <xsl:attribute name="href">
                            <xsl:apply-templates select="$target" mode="url" />
                        </xsl:attribute>
                        <!-- use a class to identify an internal link -->
                        <xsl:attribute name="class">
                            <xsl:text>internal</xsl:text>
                        </xsl:attribute>
                    </xsl:otherwise>
                </xsl:choose>
                <!-- add HTML title attribute to the link -->
                <xsl:attribute name="title">
                    <xsl:apply-templates select="$target" mode="tooltip-text" />
                </xsl:attribute>
                <!-- link content from common template -->
                <xsl:copy-of select="$content"/>
            </xsl:element>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<!-- Sometimes this template is useful to see which    -->
<!-- templates are not implemented at all in some new  -->
<!-- (basic) conversion building just on this -common. -->
<!-- Maybe "dead-ending" is preferable (remove the     -->
<!-- apply-templates) and/or maybe a lower priority    -->
<!-- will work better.                                 -->

<!-- <xsl:template match="*" priority="0">
    <xsl:message>[<xsl:value-of select="local-name(.)"/>]</xsl:message>
    <xsl:apply-templates/>
</xsl:template> -->

</xsl:stylesheet>
