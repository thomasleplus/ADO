<?xml version="1.0" encoding="UTF-8"?>
<!--
ADO - Scripts to process ADO autobuses web data.
Copyright (C) 2013 Thomas Leplus

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
-->
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
