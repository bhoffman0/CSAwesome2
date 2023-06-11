<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="node()|@*">
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
  </xsl:template>

  <!-- Try to create introduction in sections with subsections. This could grab too much. -->
  <xsl:template match="section[subsection]">
    <xsl:copy>
      <introduction>
        <xsl:apply-templates select="*[not(name() = 'subsection')]" />
      </introduction>
      <xsl:apply-templates select="subsection" />
    </xsl:copy>
  </xsl:template>

  <!-- PreTeXt doesn't like height attributes on images -->
  <xsl:template match="image/@height"/>

  <!-- PreTeXt wants marker, not label -->
  <xsl:template match="ol[@label] | ul[@label]">
    <xsl:copy>
      <xsl:attribute name="marker">
        <xsl:value-of select="@label"/>
      </xsl:attribute>
      <!-- Copy any attributes other than label, and apply templates to child nodes -->
      <xsl:apply-templates select="@*[not(name()='label')] | node()"/>
    </xsl:copy>
  </xsl:template>

  <!-- Clean up deprecated <br>s -->
  <xsl:template match="p/text()[normalize-space()]">
    <line>
      <xsl:value-of select="."/>
    </line>
  </xsl:template>

  <xsl:template match="p/br" />


</xsl:stylesheet>
