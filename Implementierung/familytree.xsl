<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:html="http://www.w3.org/1999/xhtml">
    <xsl:output method="xml" encoding="UTF-8" doctype-system="familytree.dtd"/>
    <xsl:template match="/familytree">
        <html:html>
            <html:head>
                <html:title>Stammbaum</html:title>
                <html:link type="text/css" rel="stylesheet" href="familytree.css"/>
                <html:link type="text/css" rel="stylesheet" href="table.css"/>
                <html:link rel="icon" type="image/png" href="media/img/logo_small.png"/>
            </html:head>
            <html:body>
                <html:div id="bodydiv">

                    <!-- Header -->
                    <html:header>
                        <html:a href="index.html">
                            <html:img id="logo_small" src="media/img/Familytree_small.png" width="200"
                                      alt="das Logo mit einem Baum und einer kleinen Familie"/>
                        </html:a>
                    </html:header>

                    <!-- Navbar -->
                    <html:nav>
                        <html:ul id="menu">
                            <html:li class="menu_item">
                                <html:a class="menu_link" href="home.html">Home</html:a>
                            </html:li>
                            <html:li id="menu_item">
                                <html:a id="menu_link_selected" href="familytree.xml">Der Stammbaum</html:a>
                            </html:li>
                            <html:li class="menu_item">
                                <html:a class="menu_link" href="create.html">Erstellen</html:a>
                            </html:li>
                            <html:li class="menu_item">
                                <html:a class="menu_link" href="imprint.html">Impressum</html:a>
                            </html:li>
                        </html:ul>
                    </html:nav>

                    <!-- Main content -->
                    <html:main>
                        <html:h1>Auflistung</html:h1>

                        <!-- Persons table-->
                        <html:h2>Personen</html:h2>
                        <html:table class="table">
                            <html:tr class="table_head_row">
                                <html:th class="table_head_cell">PID</html:th>
                                <html:th class="table_head_cell">Forename</html:th>
                                <html:th class="table_head_cell">Surname</html:th>
                                <html:th class="table_head_cell">Geschl.</html:th>
                                <html:th class="table_head_cell">Geb. am</html:th>
                                <html:th class="table_head_cell">Todestag</html:th>
                                <html:th class="table_head_cell">Ehepartner</html:th>
                            </html:tr>
                            <xsl:for-each select="//person">
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
                                            <xsl:when test="@sex = 'M'">männl.</xsl:when>
                                            <xsl:otherwise>weibl.</xsl:otherwise>
                                        </xsl:choose>
                                    </html:td>
                                    <html:td class="table_content_cell">
                                        <xsl:value-of select="@birth_date"/>
                                    </html:td>
                                    <html:td class="table_content_cell">
                                        <xsl:choose>
                                            <xsl:when test="not(@birth_date)">-</xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="@birth_date"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </html:td>
                                    <html:td class="table_content_cell">
                                        <xsl:choose>
                                            <xsl:when test="not(@death_date)">-</xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="@death_date"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </html:td>
                                    <html:td class="table_content_cell">
                                        <xsl:for-each select="key('inlaw', @partner)">
                                            <xsl:value-of select="@forename"/>&#160;
                                            <xsl:value-of select="@surname"/>
                                        </xsl:for-each>
                                    </html:td>
                                </html:tr>
                            </xsl:for-each>
                        </html:table>

                        <!-- Partners table-->
                        <html:h2>Zugeheiratete</html:h2>
                        <html:table class="table">
                            <html:tr id="table_head_row">
                                <html:th class="table_head_cell">PID</html:th>
                                <html:th class="table_head_cell">Forename</html:th>
                                <html:th class="table_head_cell">Surname</html:th>
                                <html:th class="table_head_cell">Geschl.</html:th>
                                <html:th class="table_head_cell">Geb. am</html:th>
                                <html:th class="table_head_cell">Todestag</html:th>
                            </html:tr>

                            <!-- Inlaws -->
                            <xsl:for-each select="//inlaw">
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
                                            <xsl:when test="@sex = 'M'">männl.</xsl:when>
                                            <xsl:otherwise>weibl.</xsl:otherwise>
                                        </xsl:choose>
                                    </html:td>
                                    <html:td class="table_content_cell">
                                        <xsl:choose>
                                            <xsl:when test="not(@birth_date)">-</xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="@birth_date"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </html:td>
                                    <html:td class="table_content_cell">
                                        <xsl:choose>
                                            <xsl:when test="not(@death_date)">-</xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="@death_date"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </html:td>
                                </html:tr>
                            </xsl:for-each>
                        </html:table>

                        <!-- Familytree -->
                        <html:h1>Stammbaum</html:h1>

                    </html:main>
                </html:div>
            </html:body>
        </html:html>
    </xsl:template>
</xsl:stylesheet>