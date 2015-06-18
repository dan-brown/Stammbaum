<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:html="http://www.w3.org/1999/xhtml">
 <!-- <xsl:output method="xml" encoding ="UTF-8"
     doctype-public="Public-ID der Ausgabedateigrammatik"
     doctype-system="System-ID der Ausgabedateigrammatik"/>
 -->
 <!--Templates, welche die genauen Transformationen beschreiben -->

  <xsl:template match="/">
    <html:html>


      <html:head>
        <html:title>Stammbaum</html:title>
        <html:link type="text/css" rel="stylesheet" href="familytree.css"/>
        <html:link rel="icon"
              type="image/png"
              href="media/img/logo_small.png"/>
      </html:head>


      <html:body>
        <html:div id="bodydiv">

          <html:header>
            <html:img src="media/img/logo.png" width="300px" height="150px"/>
          </html:header>

          <html:nav>
            <!-- Evtl. Navigation Bar -->
            <ul id="menu">
              <li id="menu_item"><a id="menu_link" href="home.html">Home</a></li>
              <li id="menu_item"><a id="menu_link_selected" href="familytree_1.xml">Der Stammbaum</a></li>
              <li id="menu_item"><a id="menu_link" href="erstellen.html">Erstellen</a></li>
              <li id="menu_item"><a id="menu_link" href="impressum.html">Impressum</a></li>
            </ul>
          </html:nav>

          <html:main>
            <!-- Content -->
            <html:h1>Stammbaum</html:h1>

              <xsl:for-each select="familytree/person">

              </xsl:for-each>


          </html:main>

        </html:div>
      </html:body>


    </html:html>
  </xsl:template>
</xsl:stylesheet>