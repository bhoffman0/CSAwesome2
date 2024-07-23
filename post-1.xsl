<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="node()|@*">
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
  </xsl:template>

  <!-- Remove xml:id attribute from all elements except 'section' -->
  <xsl:template match="@xml:id[not(parent::section)]"/>

  <!-- Explicitly keep xml:id on 'section' elements -->
  <xsl:template match="section/@xml:id">
    <xsl:copy-of select="."/>
  </xsl:template>

  <xsl:template match="section[exercise]">
    <xsl:copy>
      <xsl:apply-templates select="*[not(name() = 'exercise')]" />
      <exercises>
        <xsl:apply-templates select="*[name() = 'exercise']" />
      </exercises>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="video[@youtube]">
    <!-- <video xml:id="{@youtube}" youtube="{@youtube}"/> -->
    <video youtube="{@youtube}"/>
  </xsl:template>

  <xsl:template match="hint">
    <subsection>
      <xsl:apply-templates select="@*|node()"/>
    </subsection>
  </xsl:template>

  <xsl:template match="hint[blockquote]">
    <subsection>
      <xsl:apply-templates select="blockquote/node()"/>
    </subsection>
  </xsl:template>

</xsl:stylesheet>
