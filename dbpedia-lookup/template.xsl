<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
 <ArrayOfResults xmlns="http://lookup.dbpedia.org/" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
   <xsl:for-each select="results/result">
    <Result>
      <Label><xsl:value-of select="label" /></Label>
      <URI><xsl:value-of select="resource" /></URI>
      <Description><xsl:value-of select="comment" /></Description>
      <Classes>
        <xsl:for-each select="type">
          <Class>
            <xsl:variable name="s1" select="replace(replace(.,'(.*)(/|#)',''),'([A-Z][a-z]+)','$1 ')" />
            <Label><xsl:value-of select="substring($s1, 1, string-length($s1) - 1)" /></Label>
            <URI><xsl:value-of select="." /></URI>
          </Class>
        </xsl:for-each>
      </Classes>
      <Categories>
         <xsl:for-each select="category">
          <Category> 
            <Label><xsl:value-of select="replace(replace(.,'(.*)(:)',''),'_',' ')" /></Label>
            <URI><xsl:value-of select="." /></URI>
          </Category>
        </xsl:for-each>
      </Categories>
      <Refcount><xsl:value-of select="refCount" /></Refcount>
      <Score><xsl:value-of select="score" /></Score>
    </Result>
  </xsl:for-each>
 </ArrayOfResults>
</xsl:template>
</xsl:stylesheet>
