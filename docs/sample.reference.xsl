<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xsd="http://www.w3.org/2001/XMLSchema"
	xmlns:jr="http://jasperreports.sourceforge.net/jasperreports">

<xsl:output method = "html" />
<xsl:param name="version" />

<xsl:template match="/">
<html>
<head>
<title>JasperReports <xsl:value-of select="$version"/> - Sample Reference</title>
<style type="text/css">
.title {
	font-family: Arial, Verdana, Helvetica, sans-serif;
	font-size: 32px;
	font-weight: bold;
}

.toc {
	font-family: Courier New, Courier, serif;
	font-size: 12px;
	font-weight: normal;
}

.name {
	font-family: Courier New, Courier, serif;
	font-size: 16px;
	font-weight: bold;
}

.label {
	font-family: Arial, Verdana, Helvetica, sans-serif;
	font-size: 12px;
	font-weight: bold;
	font-style: italic;
}

.description {
	font-family: Arial, Verdana, Helvetica, sans-serif;
	font-size: 12px;
	font-weight: normal;
}

.value {
	font-family: Courier New, Courier, serif;
	font-size: 12px;
	font-weight: normal;
}

.element {
	font-family: Courier New, Courier, serif;
	font-size: 12px;
	font-weight: normal;
}

.attribute {
	font-family: Courier New, Courier, serif;
	font-size: 12px;
	font-weight: bold;
}
</style>
</head>
<body>

<a name="top"/>
<br/>
<span class="title">JasperReports <xsl:value-of select="$version"/> - Sample Reference</span>
<br/>
<br/>

<span class="description">This document lists all the major features of the JasperReports library, as shown in the samples shipped with the project's source code package.</span>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td style="width: 20px;"><br/></td>
    <td><br/></td>
  </tr>
  <xsl:for-each select="sampleReference/category">
  <!-- FIXME this is useless here; check the others
  <xsl:for-each select="content/feature">
    <xsl:sort select="@ref"/>
  </xsl:for-each>
  -->
  <tr>
    <td colspan="2">
      <span class="label"><br/><xsl:value-of select="name"/></span>
    </td>
  </tr>
  <xsl:apply-templates select="content"/>
  </xsl:for-each>
</table>

<table width="100%" cellspacing="0" cellpadding="0" border="0">
  <tr>
    <td style="width: 20px;"><br/></td>
    <td style="width: 20px;"><br/></td>
    <td style="width: 20px;"><br/></td>
    <td style="width: 20px;"><br/></td>
    <td><br/></td>
  </tr>
  <xsl:for-each select="sampleReference/feature">
  <xsl:sort select="@title"/>
  <tr>
    <td colspan="5" align="right"><br/><xsl:element name="a"><xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute></xsl:element><a href="#top" class="toc">top</a></td>
  </tr>
  <tr>
    <td colspan="5"><hr size="1"/></td>
  </tr>
  <tr>
    <td colspan="5"><span class="name"><xsl:value-of select="@title"/></span></td>
  </tr>
  <!-- 
  <tr>
    <td></td>
    <td>
<xsl:apply-templates select="deprecation"/>
    </td>
  </tr>
  -->
  <tr>
    <td></td>
    <td colspan="4"><xsl:apply-templates select="description"/></td>
  </tr>
  <tr>
    <td colspan="5"><br/></td>
  </tr>
  <tr>
    <td></td>
    <td colspan="1" nowrap="true" valign="top"><span class="label">Main Samples</span></td>
    <td></td>
    <td colspan="2">
      <table width="100%" cellspacing="0" cellpadding="0" border="0">
<xsl:for-each select="main/sample">
<!--
<xsl:sort select="@"/>
-->
        <tr>
          <td><xsl:apply-templates select="."/></td>
        </tr>
</xsl:for-each>
      </table>
    </td>
  </tr>
  <tr>
    <td></td>
    <td colspan="1" nowrap="true" valign="top"><span class="label">Secondary Samples</span></td>
    <td></td>
    <td colspan="2">
      <table width="100%" cellspacing="0" cellpadding="0" border="0">
<xsl:for-each select="secondary/sample">
<!--
<xsl:sort select="@"/>
-->
        <tr>
          <td><xsl:apply-templates select="."/></td>
        </tr>
</xsl:for-each>
      </table>
    </td>
  </tr>
  <tr>
    <td></td>
    <td colspan="1"><span class="label">Since</span></td>
    <td></td>
    <td colspan="2"><span class="description"><xsl:value-of select="since"/></span></td>
  </tr>
  </xsl:for-each>
</table>

</body>
</html>
</xsl:template>


<xsl:template match="content">
  <xsl:for-each select="feature">
    <xsl:sort select="@ref"/>
    <xsl:variable name="ref" select="@ref"/>
  <tr>
    <td></td>
    <td>
    <xsl:for-each select="/sampleReference/feature">
      <xsl:if test="@name=$ref">
    <span class="element"><xsl:element name="a"><xsl:attribute name="href">#<xsl:value-of select="@name"/></xsl:attribute><xsl:value-of select="@title"/></xsl:element></span>
	    </xsl:if>
    </xsl:for-each>
    </td>
  </tr>
  </xsl:for-each>
</xsl:template>

<xsl:template match="description">
  <xsl:apply-templates/>
</xsl:template>


<xsl:template match="sample">
  <span class="element"><xsl:element name="a"><xsl:attribute name="href">sample.reference/<xsl:value-of select="text()"/>/index.html</xsl:attribute><xsl:value-of select="concat('/demo/samples/', text())"/></xsl:element></span>
</xsl:template>


<xsl:template match="*" mode="copy">
  <span class="description"><xsl:copy-of select="."/></span>
</xsl:template>


<xsl:template match="text()">
  <span class="description"><xsl:value-of select="."/></span>
</xsl:template>


<xsl:template match="p/text()">
  <p><span class="description"><xsl:value-of select="." disable-output-escaping="yes" /></span></p>
</xsl:template>


<xsl:template match="br">
  <br/>
</xsl:template>


<xsl:template match="a">
  <span class="element"><xsl:element name="a"><xsl:attribute name="href"><xsl:value-of select="./@href"/></xsl:attribute><xsl:attribute name="target">_blank</xsl:attribute><xsl:value-of select="."/></xsl:element></span>
</xsl:template>


<xsl:template match="api">
  <span class="element"><xsl:element name="a"><xsl:attribute name="href">http://jasperreports.sourceforge.net/api/<xsl:value-of select="./@href"/></xsl:attribute><xsl:attribute name="target">_blank</xsl:attribute><xsl:value-of select="."/></xsl:element></span>
</xsl:template>


<xsl:template match="code">
  <xsl:element name="code"><xsl:apply-templates/></xsl:element>
</xsl:template>


<xsl:template match="ul">
  <xsl:element name="ul"><xsl:apply-templates/></xsl:element>
</xsl:template>


<xsl:template match="ol">
  <xsl:element name="ol"><xsl:apply-templates/></xsl:element>
</xsl:template>


<xsl:template match="li">
  <xsl:element name="li"><xsl:apply-templates/></xsl:element>
</xsl:template>


</xsl:stylesheet>
