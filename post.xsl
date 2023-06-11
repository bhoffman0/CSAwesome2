<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="node()|@*">
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="section[subsection]">
    <xsl:copy>
      <introduction>
        <xsl:apply-templates select="*[not(name() = 'subsection')]" />
      </introduction>
      <xsl:apply-templates select="subsection" />
    </xsl:copy>
  </xsl:template>


  <xsl:template match="image/@height"/>

</xsl:stylesheet>
