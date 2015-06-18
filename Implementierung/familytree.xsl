<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
        <link rel="icon" 
              type="image/png" 
              href="media/img/logo_small.png"/>
      </head>
      
      
      <body>
        <div id="bodydiv">
      
          <header>
            <img src="media/img/logo.png" width="300px" heigth="150px"/>
          </header>
          
          <nav>
            <!-- Evtl. Navigation Bar -->
            <ul id="menu">
              <li id="menu_item"><a id="menu_link" href="home.html">Home</a></li>
              <li id="menu_item"><a id="menu_link_selected" href="familytree_1.xml">Der Stammbaum</a></li>
              <li id="menu_item"><a id="menu_link" href="erstellen.html">Erstellen</a></li>
              <li id="menu_item"><a id="menu_link" href="impressum.html">Impressum</a></li>
            </ul>
          </nav>
          
          <main>
            <!-- Content -->
            <h1>Stammbaum</h1>
            
            
          </main>
        
        </div>
      </body>
      
      
    </html> 
  </xsl:template>
</xsl:stylesheet>