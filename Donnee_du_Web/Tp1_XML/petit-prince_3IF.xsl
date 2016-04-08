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
	But du TP du <xsl:value-of select="date"/> : <xsl:value-of select="but"/>
	<br/>
	Auteur(s) :  
	<xsl:for-each select="mise_en_forme_par/auteur">
		<xsl:value-of select="."/>
		<xsl:choose>
		<xsl:when test="following-sibling::*"> 
		<xsl:if test="@NoBinome!=following::*/@NoBinome"> (<xsl:value-of select="@NoBinome"/>) </xsl:if>
		&amp; 
		</xsl:when>
		<xsl:otherwise>
		<xsl:if test="@NoBinome!=preceding::*/@NoBinome"> (<xsl:value-of select="@NoBinome"/>) </xsl:if>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:for-each>
	<br/>
	Email du responsable : <xsl:value-of  select="email"/>
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
	<span style="color:brown; font-style:italic;" >
	<xsl:apply-templates/>
	</span>
	</xsl:template>

</xsl:stylesheet>


