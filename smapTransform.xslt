<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="text" encoding="utf-8"/>
<xsl:strip-space elements="*"/>
<xsl:variable name="separator" select="','"/>
<xsl:variable name="portseparator" select="'-'"/>
<xsl:variable name="portgroupstart" select="'('"/>
<xsl:variable name="portgroupend" select="')'"/>
<xsl:variable name="macseparator" select="'-'"/>
<xsl:variable name="endrecord" select= "'&#xa;'"/>

<xsl:template match="/">
    <xsl:text>IP-Mac, HostName, MACManufacturer, OS_Guess, Open_Ports,</xsl:text>
    <xsl:value-of select="$endrecord"/>

    <xsl:for-each select="nmaprun/host">
	<xsl:for-each select="address">
            <xsl:value-of select="@addr"/>
	    <xsl:value-of select="$macseparator"/>
	</xsl:for-each>
        <xsl:value-of select="$separator"/>
        <xsl:value-of select="hostnames/hostname/@name"/>
        <xsl:value-of select="$separator"/>
        <xsl:value-of select="address/@vendor"/>
        <xsl:value-of select="$separator"/>
	<xsl:value-of select="translate(os/osmatch/@name, ',',' ')"/>
        <xsl:value-of select="$separator"/>
	<xsl:for-each select="ports/port">
	    <xsl:value-of select="$portgroupstart"/>
            <xsl:value-of select="@portid"/>
            <xsl:value-of select="$portseparator"/>
	    <xsl:value-of select="service/@name"/>
	    <xsl:value-of select="$portgroupend"/>
        </xsl:for-each>
	<xsl:value-of select="$separator"/>
        <xsl:value-of select="$endrecord"/>
    </xsl:for-each>

</xsl:template>
</xsl:stylesheet>
