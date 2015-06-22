<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:html="http://www.w3.org/1999/xhtml">

    <xsl:template match="/familytree">
        <html:html>
            <html:head>
                <html:title>Stammbaum</html:title>
                <html:link type="text/css" rel="stylesheet" href="familytree.css"/>
                <html:link rel="icon" type="image/png" href="media/img/logo_small.png"/>
            </html:head>
            <html:body>
                <html:div id="bodydiv">
                    <html:header>
                        <html:img src="media/img/logo.png" width="300px" height="150px"/>
                    </html:header>
                    <html:nav>
                        <html:ul id="menu">
                            <html:li class="menu_item">
                                <html:a class="menu_link" href="home.html">Home</html:a>
                            </html:li>
                            <html:li class="menu_item">
                                <html:a id="menu_link_selected" href="familytree_1.xml">Der Stammbaum</html:a>
                            </html:li>
                            <html:li class="menu_item">
                                <html:a class="menu_link" href="erstellen.html">Erstellen</html:a>
                            </html:li>
                            <html:li class="menu_item">
                                <html:a class="menu_link" href="impressum.html">Impressum</html:a>
                            </html:li>
                        </html:ul>
                    </html:nav>
                    <html:main>
                        <!-- Content -->
                        <html:h1>Stammbaum</html:h1>
                        <html:table id="table">
                            <html:tr id="table_head_row">
                                <html:th class="table_head_cell">PID</html:th>
                                <html:th class="table_head_cell">Forename</html:th>
                                <html:th class="table_head_cell">Surname</html:th>
                                <html:th class="table_head_cell">Birthdate</html:th>
                                <html:th class="table_head_cell">Geschlecht</html:th>
                            </html:tr>
                            <xsl:for-each select="person">
                                <html:tr class="table_content_row">
                                    <html:td class="table_content_cell">
                                        <xsl:value-of select="@pid"/>
                                    </html:td>
                                    <html:td class="table_content_cell">
                                        <xsl:value-of select="@forename"/>
                                    </html:td>
                                    <html:td class="table_content_cell">
                                        <xsl:value-of select="@surname"/>
                                    </html:td>
                                    <html:td class="table_content_cell">
                                        <xsl:choose>
                                            <xsl:when test="not(@birthdate)">
                                                keine Angabe
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="@birthdate"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </html:td>
                                    <html:td class="table_content_cell">
                                        <xsl:choose>
                                            <xsl:when test="@sex = 'M'">männlich</xsl:when>
                                            <xsl:otherwise>weiblich</xsl:otherwise>
                                        </xsl:choose>
                                    </html:td>
                                </html:tr>
                            </xsl:for-each>
                        </html:table>
                    </html:main>
                </html:div>
            </html:body>
        </html:html>
    </xsl:template>
</xsl:stylesheet>