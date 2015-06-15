<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      xmlns:html="html">
 <!-- <xsl:output method="xml" encoding ="UTF-8"
     doctype-public="Public-ID der Ausgabedateigrammatik"
     doctype-system="System-ID der Ausgabedateigrammatik"/> 
 -->
 <!--Templates, welche die genauen Transformationen beschreiben -->

  <xsl:template match="/">
     
   
    <html>
    
    
      <head>
        <title>Stammbaum</title>
        <link type="text/css" rel="stylesheet" href="familytree.css"/> 
      </head>
      
      
      <body>
        <div id="bodydiv">
      
          <header>
            <!--Logo oder aehnliches-->
          </header>
          
          <nav>
            <!-- Evtl. Navigation Bar -->
            <ul id="menu">
              <li id="menu_item"><a id="menu_link" href="micha.xml">Home</a></li>
              <li id="menu_item"><a id="menu_link" href="micha.xml">Impressum</a></li>
            </ul>
          </nav>
          
          <main>
            <!-- Content -->
            
          </main>
        
        </div>
        
      </body>
      
      
    </html> 
    
    
    
    
    
  </xsl:template>

</xsl:stylesheet>