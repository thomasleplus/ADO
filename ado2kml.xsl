<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes" omit-xml-declaration="no" />
  <xsl:template match="/">
    <kml xmlns="http://earth.google.com/kml/2.2">
      <Document>
	<name>Destinos</name>
	<description><![CDATA[]]></description>
	<xsl:for-each select="root/mapas/mapa">
	  <Placemark>
	    <name><xsl:value-of select="terminal" /></name>
	    <description><xsl:value-of select="direccion" /><br/><xsl:value-of select="telefono" /></description>
	    <Point>
	      <coordinates><xsl:value-of select="@lng" />,<xsl:value-of select="@lat" /></coordinates>
	    </Point>
	  </Placemark>
	</xsl:for-each>
      </Document>
    </kml>
  </xsl:template>
</xsl:stylesheet>
