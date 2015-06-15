<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      xmlns:html="html">
 <xsl:output method="xml" encoding ="UTF-8"
     doctype-public="Public-ID der Ausgabedateigrammatik"
     doctype-system="System-ID der Ausgabedateigrammatik"/> 
 
 <!--Templates, welche die genauen Transformationen beschreiben -->

  <xsl:template match="/">
   
   
   
    <html:html>
    
    
      <html:head>
        <html:title>Stammbaum</html:title>
        <html:link type="text/css" rel="stylesheet" href="familytree.css"/> 
      </html:head>
      
      
      <html:body>
      
        <html:header>
          <!--Logo oder aehnliches-->
          *Cooles Logo*
        </html:header>
        
        <html:nav>
          <!-- Evtl. Navigation Bar -->
          <ul>
            <li>Home</li>
          </ul>
        </html:nav>
        
        <html:main>
          <!-- Content -->
          
        </html:main>
        
      </html:body>
      
      
    </html:html> 
    
    
    
    
    
  </xsl:template>

</xsl:stylesheet>