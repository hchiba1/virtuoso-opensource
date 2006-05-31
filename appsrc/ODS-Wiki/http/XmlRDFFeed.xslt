<?xml version="1.0"?>
<!--
 -
 -  $Id$
 -
 -  This file is part of the OpenLink Software Virtuoso Open-Source (VOS)
 -  project.
 -
 -  Copyright (C) 1998-2006 OpenLink Software
 -
 -  This project is free software; you can redistribute it and/or modify it
 -  under the terms of the GNU General Public License as published by the
 -  Free Software Foundation; only version 2 of the License, dated June 1991.
 -
 -  This program is distributed in the hope that it will be useful, but
 -  WITHOUT ANY WARRANTY; without even the implied warranty of
 -  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 -  General Public License for more details.
 -
 -  You should have received a copy of the GNU General Public License along
 -  with this program; if not, write to the Free Software Foundation, Inc.,
 -  51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
 -
-->
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xhtml="http://www.w3.org/TR/xhtml1/strict"
                xmlns:wv="http://www.openlinksw.com/Virtuoso/WikiV/"
                xmlns:fn2="http://www.w3.org/2004/07/xpath-functions">
<xsl:output
  method="xml"
  encoding="utf-8"  />

 <xsl:template match="History">
   <!--RDF based XML document generated By OpenLink Virtuoso-->
   <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
     <rss:channel 
       xmlns:rss="http://purl.org/rss/1.0/" 
       xmlns:dc="http://purl.org/metadata/dublin_core#"
       rdf:about="{@About}">
       <dc:title xmlns:dc="http://purl.org/dc/elements/1.1/"><xsl:value-of select="@Title"/></dc:title>
       <dc:description xmlns:dc="http://purl.org/dc/elements/1.1/" />
       <dc:creator xmlns:dc="http://purl.org/dc/elements/1.1/"><xsl:value-of select="@email"/></dc:creator>
       <dc:date xmlns:dc="http://purl.org/dc/elements/1.1/"><xsl:value-of select="@date"/></dc:date>
       <rss:generator>Virtuoso Universal Server 04.00.2814</rss:generator>
       <rss:webMaster><xsl:value-of select="@email"/></rss:webMaster>
       <rss:cloud />
       <rss:items>
         <rdf:Seq>
           <xsl:apply-templates select="Entry">
             <xsl:with-param name="header-only-p">1</xsl:with-param>
           </xsl:apply-templates>  
         </rdf:Seq>
       </rss:items>
     </rss:channel>
     <xsl:apply-templates select="Entry"/>
   </rdf:RDF>
 </xsl:template>

 <xsl:template match="Entry">
   <xsl:param name="header-only-p"/>
   <xsl:choose>
     <xsl:when test="$header-only-p = 1">
       <rdf:li rdf:resource="{@Link}"/>
     </xsl:when>
     <xsl:otherwise>
       <rss:item 
         xmlns:rss="http://purl.org/rss/1.0/" 
         xmlns:dc="http://purl.org/metadata/dublin_core#"
         rdf:about="{@Link}">
         <dc:title xmlns:dc="http://purl.org/dc/elements/1.1/"><xsl:value-of select="@Title"/></dc:title>
         <rss:comments><xsl:value-of select="@Comments"/></rss:comments>
         <slash:comments xmlns:slash="http://purl.org/rss/1.0/modules/slash/">0</slash:comments>
         <dc:date xmlns:dc="http://purl.org/dc/elements/1.1/"><xsl:value-of select="@Created"/></dc:date>
         <dc:description xmlns:dc="http://purl.org/dc/elements/1.1/">
           <xsl:copy-of select="*"/>
         </dc:description>
         <!--         <content:encoded xmlns:content="http://purl.org/rss/1.0/modules/content/">
           <xsl:value-of select="*"/>
         </content:encoded> -->
         <rss:ts><xsl:value-of select="@Modified"/></rss:ts>
       </rss:item>
     </xsl:otherwise>
   </xsl:choose>
 </xsl:template>
 
</xsl:stylesheet>
