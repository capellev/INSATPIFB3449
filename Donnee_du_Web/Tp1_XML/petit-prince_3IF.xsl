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
	
	<xsl:template>
	<h2 style="" ></h2>
	</xsl:template>

</xsl:stylesheet>


