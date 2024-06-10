<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="node()|@*">
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="section[exercise]">
    <xsl:copy>
      <xsl:apply-templates select="*[not(name() = 'exercise')]" />
      <exercises>
        <xsl:apply-templates select="*[name() = 'exercise']" />
      </exercises>
    </xsl:copy>
  </xsl:template>
  
</xsl:stylesheet>
