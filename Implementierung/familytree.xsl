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
            <img src="media/img/logo.png" width="300px" heigth="150px"/>
          </header>
          
          <nav>
            <!-- Evtl. Navigation Bar -->
            <ul id="menu">
              <li id="menu_item"><a id="menu_link" href="micha.xml">Home</a></li>
              <li id="menu_item"><a id="menu_link" href="micha.xml">Tooooooood</a></li>
              <li id="menu_item"><a id="menu_link" href="micha.xml">oder so</a></li>
              <li id="menu_item"><a id="menu_link" href="impressum.html">Impressum</a></li>
            </ul>
          </nav>
          
          <main>
            <!-- Content -->
            <h1>Stammbaum</h1>
          </main>
          
          <footer>
            Für externe Links übernehmen wir keine Verantwortung!
          </footer>
        
        </div>
      </body>
      
      
    </html> 
    
    
    
    
    
  </xsl:template>

</xsl:stylesheet>