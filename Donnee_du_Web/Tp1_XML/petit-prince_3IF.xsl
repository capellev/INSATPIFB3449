<?xml version="1.0" encoding="UTF-8"?>

<!-- New document created with EditiX at Fri Apr 08 15:22:26 CEST 2016 -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html"/>
	
	<xsl:template match="/">
	<html>
	<head>
	<title>
	<xsl:value-of select="//titre"/>
	<xsl:text> de </xsl:text>
	... 
	</title>
	</head>
	<body style="background-color:white;">
	<xsl:apply-templates/>
	</body>
	</html>
	</xsl:template>
	
	<xsl:template match="titre">
	<h1 style="text-align:center; color:blue;">
	<xsl:apply-templates/>
	</h1>
	</xsl:template>
	
	<xsl:template match="texte/entete/infos/auteur">
	<br/>
	<h2 style="text-align:center; font-style:italic;" >
	<xsl:apply-templates/>
	</h2>
	<br/>
	</xsl:template>
	
	<xsl:template match="infos">
	<blockquote style="color:darkgreen;" >
	But du TP du <xsl:value-of select="@date"/> : <xsl:value-of select="@but"/>
	<hr/>
	<xsl:apply-templates/>
	</blockquote>
	</xsl:template>
	
	<xsl:template match="image">
	<div align="center">
	<img>
	<xsl:attribute name="src">
	<xsl:value-of select="@chemin"/>
	</xsl:attribute>
	</img>
	</div>
	</xsl:template>
	
	
	<xsl:template match="paragr">
	<p>
	<xsl:apply-templates/>
	</p>
	</xsl:template>
	
	<xsl:template match="phrase[@langue='hu']">
	<xsl:if test="position() = 1">
	</xsl:if>
	<span style="color:brown; font-style:italic;" >
	<xsl:value-of select="."/>
	</span>
	</xsl:template>
	
	<xsl:template match="paragr[@type='dialogue']">
	<table cellspacing="50" >
	<td>
	<table border="1" width="600" align="center" cellpadding="10" >
	<xsl:for-each select="./phrase[@langue='fr']">
	<tr>
		<td><img src="images/{@locuteur}.png"/></td>
		<td><xsl:apply-templates select="."/></td>
	</tr>
	</xsl:for-each>
	</table>
	</td>
	<td>
	<table border="1" width="600" align="center" cellpadding="10"  >
	<xsl:for-each select="./phrase[@langue='hu']">
	<tr>
		<td><img src="images/{@locuteur}.png"/></td>
		<td><xsl:apply-templates select="."/></td>
	</tr>
	</xsl:for-each>
	</table>
	</td>
	</table>
	</xsl:template>
	
	<xsl:template match="phrase[@langue='fr']">
	<xsl:choose>
	<xsl:when test="contains(text(),'mouton')">
	<span style="font-weight:bold; font-size:24">
	<xsl:value-of select="."/>
	<img src="images/moutonDessin.png" alt="unMouton"/>
	</span>
	</xsl:when>
	<xsl:otherwise>
	<xsl:value-of select="."/>
	</xsl:otherwise>
	</xsl:choose>
	</xsl:template>
	
</xsl:stylesheet>


